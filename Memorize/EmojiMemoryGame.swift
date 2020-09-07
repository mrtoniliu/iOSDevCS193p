//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by ShinyMimikyu on 01/09/2020.
//

import SwiftUI // This is a ViewModel

func createCardContent(pairIndex: Int) -> String {
    return "Hello"
}

class EmojiMemoryGame: ObservableObject {
    // @Published -> property wrapper
    // if game changed, it will send to observer
    @Published private var game: MemoryGame<String>
    var theme = themes.randomElement()!

    // The function of type.
    static func createEmojiMemoryGame(theme: Theme) -> MemoryGame<String> {
//        let emojis: Array<String> = ["👻", "🎃", "🍬", "💡", "🎇"]
        let emojis = theme.emojiList.shuffled()
//        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)  ){ pairIndex in
        return MemoryGame<String>(numberOfPairsOfCards: theme.numPairOfCards == nil ? Int.random(in: 1...emojis.count) : theme.numPairOfCards!){ pairIndex in
            return emojis[pairIndex]
        }
    }
//    private(set) var game: MemoryGame<String> -> only Modified by EmojiMemoryGame
    
//    var objectWillChange: ObservableObjectPublisher
    
    init() {
        game = EmojiMemoryGame.createEmojiMemoryGame(theme: theme)
    }
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    var score: Int {
        return game.score
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    func newGame() {
        theme = themes.randomElement()!
        game = EmojiMemoryGame.createEmojiMemoryGame(theme: theme)
    }
}


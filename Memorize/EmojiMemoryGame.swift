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
    @Published private var game: MemoryGame<String>  = EmojiMemoryGame.createMemoryGame()// -> cannot be access by others
        
    // The function of type.
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🍬", "💡", "🎇"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)  ){ pairIndex in
            return emojis[pairIndex]
        }
    }
//    private(set) var game: MemoryGame<String> -> only Modified by EmojiMemoryGame
    
//    var objectWillChange: ObservableObjectPublisher
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card)
    }
    
    func resetGame() {
        game = EmojiMemoryGame.createMemoryGame()
    }
    
}

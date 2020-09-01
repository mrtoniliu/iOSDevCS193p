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

class EmojiMemoryGame {
    
    private var game: MemoryGame<String>  = EmojiMemoryGame.createMemoryGame()// -> cannot be access by others
        
    // The function of type.
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🍬"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
//    private(set) var game: MemoryGame<String> -> only Modified by EmojiMemoryGame
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
}

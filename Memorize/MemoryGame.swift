//
//  MemoryGame.swift
//  Memorize
//
//  Created by ShinyMimikyu on 01/09/2020.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0 ..< numberOfPairsOfCards {
            let content = cardContentFactory(i)
            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: i*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // can be decided when create game
        var id: Int
    }
}

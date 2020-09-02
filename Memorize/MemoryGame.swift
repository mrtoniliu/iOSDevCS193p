//
//  MemoryGame.swift
//  Memorize
//
//  Created by ShinyMimikyu on 01/09/2020.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    mutating func choose(_ card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].flip()
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
    
    func index(of card: Card) -> Int { // (external name internal name: Card)
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO: Need to fix this
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // can be decided when create game
        var id: Int
        
        mutating func flip() {
            isFaceUp = !isFaceUp
        }
    }
}

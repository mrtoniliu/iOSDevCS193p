//
//  ContentView.swift
//  Memorize
//
//  Created by ShinyMimikyu on 30/08/2020.
//

import SwiftUI

struct ContentView: View {
    var gameModel : EmojiMemoryGame
        
    var body: some View {
        HStack() {
            ForEach(gameModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    gameModel.choose(card: card)
                })
            }
        }
        // Passdown these functions to Views in ZStack
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack () {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameModel: EmojiMemoryGame())
    }
}

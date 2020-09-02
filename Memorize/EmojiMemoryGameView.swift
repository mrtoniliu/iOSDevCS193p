//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by ShinyMimikyu on 30/08/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameModel : EmojiMemoryGame
        
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
            .aspectRatio(3/2, contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader {geometry in
            ZStack () {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(gameModel: EmojiMemoryGame())
    }
}

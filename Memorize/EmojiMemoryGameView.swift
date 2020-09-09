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
        Grid(gameModel.cards) { card in
                CardView(card: card).onTapGesture(perform: {
                    gameModel.choose(card: card)
                })
                .padding(5)
        }
        // Passdown these functions to Views in ZStack
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack () {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(gameModel:game)
    }
}

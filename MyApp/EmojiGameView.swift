//
//  ContentViewL.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

struct EmojiGameView: View {
    
    @ObservedObject var game:EmojiMemoryGame

    var body: some View {
    
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(game.cards){ card in
                        Card(card: card)
                            .aspectRatio(2/3,contentMode:.fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                        
                        
                    }
                }
            }.foregroundColor(.red)
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiGameView(game: game)
            .preferredColorScheme(.light)
    }
}

struct Card:View {
    
    
    let card:MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader(content: { geometry in
            ZStack{
                        Pie(startAngle:Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90)).padding(5).opacity(0.4)
                        
                        Text(card.content)
                            .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                            .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                            .font(Font.system(size: drawingConstent.fontSize)).scaleEffect(scale(thatFits: geometry.size))
            }.cardify(isFaceUp: card.isFaceUp).opacity((card.isMatched == true && (card.isFaceUp == false)) ? 0 : 1)
        })
    }
    
    private func scale(thatFits size: CGSize)-> CGFloat{
        min(size.width, size.height)/drawingConstent.fontSize * drawingConstent.radio
    }
    
    private struct drawingConstent{
        static let radio:CGFloat = 0.7
        static let fontSize:CGFloat = 32
    
        
    }
}

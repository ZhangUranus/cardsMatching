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
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
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
                let shape = RoundedRectangle(cornerRadius: drawingConstent.cornerRadius)
                    
                    if card.isFaceUp {
                        shape.fill().foregroundColor(.white)
                        shape.strokeBorder(lineWidth: drawingConstent.lineWidth)
                        Text(card.content)
                            .font(Font.system(size:  min( geometry.size.height, geometry.size.width) * drawingConstent.radio))
                        
                    } else if card.isMatched{
                        shape.opacity(0)
                    }
                    else{
                        shape.fill().foregroundColor(.red)
                        
                    }
                
                }
        })
    }
    
    private struct drawingConstent{
        static let cornerRadius:CGFloat = 20
        static let lineWidth:CGFloat = 5
        static let radio:CGFloat = 0.7
        
    }
}

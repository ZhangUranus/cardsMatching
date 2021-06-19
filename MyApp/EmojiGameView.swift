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
        ZStack{
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 10)
                Text(card.content)
                    .font(.largeTitle)
                
            } else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill().foregroundColor(.red)
                
            }
            
        }
        .foregroundColor(.red)
    }
}

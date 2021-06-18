//
//  ContentViewL.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var videModle:EmojiMemoryGame

    var body: some View {
    
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(videModle.cards){ card in
                        Card(card: card)
                            .aspectRatio(2/3,contentMode:.fit)
                            .onTapGesture {
                                videModle.choose(card)
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
        ContentView(videModle: game)
            .preferredColorScheme(.dark)
        ContentView(videModle: game)
            .preferredColorScheme(.light)
    }
}

struct Card:View {
    
    
    let card:MemmoryGame<String>.Card
    
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

//
//  ContentViewL.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

struct ContentView: View {
    
    var videModle:EmojiMemoryGame

    var body: some View {
    
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .padding(.bottom)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 150))]){
                    ForEach(videModle.cards){ emoji in
                        Card(content: "").aspectRatio(2/3,contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)}
                }
            }
            Spacer(minLength: 20)
            
            HStack {
                Button(action: {
                    
                    if(emojiAccount<emojis.count){
                        emojiAccount += 1
                    }
                    
                    
                }, label: {
                    VStack {
                        Image(systemName: "plus.circle")
    
                    }
                    
                })
                
                Spacer()
                Button(action: {
                    if(emojiAccount>1){
                        emojiAccount -= 1
                    }
                }, label:{
                
                    VStack {
                        Image(systemName: "minus.circle")

                    }
                    
                })
                
            }.font(.largeTitle)
            .padding(.horizontal)
            
        }
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
    
    
    
    var content:String
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            
            if isFaceUp {
                
                shape.fill().foregroundColor(.white)
            
                shape.strokeBorder(lineWidth: 10)
                Text(content)
                    .font(.largeTitle)
                
            }
            else{
                shape.fill().foregroundColor(.red)
                
            }
            
        }.onTapGesture {
            
        }
        .foregroundColor(.red)
    }
}

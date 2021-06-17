//
//  ContentViewL.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🐝","🐗","🐴","🪱","🐠","🐕","⚾️","🏓","🏏","🛵","🛥","🚧","🚦",
                  "🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚲","🚚","🪝"]
    
    @State var emojiStart = 0
    @State var emojiEnd = 6
    
    var body: some View {
    
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .padding(.bottom)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 150))]){
                    ForEach(emojis[emojiStart..<emojiEnd],id:\.self){ emoji in
                        Card(content: emoji).aspectRatio(2/3,contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)}
                }
            }
            Spacer(minLength: 20)
            
            HStack {
                Button(action: {
                    emojiStart = 0
                    emojiEnd = 9
                    
                    emojis[emojiStart..<emojiEnd].shuffle()
                    
                }, label: {
                    VStack {
                        Image(systemName: "car")
                        
                        Text("Vehicle")
                            .font(.body)
                    }
                    
                })
                
                Spacer()
                Button(action: {
                    emojiStart = 9
                    emojiEnd = 18
                    emojis[emojiStart..<emojiEnd].shuffle()
                }, label:{
                
                    VStack {
                        Image(systemName: "questionmark.circle")
                        Text("Theme 2")
                            .font(.body)
                    }
                    
                })
                
                Spacer()
                Button(action: {
                    emojiStart = 18
                    emojiEnd = 26
                    emojis[emojiStart..<emojiEnd].shuffle()
                }, label: {
                    VStack {
                        Image(systemName: "questionmark.circle")
                        Text("Theme 3")
                            .font(.body)
                    
                    }
                })
            }.font(.largeTitle)
            .padding(.horizontal)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct Card:View {
    
    @State var isFaceUp:Bool = true
    
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
            isFaceUp = !isFaceUp
        }
        .foregroundColor(.red)
    }
}

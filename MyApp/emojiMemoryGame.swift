//
//  emojiMemoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import SwiftUI


class EmojiMemoryGame:ObservableObject{
    
   
    //var somethingWillChanged:ObjectWillChangePublisher

    static let emojis = ["🐝","🐗","🐴","🪱","🐠","🐕","⚾️","🏓","🏏","🛵","🛥","🚧","🚦",
                     "🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚲","🚚","🪝"]

    
    @Published private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairCards: 4){ index in
         emojis[index]
    }
    
    var cards:Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func choose (_ card: MemoryGame<String>.Card) {
        model.chooseCard(card)
    }
    
}


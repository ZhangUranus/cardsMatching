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

    
    @Published private var model: MemmoryGame<String> = MemmoryGame<String>(numberOfPairCards: 4){ index in
         emojis[index]
    }
    
    var cards:Array<MemmoryGame<String>.Card>{
        model.cards
    }
    
    func choose (_ card: MemmoryGame<String>.Card) {
        model.chooseCard(card)
    }
    
}


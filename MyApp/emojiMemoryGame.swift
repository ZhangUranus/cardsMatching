//
//  emojiMemoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import SwiftUI


class EmojiMemoryGame:ObservableObject{
    
   
    //var somethingWillChanged:ObjectWillChangePublisher
    
    typealias Card = MemoryGame<String>.Card

    static let emojis = ["🐝","🐗","🐴","🪱","🐠","🐕","⚾️","🏓","🏏","🛵","🛥","🚧","🚦",
                     "🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚲","🚚","🪝"]

    
    @Published private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairCards: 6){ index in
         emojis[index]
    }
    
    var cards:Array<Card>{
        model.cards
    }
    
    func choose (_ card: Card) {
        model.chooseCard(card)
    }
    
}


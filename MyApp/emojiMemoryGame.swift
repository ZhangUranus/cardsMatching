//
//  emojiMemoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import SwiftUI


class EmojiMemoryGame{
    
   

    static let emojis = ["🐝","🐗","🐴","🪱","🐠","🐕","⚾️","🏓","🏏","🛵","🛥","🚧","🚦",
                     "🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚑","🚒","🚐","🚲","🚚","🪝"]

    
    private(set) var model:MemmoryGame<String> = MemmoryGame<String>(numberOfPairCards: 4){ index in
         emojis[index]
    }
    
    var cards:Array<MemmoryGame<String>.Card>{
        model.cards
    }
    
}


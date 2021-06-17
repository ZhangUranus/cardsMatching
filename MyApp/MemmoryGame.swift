//
//  MemmoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import Foundation

struct MemmoryGame<CardContent>{
    
    var cards: [Card]
    
    func chooseCard(_ card: Card){
        
    }
    
    init(numberOfPairCards:Int, createContent: (Int)->CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairCards{
            
            let ct:CardContent = createContent(index)
            cards.append(Card(isFaceUp: false, isMatched: false, content:ct))
            cards.append(Card(isFaceUp: false, isMatched: false, content:ct))
        }
    }
    
    struct Card {
       
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
    
}

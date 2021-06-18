//
//  MemmoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import Foundation

struct MemmoryGame<CardContent>{
    
    var cards: [Card]
    
    mutating func chooseCard(_ card: Card){
        let choosenIndex = index(of: card)
        cards[choosenIndex]
        .isFaceUp.toggle()
        
        print(cards)
    }
    
    func index(of card:Card)->Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id{
                return index
            }
        }
        
        return 0
    }
    
    init(numberOfPairCards:Int, createContent: (Int)->CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairCards{
            
            let ct:CardContent = createContent(index)
            cards.append(Card(content:ct,id:index*2))
            cards.append(Card(content:ct,id:index*2+1))
        }
    }
    
    struct Card:Identifiable{
        
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
    
}

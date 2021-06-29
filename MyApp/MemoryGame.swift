//
//  MemmoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import Foundation

struct MemoryGame<CardContent:Equatable>{
    
    var cards: [Card]
    
    var indexOfTheOneAndOnlyOneFacedUp:Int?{
        get{cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly}
        
        set{if(newValue != nil){ cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}}}
    }
    
    mutating func chooseCard(_ card: Card){
        
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id}), !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched {
            if let poteticalIndexMatched = indexOfTheOneAndOnlyOneFacedUp{
                if(cards[poteticalIndexMatched].content == cards[choosenIndex].content){
                    cards[choosenIndex].isMatched = true
                    cards[poteticalIndexMatched].isMatched = true
                }
                indexOfTheOneAndOnlyOneFacedUp = nil

                cards[choosenIndex].isFaceUp = true
                
            }else{
                
                indexOfTheOneAndOnlyOneFacedUp = choosenIndex
            }
            
        }
        
        print("choose!")
        
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
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
    
}

extension Array {
    var oneAndOnly: Element?{
        if count ==     1 {
            return first
        }else{
            return nil
        }
    }
}

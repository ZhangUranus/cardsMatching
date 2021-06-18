//
//  MemmoryGame.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-17.
//

import Foundation

struct MemmoryGame<CardContent:Equatable>{
    
    var cards: [Card]
    
    var theIndexOfTheOneAndOnlyOneFacedUp:Int?
    
    mutating func chooseCard(_ card: Card){
        
        if let choosenIndex = cards.firstIndex(where: { $0.id == card.id}), !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched {
            if let poteticalIndexMatched = theIndexOfTheOneAndOnlyOneFacedUp{
                if(cards[poteticalIndexMatched].content == cards[choosenIndex].content){
                    cards[choosenIndex].isMatched = true
                    cards[poteticalIndexMatched].isMatched = true
                }
                theIndexOfTheOneAndOnlyOneFacedUp = nil
                
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                theIndexOfTheOneAndOnlyOneFacedUp = choosenIndex
            }
            
            cards[choosenIndex].isFaceUp.toggle()
        
        }
        //print(cards)
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

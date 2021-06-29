//
//  Cardify.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-29.
//

import SwiftUI

struct Cardify:ViewModifier {
    var isFaceUp:Bool
    
    func body(content:Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: drawingConstent.cornerRadius)
                
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: drawingConstent.lineWidth)
                    
                }  else  {
                    shape.fill().foregroundColor(.red)
                    
                }
            
            content.opacity(isFaceUp ? 1 :0)
            
        }
    }
    
    private struct drawingConstent{
        static let cornerRadius:CGFloat = 20
        static let lineWidth:CGFloat = 5
    } 
}

extension View{
    
    func cardify(isFaceUp:Bool)->some View{
        
        self.modifier(Cardify(isFaceUp:isFaceUp))
    }
}



//
//  Pie.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-24.
//

import SwiftUI

struct Pie:Shape {
    var startAngle:Angle
    var endAngle:Angle
    var clockwise = true
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x:rect.midX,y:rect.midY)
        let radius = min(rect.width,rect.height) / 2
        
        let start = CGPoint(
            x:center.x + radius * CGFloat(cos(startAngle.radians)),
            y:center.y + radius * CGFloat(sin(startAngle.radians))
        )
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise)
        
        p.addLine(to: center)
        return p
    }
    
    
}


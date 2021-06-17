//
//  MyAppApp.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

@main
struct MyAppApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(videModle: game)
        }
    }
}

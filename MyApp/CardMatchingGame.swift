//
//  MyAppApp.swift
//  MyApp
//
//  Created by Lacrimosa on 2021-06-15.
//

import SwiftUI

@main
struct CardMatchingGame: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiGameView(game: game)
        }
    }
}

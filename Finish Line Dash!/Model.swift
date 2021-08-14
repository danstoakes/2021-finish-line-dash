//
//  Model.swift
//  Race!
//
//  Created by Dan Stoakes on 10/08/2021.
//

import SwiftUI
import Foundation

struct Model<BoardGameContent> {
    private(set) var dice: Dice
    private(set) var players: Array<Player>
    private(set) var tiles: Array<Tile>
    
    init() {
        dice = Dice(dotCount: 1)
        players = []
        players.append(Player(id: players.count + 1, name: "Player 1", position: 1, hasTurn: true))
        players.append(Player(id: players.count + 1, name: "Player 2", position: 1, hasTurn: false))
        tiles = []
        
        let colors: [Color] = [.tileOrange, .tileWhite, .tileRed, .tileLGreen, .tileDGreen, .tileYellow]
        
        for i in 1...100 { tiles.append(Tile(index: i, colour: colors[i % colors.count])) }
    }
    
    struct Dice {
        var dotCount: Int
    }
    
    struct Player {
        var id: Int
        var name: String
        var position: Int
        var hasTurn: Bool
        var hasWon: Bool = false
    }
    
    struct Tile: Hashable, Identifiable {
        let id = UUID()
        var index: Int
        var colour: Color
    }
    
    mutating func roll() {
        dice.dotCount = Int.random(in: 1...6)
    }
    
    mutating func move() {
        for n in 0..<players.count {
            players[n].position += players[n].hasTurn ? dice.dotCount : 0
            players[n].hasTurn = !players[n].hasTurn
            
            if players[n].position >= 100 {
                players[n].position = 100
                players[n].hasWon = true
            }
        }
    }
    
    func getCurrentTurn() -> Player {
        if players[0].hasTurn {
            return players[0]
        }
        return players[1]
    }
}

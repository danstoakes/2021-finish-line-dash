//
//  ViewModel.swift
//  Race!
//
//  Created by Dan Stoakes on 10/08/2021.
//

import Foundation

class ViewModel: ObservableObject {
    typealias Tile = Model<String>.Tile
    
    @Published private var model = Model<String>()
    
    var dice: Model<String>.Dice {
        model.dice
    }
    
    var tiles: Array<Model<String>.Tile> {
        model.tiles
    }
    
    var players: Array<Model<String>.Player> {
        model.players
    }
    
    var currentTurn: Model<String>.Player {
        model.getCurrentTurn()
    }
    
    var gameOver: Bool {
        model.players[0].hasWon || model.players[1].hasWon
    }
    
    func roll() {
        model.roll()
    }
    
    func move() {
        model.move()
    }
    
    func restart() {
        model = Model<String>()
    }
}

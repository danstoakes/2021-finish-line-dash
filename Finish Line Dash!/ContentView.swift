//
//  ContentView.swift
//  Finish Line Dash!
//
//  Created by Dan Stoakes on 14/08/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var player1: String = "Player 1"
    var player2: String = "Player 2"
    
    var body: some View {
        VStack {
            ScrollingVGrid(items: viewModel.tiles) {tile in
                tileView(for: tile)
            }
            VStack {
                DiceView(dotCount: viewModel.dice.dotCount)
                    .hidden(viewModel.gameOver, remove: viewModel.gameOver)
                Text("Game over!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .hidden(!viewModel.gameOver, remove: !viewModel.gameOver)
                HStack {
                    Button(action: move, label: {
                        Text(player1)
                    }).disabled(viewModel.currentTurn.name != player1 || viewModel.gameOver)
                    Spacer()
                    Button(action: viewModel.restart, label: {
                        Text("Restart")
                    })
                    Spacer()
                    Button(action: move, label: {
                        Text(player2)
                    }).disabled(viewModel.currentTurn.name != player2 || viewModel.gameOver)
                }
            }
        }.padding()
    }
    
    @ViewBuilder private func tileView(for tile: ViewModel.Tile) -> some View {
        TileView(colour: tile.colour, value: tile.index, hasPlayer1: viewModel.players[0].position == tile.index, hasPlayer2: viewModel.players[1].position == tile.index)
    }
    
    func move () {
        withAnimation {
            viewModel.roll()
        }
        
        withAnimation {
            viewModel.move()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}

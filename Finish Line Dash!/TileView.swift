//
//  TileView.swift
//  Race!
//
//  Created by Dan Stoakes on 10/08/2021.
//

import SwiftUI

struct TileView: View {
    var colour: Color
    var value: Int
    var hasPlayer1: Bool
    var hasPlayer2: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colour)
            Text(String(value))
                .font(.system(size: 18))
                .bold()
                .padding(.vertical, 2.0)
                .padding(.horizontal, 5.0)
                .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity, alignment: .topTrailing)
            HStack {
                PlayerView(colour: Color.green)
                    .hidden(!hasPlayer1, remove: !hasPlayer1)
                PlayerView(colour: Color.red)
                    .hidden(!hasPlayer2, remove: !hasPlayer2)
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 50, maxHeight: .infinity)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            TileView(colour: Color.tileOrange, value: 1, hasPlayer1: true, hasPlayer2: false)
            TileView(colour: Color.tileWhite, value: 2, hasPlayer1: false, hasPlayer2: false)
            TileView(colour: Color.tileRed, value: 3, hasPlayer1: false, hasPlayer2: true)
            TileView(colour: Color.tileLGreen, value: 4, hasPlayer1: false, hasPlayer2: false)
            TileView(colour: Color.tileDGreen, value: 5, hasPlayer1: false, hasPlayer2: false)
            TileView(colour: Color.tileYellow, value: 6, hasPlayer1: false, hasPlayer2: false)
        }
    }
}

extension Color {
    static let tileOrange = Color(UIColor(red: 211/255.0, green: 146/255.0, blue: 54/255.0, alpha: 1))
    static let tileWhite = Color(UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1))
    static let tileRed = Color(UIColor(red: 210/255.0, green: 77/255.0, blue: 71/255.0, alpha: 1))
    static let tileLGreen = Color(UIColor(red: 116/255.0, green: 155/255.0, blue: 103/255.0, alpha: 1))
    static let tileDGreen = Color(UIColor(red: 97/255.0, green: 123/255.0, blue: 35/255.0, alpha: 1))
    static let tileYellow = Color(UIColor(red: 204/255.0, green: 176/255.0, blue: 66/255.0, alpha: 1))
    static let ladderBlack = Color(UIColor(red: 20/255.0, green: 10/255.0, blue: 5/255.0, alpha: 1))
}

extension View {
    @ViewBuilder func hidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}

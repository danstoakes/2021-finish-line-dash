//
//  DiceView.swift
//  Race!
//
//  Created by Dan Stoakes on 10/08/2021.
//

import SwiftUI

struct DiceView: View {
    var dotCount: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .fill(Color.black)
                .frame(width: DrawingConstants.diceFrameSize, height: DrawingConstants.diceFrameSize)
            RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                .fill(Color.tileWhite)
                .frame(width: DrawingConstants.diceFaceSize, height: DrawingConstants.diceFaceSize)
            
            let columns: [GridItem] = Array(repeating: .init(.fixed(12)), count: DrawingConstants.rowColCount)
            let rows: [GridItem] = Array(repeating: .init(.fixed(12)), count: DrawingConstants.rowColCount)
            
            LazyVGrid(columns: columns) {
                LazyHGrid(rows: rows) {
                    Dot(isFilled: [4, 5, 6].contains(dotCount))
                    Dot(isFilled: dotCount == 6)
                    Dot(isFilled: [2, 3, 4, 5, 6].contains(dotCount))
                }
                LazyHGrid(rows: rows) {
                    Dot(isFilled: false)
                    Dot(isFilled: [1, 3, 5].contains(dotCount))
                    Dot(isFilled: false)
                }
                LazyHGrid(rows: rows) {
                    Dot(isFilled: [2, 3, 4, 5, 6].contains(dotCount))
                    Dot(isFilled: dotCount == 6)
                    Dot(isFilled: [4, 5, 6].contains(dotCount))
                }
            }
            .frame(width: DrawingConstants.diceFaceSize, height: DrawingConstants.diceFaceSize, alignment: .center)
        }
    }

    private struct Dot: View {
        var isFilled: Bool
        
        var body: some View {
            Circle()
                .foregroundColor(isFilled ? Color.black : Color.clear)
                .frame(width: 15, height: 15, alignment: .center)
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let rowColCount: Int = 3
        static let diceFrameSize: CGFloat = 100
        static let diceFaceSize: CGFloat = 90
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DiceView(dotCount: 1)
            DiceView(dotCount: 2)
            DiceView(dotCount: 3)
            DiceView(dotCount: 4)
            DiceView(dotCount: 5)
            DiceView(dotCount: 6)
        }
    }
}

//
//  PlayerView.swift
//  Race!
//
//  Created by Dan Stoakes on 12/08/2021.
//

import SwiftUI

struct PlayerView: View {
    var colour: Color
    
    var body: some View {
        Circle()
            .frame(width: 20, height: 20, alignment: .center)
            .foregroundColor(colour)
            .overlay(Circle().stroke(Color.black, lineWidth: 1.5))
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(colour: .green)
    }
}

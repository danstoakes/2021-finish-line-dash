//
//  CheckerboardVGrid.swift
//  Race!
//
//  Created by Dan Stoakes on 12/08/2021.
//

import SwiftUI

struct ScrollingVGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    @State var shouldScroll: Bool = true
    
    var items: [Item]
    var content: (Item) -> ItemView
    
    init (items: [Item], @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.content = content
    }
    
    var body: some View {
        let gridItemLayout = [
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0),
            GridItem(.flexible(), spacing: 0)
        ]
        
        ScrollView(axes, showsIndicators: false) {
            ScrollViewReader { value in
                LazyVGrid(columns: gridItemLayout, spacing: 0) {
                    ForEach(items) { item in
                        content(item)
                            .id(item.id)
                    }
                    .onAppear {
                        // value.scrollTo(items.last?.id)
                    }
                }
                .border(Color.black, width: 3.0)
            }
        }
    }
    
    private var axes: Axis.Set {
        return shouldScroll ? .vertical : []
    }
}

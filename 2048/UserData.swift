//
//  UserData.swift
//  2048
//
//  Created by 凶手 on 2020/12/29.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI

class Main: ObservableObject{ // 实时刷新
    @Published var Cards: [Card]
    
    init()
    {
        self.Cards = []
        self.Cards.append(Card(number: 2, coordinates: (0,1), id: self.Cards.count))
        self.Cards.append(Card(number: 2, coordinates: (0,2), id: self.Cards.count))
    }
    
    func add(data: Card)
    {
        self.Cards.append(Card(number: data.number, coordinates: data.coordinates, id: self.Cards.count))
    }
    
    func replay(){
        for item in self.Cards{
            self.Cards[item.id].deleted = true
        }
        self.Cards.append(Card(number: 2, coordinates: (0,1), id: self.Cards.count))
        self.Cards.append(Card(number: 2, coordinates: (0,2), id: self.Cards.count))
    }

}

struct Card: Identifiable {
    var number: Int
    var coordinates: (x: CGFloat, y: CGFloat)
    var deleted = false
    var id: Int = 0
}

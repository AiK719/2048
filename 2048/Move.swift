//
//  Move.swift
//  2048
//
//  Created by 凶手 on 2020/12/29.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI
// 向上移动，看是不是有移动空间，有空间移动，直到没有移动的位置，最上面的先移动，先排序
// 联合体
enum Move{
    case up
    case down
    case left
    case right
}

func travel(in direction: Move) -> (x: Int, y: Int) {
    switch direction {
        case .up: return (0,-1)
        case .down: return (0,1)
        case .left: return (-1,0)
        case .right: return (1,0)
    }
}

extension Main {
    // id卡片某一方向，能不能移动一个
    func haveSpace(id: Int,in direction: Move) -> Bool {
        var position = self.Cards[id].coordinates // 坐标
        position.x += CGFloat(travel(in: direction).x)
        position.y += CGFloat(travel(in: direction).y)
        if position.x<4 && position.x>=0 && position.y<4 && position.y>=0 {
            if self .Cards.firstIndex(where: {data in
                data.coordinates.x == position.x && data.coordinates.y == position.y && !data.deleted
            }) == nil {
                return true
            }
        }
        return false
    }
    // 不同方向sort是不同的，不能改id，直接整体排序就好了
    func sort(in direction: Move) -> [Int]
    {
        var temp = self.Cards
        temp.sort(by: {(data1, data2) in
            switch direction {
                case .up: return data1.coordinates.y<data2.coordinates.y
                case .down: return data1.coordinates.y>data2.coordinates.y
                case .left: return data1.coordinates.x<data2.coordinates.x
                case .right: return data1.coordinates.x>data2.coordinates.x
               
            }
        })
        var selection: [Int] = []
        for item in temp {
            selection.append(item.id)
        }
        return selection
    }
    func move(in direction: Move){
        let selection = self.sort(in: direction)
        
        // 每个元素移动，一直while就好了
        for i in selection {
            while self.haveSpace(id: i, in: direction) {
                self.Cards[i].coordinates.x += CGFloat(travel(in: direction).x)
                self.Cards[i].coordinates.y += CGFloat(travel(in: direction).y)
            }
        }
    }
    
    func moveAndCombine(in direction: Move)
    {
        self.move(in: direction)
        self.combine(in: direction)
        self.move(in: direction)
    }
}

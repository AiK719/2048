//
//  Combine.swift
//  2048
//
//  Created by 凶手 on 2020/12/29.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI

// 拓展Main, 在行进方向有小卡片会挡住它 ， 同时数字一样，就合并：不显示一个，数字翻倍
extension Main{
    func combine(in direction: Move){
        let selection = self.sort(in: direction)
        for i in selection{
            if !self.Cards[i].deleted{
                if let index = self.Cards.firstIndex(where: {data in
                    var position = self.Cards[i].coordinates
                    position.x += CGFloat(travel(in: direction).x)
                    position.y += CGFloat(travel(in: direction).y)
                    return position == data.coordinates && self.Cards[i].number == data.number && !data.deleted
                }){
                    self.Cards[i].coordinates.x += CGFloat(travel(in: direction).x)
                    self.Cards[i].coordinates.y += CGFloat(travel(in: direction).y)
                    self.Cards[index].number *= 2
                    self.Cards[i].deleted = true
                } 
            }
            
        }
    }
}

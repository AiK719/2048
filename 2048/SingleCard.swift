//
//  SingleCard.swift
//  2048
//
//  Created by 凶手 on 2020/12/28.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI

func appr(_ ip: CGFloat) -> Int{
    let remain = ip - CGFloat(Int(ip))
    return remain > 0.5 ? Int(ip)+1 : Int(ip)
    
}

struct SingleCard: View {
    
    @EnvironmentObject var UserData: Main
    var card: Card
    
    // 计算属性，强制解包
    var index: Int{
        return self.UserData.Cards.firstIndex(where: {$0.id == self.card.id })!
    }
    
    var lenth = 4
    var spacing: CGFloat = 15
  
//    @State var original: (x: Int, y: Int)
//    @State var magnet: (x: CGFloat, y: CGFloat) = (0,0)
//    @State var floatScale: CGFloat = 1
    
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Rectangle()
                Text(String(self.UserData.Cards[self.index].number))  // 转类型
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .frame(width: geometry.size.width / CGFloat(self.lenth) , height:
                    geometry.size.height / CGFloat(self.lenth))
            .cornerRadius(10)
//            .scaleEffect(self.floatScale)
//                .shadow(radius: self.floatScale==1.1 ? 10 : 0, x: 0, y: self.floatScale==1.1 ? 10 : 0)
            .offset(x: -0.5*CGFloat(self.lenth-1)*(geometry.size.width /
                CGFloat(self.lenth) + self.spacing),
                    y:  -0.5*CGFloat(self.lenth-1)*(geometry.size.height /
                CGFloat(self.lenth) + self.spacing))
                
                .offset(x: CGFloat(self.UserData.Cards[self.index].coordinates.x)*(geometry.size.width /
                CGFloat(self.lenth) + self.spacing),
                        y: CGFloat((self.UserData.Cards[self.index].coordinates.y)*(geometry.size.height /
                CGFloat(self.lenth) + self.spacing)))
            //    .offset(x: self.magnet.x/5, y: self.magnet.y/5)
                .foregroundColor(Color(String(self.UserData.Cards[self.index].number)))
//            .gesture(
//                DragGesture()
//                    .onChanged({position in
//                        self.floatScale = 1.1
//                        let movement = position.translation
//                        let Xcoor = appr(movement.width / (geometry.size.width /
//                            CGFloat(self.lenth)+self.spacing))
//                        let Ycoor = appr(movement.height / (geometry.size.height / CGFloat(self.lenth)+self.spacing))
//                        self.magnet.x = movement.width -
//                            CGFloat(Xcoor)*(geometry.size.width /
//                            CGFloat(self.lenth)+self.spacing)
//                        self.magnet.y = movement.height -
//                            CGFloat(Ycoor)*(geometry.size.height /
//                            CGFloat(self.lenth)+self.spacing)
//                        self.coordinates.x = max(min(self.original.x + Xcoor, self.lenth-1),0)
//                        self.coordinates.y = max(min(self.original.y + Ycoor, self.lenth-1),0)
//                    })
//                    .onEnded({_ in
//                        self.floatScale = 1
//                        self.original = self.coordinates
//                        self.magnet = (0,0)
//                    })
//            )
            
        }
    }
}

//
//  ContentView.swift
//  2048
//
//  Created by 凶手 on 2020/12/25.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI

let maxWidth = UIScreen.main.bounds.width
let maxHeight = UIScreen.main.bounds.height

func abs(_ ip: CGFloat) -> CGFloat{
    return ip>0 ? ip : -ip
}


struct ContentView: View {
    // @State var coordinates: (x: Int, y: Int) = (0,0)
    @ObservedObject var UserData: Main = Main()
    @State var losing = false
    var body: some View {
        VStack{
            ZStack{
                BackgroundGrid()
                    .gesture(
                        DragGesture()
                            .onEnded({position in
                                let direction = position.translation
                                withAnimation(.spring()){
                                    if abs(direction.width) < abs(direction.height){
                                        direction.height<0 ?
                                            self.UserData.moveAndCombine(in: .up) :
                                            self.UserData.moveAndCombine(in: .down)
                                    }
                                    else{
                                        direction.width<0 ?
                                        self.UserData.moveAndCombine(in: .left) :
                                        self.UserData.moveAndCombine(in: .right)
                                    }
                                    if !self.UserData.addNewCard(){
                                        self.losing = true
                                    }
                                }
                            })
                    )

                ForEach(self.UserData.Cards){ item in
                    if !item.deleted {
                        SingleCard(card :item)
                            .environmentObject(self.UserData)
                            .animation(.spring())
                            .transition(.opacity)
                    }
                }
//                // 调试
//                Image(systemName: "pencil")
//                .resizable()
//                    .onTapGesture {
//                        self.UserData.moveAndCombine(in: .up)
//                }
            }
        }
        .frame(width: min(maxWidth, maxHeight)*0.8, height: min(maxWidth, maxHeight))
        .alert(isPresented: self.$losing, content: {
            Alert(title: Text("你输了") , message: Text("重新开始?"), dismissButton:
                Alert.Button.cancel({
                    self.UserData.replay()
                }))
        })
        }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

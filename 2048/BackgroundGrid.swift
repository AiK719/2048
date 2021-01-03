//
//  BackgroundGrid.swift
//  2048
//
//  Created by 凶手 on 2020/12/25.
//  Copyright © 2020 凶手. All rights reserved.
//

import SwiftUI

struct BackgroundGrid: View {
    var lenth = 4
    var spacing = 15
    
    var body: some View {
        GeometryReader {geometry in
            VStack(spacing: CGFloat(self.spacing)){
                ForEach(0..<4){item in
                    HStack(spacing: CGFloat(self.spacing)){
                        ForEach(0..<4) { _ in
                            Rectangle()
                                .frame(width: geometry.size.width /
                                    CGFloat(self.lenth) , height:
                                    geometry.size.height / CGFloat(self.lenth))
                                .foregroundColor(.gray)
                            .cornerRadius(10)
                                
                        }
                    }
                    
                }
            }
            
        }
    }
}

struct BackgroundGrid_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGrid()
    }
}

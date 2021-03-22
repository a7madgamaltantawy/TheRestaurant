//
//  ItemRow.swift
//  TheRestaurant
//
//  Created by Ahmed Tantawy on 16/03/2021.
//

import SwiftUI

struct ItemRow: View {
    
    let item : MenuItem
    
    let  colors : [String : Color] = ["D":.purple, "G":.black , "N":.red , "S":.blue , "V":.green ] 
    
    
    
    var body: some View {
        HStack{
        Image(item.thumbnailImage)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray , lineWidth: 2))
            
            VStack(alignment : .leading){
                Text(item.name)
            .font(.headline)
            Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions , id : \.self){restriction in
                Text(restriction)
                    .font(.footnote)
                .fontWeight(.black)
                .padding(4)
                    .background(Color.white)
                .clipShape(Circle())
               //     .foregroundColor(colors[restriction, defa])
            }
    }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

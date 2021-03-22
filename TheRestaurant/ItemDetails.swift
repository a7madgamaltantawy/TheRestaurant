//
//  ItemDetails.swift
//  TheRestaurant
//
//  Created by Ahmed Tantawy on 17/03/2021.
//

import SwiftUI

struct ItemDetails: View {
    @EnvironmentObject var order: Order
    let item: MenuItem

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()

                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }

            Text(item.description)
                .padding()

            Button("Order This") {
                order.add(item: item)
            }
            .font(.headline)

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetails(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}

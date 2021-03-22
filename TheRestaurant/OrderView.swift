//
//  OrderView.swift
//  TheRestaurant
//
//  Created by Ahmed Tantawy on 18/03/2021.
//

import SwiftUI




    


struct OrderView: View {
    
    
    func deleteItems (at offset : IndexSet){
        
        order.items.remove(atOffsets: offset)
        
        
    }
    
    
    
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView {
                    List {
                        Section {
                            ForEach(order.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text("$\(item.price)")
                                }
                            }.onDelete(perform : deleteItems)
                        }

                        Section {
                            NavigationLink(destination:
                                            CheckoutView())
                                            {
                                Text("Place Order")
                            }
                        }.disabled(order.items.isEmpty)
                    }
                    .navigationTitle("Order")
                    .listStyle(InsetGroupedListStyle())
                    .toolbar{
                        EditButton()
                    }
                }
            }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}

//
//  CheckoutView.swift
//  TheRestaurant
//
//  Created by Ahmed Tantawy on 19/03/2021.
//

import SwiftUI

struct CheckoutView: View {
    
    @State private var showingPaymentAlert = false
    
    var totalPrice : String{
        
        
        
       
        
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
        
    }
    
    let tipAmounts = [5,10,20,30]
    @State private var tipAmount = 10
    @EnvironmentObject var order : Order
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    
    let paymentTypes = ["Cash","Credit Card", "The Restaurant Points"]
    
    @State var paymentType = "Cash"
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("add The Restaurant loyalty card", isOn : $addLoyaltyDetails.animation())
                if(addLoyaltyDetails == true){
                TextField("enter your The Restaurant ID" , text : $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("add a tip")){
                
                Picker("percentage:" , selection:$tipAmount){
                    
                    
                    ForEach(tipAmounts , id: \.self){
                        
                        Text("\($0)%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                
                
                
            }
            
       
            
            Section(header:
                        Text("TOTAL:$\(totalPrice)").font(.largeTitle)
                    
                    
            ) {
                Button("please confirm the order"){
                    
                    showingPaymentAlert.toggle()
                    
                }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showingPaymentAlert){
                
                
                Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice) – thank you!"), dismissButton: .default(Text("OK")))
                
                
            }
   
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
}

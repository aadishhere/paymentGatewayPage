//
//  ContentView.swift
//  paymentGatewayPage
//
//  Created by Aadish Jain on 23/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                Text("SELECT PAYMENT METHOD").font(.headline)
                Spacer()
            }
            .padding()
        }
        
        NavigationView {
            ScrollView {
                VStack(spacing: 18) {
                    UPISection()
                    CardSection()
                    CODSection()
                    PayButton(amount: "0")
                }
                .padding()
            }
            .navigationBarHidden(true)
            .background(Color.primary.opacity(0.05))
        }
    }
}

struct UPISection: View {
    @State private var isExpanded = false
    @State private var upiID = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("UPI (Pay via any App)").font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture { withAnimation(.spring()) { isExpanded.toggle() } }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 10) {
                        Image(systemName: "creditcard")
                            .foregroundColor(.gray)
                            .frame(width: 22)
                        TextField("Enter UPI ID", text: $upiID)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5).opacity(0.8))
                    .cornerRadius(10)
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
    }
}

struct CardSection: View {
    @State private var isExpanded = true
    @State private var cardNumber = ""
    @State private var holderName = ""
    @State private var expiry = ""
    @State private var cvv = ""
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Credit / Debit Card").font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }
            if isExpanded {
                VStack(alignment: .leading, spacing: 15) {
                
                    HStack(spacing: 10) {
                        Image(systemName: "creditcard.fill")
                            .foregroundColor(.gray)
                            .frame(width: 22)
                        TextField("Card Number", text: $cardNumber)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5).opacity(0.8))
                    .cornerRadius(10)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                            .frame(width: 22)
                        TextField("Name on Card", text: $holderName)
                    }
                    .padding()
                    .background(Color(UIColor.systemGray5).opacity(0.8))
                    .cornerRadius(10)
                    
                    HStack(spacing: 15) {
                        HStack(spacing: 10) {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                                .frame(width: 22)
                            TextField("MM/YY", text: $expiry)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray5).opacity(0.8))
                        .cornerRadius(10)
                        
                        HStack(spacing: 10) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                                .frame(width: 22)
                            SecureField("CVV", text: $cvv)
                        }
                        .padding()
                        .background(Color(UIColor.systemGray5).opacity(0.8))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
    }
}

struct CODSection: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Cash on Delivery").font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .contentShape(Rectangle())
            .onTapGesture { withAnimation(.spring()) { isExpanded.toggle() } }
            
            if isExpanded {
                HStack(spacing: 10) {
                    Image(systemName: "dollarsign.circle.fill").foregroundColor(.green)
                    Text("You can pay via Cash/UPI on delivery.")
                        .font(.footnote).foregroundColor(.secondary)
                    Spacer()
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
    }
}

struct PayButton: View {
    var amount: String
    
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Text("Pay ₹\(amount)").bold()
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title2)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(12)
        }
        .padding(.top, 10)
    }
}

#Preview {
    ContentView()
}

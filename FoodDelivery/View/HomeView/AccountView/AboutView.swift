//
//  AboutView.swift
//  FoodDelivery
//
//  Created by student on 11/02/25.
//
import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("About Our Application")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Image("color_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)

            Text("Welcome to our Organic Store! We provide fresh, organic fruits and natural drinks, free from chemicals and harmful additives. Our mission is to promote a healthy lifestyle by offering high-quality, farm-fresh produce straight to your doorstep.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("About", displayMode: .inline)
    }
}

#Preview {
    AboutView()
}

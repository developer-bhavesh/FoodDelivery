import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("How Can We Help?")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)

            Text("We are here to assist you with any queries related to our organic products and services. Our support team ensures a smooth and hassle-free shopping experience.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            ScrollView{
                // Help Sections with Icons
                VStack(alignment: .leading, spacing: 15) {
                    HelpSection(icon: "cart.fill", title: "Order Tracking", description: "Easily track your orders in real time and get updates on delivery status.")
                    Divider()
                    HelpSection(icon: "creditcard.fill", title: "Payment Issues", description: "Need help with payments? Contact us for assistance with transactions and refunds.")
                    Divider()
                    HelpSection(icon: "leaf.fill", title: "Product Information", description: "Learn about our organic fruits and drinks, including sourcing and health benefits.")
                    Divider()
                    HelpSection(icon: "arrow.uturn.left.circle.fill", title: "Returns & Refunds", description: "Know the process of returning products and claiming refunds hassle-free.")
                    Divider()
                    HelpSection(icon: "person.2.fill", title: "Customer Support", description: "Our support team is available 24/7 to resolve your concerns.")
                    Divider()
                }
                .padding()
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Help & Support", displayMode: .inline)
    }
}

// Reusable Help Section Component with Icons
struct HelpSection: View {
    var icon: String
    var title: String
    var description: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text(description)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    HelpView()
}

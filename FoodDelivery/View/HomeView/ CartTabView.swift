import SwiftUI

struct CartTabView: View {
    @StateObject var mainVM = MainViewModel.shared
    @Environment(\.dismiss) var dismiss

    var totalAmount: Double {
        mainVM.cart.reduce(0) { total, product in
            let price = Double(product.price.replacingOccurrences(of: "$", with: "")) ?? 0
            return total + (price * Double(product.quantity))
        }
    }

    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
                .padding()

            if mainVM.cart.isEmpty {
                VStack {
                    Text("Your cart is empty!")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding()
                }
            } else {
                List {
                    ForEach(mainVM.cart) { product in
                        HStack {
                            Image(product.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.headline)
                                Text(product.price)
                                    .font(.subheadline)
                            }

                            Spacer()

                            HStack {
                                Button(action: {
                                    mainVM.decreaseQuantity(product: product)
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(product.quantity > 1 ? .red : .gray)
                                }
                                .disabled(product.quantity == 1)

                                Text("\(product.quantity)")
                                    .font(.headline)
                                    .padding(.horizontal, 8)

                                Button(action: {
                                    mainVM.addToCart(product: product)
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.trailing, 10)
                        }
                    }
                }

                // Total Amount Display
                HStack {
                    Text("Total:")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("$\(String(format: "%.2f", totalAmount))")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// Extension for decreasing quantity
extension MainViewModel {
    func decreaseQuantity(product: Product) {
        if let index = cart.firstIndex(where: { $0.id == product.id }), cart[index].quantity > 1 {
            cart[index].quantity -= 1
        }
    }
}

struct CartTabView_Previews: PreviewProvider {
    static var previews: some View {
        CartTabView()
    }
}

import SwiftUI

struct ProductCardView: View {
    var name: String
    var price: String
    var image: String

    @ObservedObject var mainVM = MainViewModel.shared

    var quantity: Int {
        mainVM.cart.first(where: { $0.name == name && $0.price == price })?.quantity ?? 0
    }

    var isLiked: Bool {
        mainVM.favourites.contains { $0.name == name && $0.price == price && $0.image == image }
    }

    var body: some View {
        VStack(spacing: 8) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 8)

            Text(name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.primary)
                .lineLimit(1)
                .padding(.horizontal, 5)

            HStack {
                Text(price)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)

                Spacer()

                Button(action: {
                    if isLiked {
                        mainVM.removeFromFavourites(product: Product(name: name, price: price, image: image))
                    } else {
                        mainVM.addToFavourites(product: Product(name: name, price: price, image: image))
                    }
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title3)
                        .foregroundColor(isLiked ? .red : .gray)
                        .padding(6)
                }

                if quantity == 0 {
                    Button(action: {
                        mainVM.addToCart(product: Product(name: name, price: price, image: image))
                    }) {
                        Text("Add")
                            .foregroundColor(.white)
                            .frame(width: 49, height: 20)
                            .background(Color.green)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                    }
                } else {
                    HStack(spacing: 5) {
                        Button(action: {
                            mainVM.removeFromCart(product: Product(name: name, price: price, image: image))
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                                .font(.title3)
                        }

                        Text("\(quantity)")
                            .font(.system(size: 14, weight: .semibold))

                        Button(action: {
                            mainVM.addToCart(product: Product(name: name, price: price, image: image))
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .font(.title3)
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
        }
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 6, x: 0, y: 3))
        .frame(width: 160)
        .padding(4)
    }
}


struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(name: "Organic Bananas", price: "$4.99", image: "apple_red")
            .previewLayout(.sizeThatFits)
    }
}

import SwiftUI

struct ExploreTabView: View {
    @State private var searchText = ""

    let categories: [Category] = [
        Category(name: "Fresh Fruits & Vegetables", image: "frash_fruits", color: .green.opacity(0.1), borderColor: .green, products: [
            Product(name: "Apple", price: "$2.99", image: "apple"),
            Product(name: "Red Apple", price: "$3.99", image: "apple_red"),
            Product(name: "Ginger", price: "$2.49", image: "ginger"),
            Product(name: "Bell Pepper Red", price: "$2.99", image: "bell_pepper_red"),
        ]),
        Category(name: "Cooking Oil & Ghee", image: "cooking_oil", color: .orange.opacity(0.1), borderColor: .orange, products: [
            Product(name: "Olive Oil", price: "$5.49", image: "olive_oil"),
            Product(name: "Olive Oil", price: "$5.49", image: "olive_oil")
        ]),
        Category(name: "Meat & Fish", image: "meat_fish", color: .red.opacity(0.1), borderColor: .red, products: [ Product(name: "Beef Bone", price: "$5.99", image: "beef_bone"),
            Product(name: "Broiler Chicken", price: "$6.99", image: "broiler_chicken"),
            ]),
        Category(name: "Bakery & Snacks", image: "bakery_snacks", color: .purple.opacity(0.1), borderColor: .purple, products: []),
        Category(name: "Dairy & Eggs", image: "dairy_eggs", color: .yellow.opacity(0.1), borderColor: .yellow, products: [
            Product(name: "White Egg", price: "$5.99", image: "egg_chicken_white"),
            Product(name: "Red Egg", price: "$6.99", image: "egg_chicken_red"),
            Product(name: "mayonnaise", price: "$6.99", image: "mayinnars_eggless"),
            Product(name: "Egg pasta", price: "$6.99", image: "egg_pasta"),
            Product(name: "Egg Nooodles", price: "$6.99", image: "egg_noodles"),
            Product(name: "Egg Nooodle", price: "$6.99", image: "egg_noodies_new")]),
        Category(name: "Beverages", image: "beverages", color: .blue.opacity(0.1), borderColor: .blue, products: [ Product(name: "Apple", price: "$2.99", image: "apple")])
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Find Products")
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .center)

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search Store", text: $searchText)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.1)))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.horizontal)

                    // Categories Grid
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(categories, id: \..name) { category in
                            NavigationLink(destination: CategoryDetailView(category: category)) {
                                CategoryCard(category: category)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
            }

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
       
}

// Category Detail View
struct CategoryDetailView: View {
    let category: Category
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(category.products, id: \..name) { product in
                        ProductCardView(name: product.name, price: product.price, image: product.image)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category.name)
    }
}

// Category Card
struct CategoryCard: View {
    let category: Category

    var body: some View {
        VStack {
            Image(category.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Text(category.name)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .frame(width: 160, height: 180)
        .background(category.color)
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(category.borderColor, lineWidth: 1))
    }
}

// Product Model


// Category Model
struct Category {
    let name: String
    let image: String
    let color: Color
    let borderColor: Color
    let products: [Product]
}

// Product Card View

#Preview {
    ExploreTabView()
}

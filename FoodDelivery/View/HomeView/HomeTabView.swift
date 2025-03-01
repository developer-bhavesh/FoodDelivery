import SwiftUI

struct HomeScreen: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some View {
        ZStack {
            TabView {
                HomeTabView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                ExploreTabView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Explore")
                    }
                
                CartTabView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                
                FavouriteTabView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("Favourite")
                    }
                
                AccountTabView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Account")
                    }
            }
            .accentColor(.green)
            
            FloatingChatButton()
        }
    }
}


struct HomeTabView: View {
    @StateObject var mainVM = MainViewModel.shared
    @State private var searchText = ""
    let banners = ["banner_top", "images", "9576_Portrait_010334_1_442_carousel"]
    @State private var selectedIndex = 0

    

    // Sample Product List
    let products = [
        Product(  name: "Organic Bananas", price: "$4.99", image: "banana"),
        Product(name: "Red Apple", price: "$3.99", image: "apple_red"),
        Product(name: "Ginger", price: "$2.49", image: "ginger"),
        Product(name: "Bell Pepper Red", price: "$2.99", image: "bell_pepper_red"),
        Product(name: "Beef Bone", price: "$5.99", image: "beef_bone"),
        Product(name: "Broiler Chicken", price: "$6.99", image: "broiler_chicken")
    ]

    var body: some View {
       
        VStack {
            VStack {
                Image("color_logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 5) // Adjusted padding
                
                NavigationLink {
                    SelectLocationView()
                } label: {
                    Text("\(mainVM.selectedZone), \(mainVM.selectedArea.isEmpty ? "Select Area" : mainVM.selectedArea)")
                        .font(.title3)
                        .foregroundColor(.black)
                        .frame(width: 300, height: 20)
                }
                SearchTextField(searchText: .constant(""), placeholder: "Search Store")
                    .padding(.horizontal, 10)
                    .padding(.top, 5)
              
         }


                ScrollView {
                // Scrollable Images Section
                    TabView(selection: $selectedIndex) {
                               ForEach(0..<banners.count, id: \.self) { index in
                                   Image(banners[index])
                                       .resizable()
                                       .scaledToFit()
                                       .frame(width: 370, height: 140)
                                       .clipShape(RoundedRectangle(cornerRadius: 10))
                                       .tag(index)
                               }
                           }
                           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                           .frame(height: 150)
                           .padding(.horizontal, 15)

                // Fresh Vegetables Section
                VStack(alignment: .leading) {
                    
                    HStack{
                        Text("Fresh Vegetables")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                        
                        Button(action: {}) {
                            Text("See all")
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }
                        .padding()}

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(products, id: \.id) { product in
                                ProductCardView(name: product.name, price: product.price, image: product.image)
                            }
                            .padding(.trailing, -10)
                        }
                        .padding(.leading, 20)
                    }
                }


                // Best Selling Section
                VStack(alignment: .leading) {
                    
                    HStack{
                        Text("Best Selling")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.bottom, 8)
                            .padding(.leading)
                        Spacer()
                        
                        Button(action: {}) {
                            Text("See all")
                                .padding()
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }
                    }
                    
               

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(products, id: \.id) { product in
                                ProductCardView(name: product.name, price: product.price, image: product.image)
                            }
                            .padding(.trailing, -10)
                        }
                        .padding(.leading, 20)
                    }
                }
                

                
                
                // Groceries Section
                VStack(alignment: .leading) {
                    HStack{
                        Text("Groceries")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)

                            .padding(.leading)
                        Spacer()
                        
                        Button(action: {}) {
                            Text("See all")
                                .foregroundColor(.primaryApp)
                                .font(.customfont(.semibold, fontSize: 14))
                                .padding(.leading)
                        }}
                    .padding(.top, 20)
                    ScrollView(.horizontal, showsIndicators: false) {
                                           HStack {
                                               Button(action: {}) {
                                                   HStack {
                                                       Image("pulses")
                                                           .resizable()
                                                           .frame(width: 70, height: 70)
                                                           .padding(.leading, 15)
                                                           .padding(.top, 15)
                                                           .padding(.bottom, 15)

                                                       Text("Pulses")
                                                           .font(.customfont(.semibold, fontSize: 19))
                                                           .foregroundColor(.primaryText)
                                                           .padding(.trailing, 70)
                                                   }
                                               }
                                               .background(Color(hex: "#fbe1cd"))
                                               .cornerRadius(10)
                                               .padding(.leading)

                                               Button(action: {}) {
                                                   HStack {
                                                       Image("rice")
                                                           .resizable()
                                                           .frame(width: 70, height: 70)
                                                           .padding(.leading, 15)
                                                           .padding(.top, 15)
                                                           .padding(.bottom, 15)

                                                       Text("Rice")
                                                           .font(.customfont(.semibold, fontSize: 19))
                                                           .foregroundColor(.primaryText)
                                                           .padding(.trailing, 85)
                                                   }
                                               }
                                               .background(Color(hex: "#dafbd9"))
                                               .cornerRadius(10)
                                               .padding(.leading)
                                           }
                                       }
                                       .padding(.bottom, 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(products, id: \.id) { product in
                                ProductCardView(name: product.name, price: product.price, image: product.image)
                            }
                            .padding(.trailing, -10)
                        }
                        .padding(.leading)
                    }
                }
                .padding(.top,-20)
            }
            .padding(.top) // Padding for the top section
        }
        .navigationTitle("Home")
        .background(LinearGradient(gradient: Gradient(colors: [.white, Color.green.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
    }
}

// Product Model
struct Product: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var price: String
    var image: String
    var quantity: Int = 1  // Quantity added
}


// Product Card View


// Preview
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

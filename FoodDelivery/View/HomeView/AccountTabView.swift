import SwiftUI

struct AccountTabView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared

    var body: some View {
        NavigationStack {
            VStack {
                // Profile Section (No ScrollView Needed)
                HStack {
                    Image("u1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())

                    VStack(alignment: .leading) {
                        Text("\(mainVM.txtUsername)")
                            .font(.title2)
                            .fontWeight(.bold)

                        Text("\(mainVM.txtEmail)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()

                Divider() // Divider below profile section
                ScrollView{
                    
                    // Account Options List (Without ScrollView)
                    VStack(spacing: 5) {
                        AccountOption(title: "Orders", icon: "bag", destination: OrdersView())
                        Divider()
                        AccountOption(title: "My Details", icon: "person", destination: UserDetailView())
                        Divider()
                        AccountOption(title: "Delivery Address", icon: "location", destination: DeliveryAddressView(viewModel: MainViewModel.shared))
                        Divider()
                        AccountOption(title: "Payment Methods", icon: "creditcard", destination: PaymentView())
                        Divider()
                        AccountOption(title: "Promo Code", icon: "tag", destination: PromoView())
                        Divider()
                        AccountOption(title: "Notifications", icon: "bell", destination: NotificationsView())
                        Divider()
                        AccountOption(title: "Help", icon: "questionmark.circle", destination: HelpView())
                        Divider()
                        AccountOption(title: "About", icon: "info.circle", destination: AboutView())
                        Divider()
                    }
                }
                Spacer()

                // Logout Button
                LogOutButton(action: {
                    mainVM.logout()
                })
                .padding(.bottom, 20)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AccountTabView()
}

// Reusable Component for Account Options
struct AccountOption<Destination: View>: View {
    var title: String
    var icon: String
    var destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.black)
                    .font(.title2)

                Text(title)
                    .font(.title3)
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

// Reusable LogOut Button Component
struct LogOutButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.white)
                    .font(.title2)

                Text("Log Out")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.9))
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AccountTabView()
}

# Food Delivery App (iOS)

## Overview
This is a food delivery app built using SwiftUI for iOS. The app allows users to browse restaurants, select meals, and place orders seamlessly. The backend, which will be built using Express, is currently under development.

## Features
- Browse restaurant listings
- View detailed menus
- Add food items to the cart
- Place an order (UI implementation only)
- Smooth UI with SwiftUI components

## Tech Stack
### Frontend:
- **SwiftUI**: For UI development
- **Combine**: For data binding and state management (if needed)
- **CoreData/UserDefaults**: Temporary storage for orders (until backend is ready)

### Backend (Planned):
- **Express.js**: REST API for order handling, authentication, and restaurant data
- **MongoDB/PostgreSQL**: Database for storing user and restaurant data
- **JWT Authentication**: For user authentication and session management

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/food-delivery-ios.git
   ```
2. Open the Xcode project:
   ```sh
   cd food-delivery-ios
   open FoodDeliveryApp.xcodeproj
   ```
3. Run the app on a simulator or connected device.

## Roadmap
- [x] UI Implementation for browsing and ordering
- [ ] Implement Express.js backend
- [ ] Connect frontend with API
- [ ] Add real-time order tracking
- [ ] Payment gateway integration

## Contribution
Feel free to fork the repository and submit pull requests for improvements.

## License
MIT License


import SwiftUI

struct FloatingChatButton: View {
    @State private var offset = CGSize.zero
    @State private var showChat = false
    
    var body: some View {
        ZStack {
            if showChat {
                ChatView(showChat: $showChat)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
            
            Circle()
                .fill(Color.green)
                .frame(width: 60, height: 60)
                .overlay(Image(systemName: "message.fill").foregroundColor(.white))
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            offset = gesture.translation
                        }
                        .onEnded { _ in
                            withAnimation {
                                offset = CGSize.zero
                            }
                        }
                )
                .onTapGesture {
                    withAnimation {
                        showChat.toggle()
                    }
                }
                .position(x: UIScreen.main.bounds.width - 80, y: UIScreen.main.bounds.height - 150)
                .zIndex(2)
        }
        .ignoresSafeArea()
    }
}

struct ChatView: View {
    @Binding var showChat: Bool
    @State private var messageText: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("Chatbox")
                    .font(.headline)
                Spacer()
                Button(action: { showChat = false }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(messages, id: \ .self) { msg in
                        HStack {
                            Text(msg)
                                .padding()
                                .background(Color.blue.opacity(0.8))
                                .cornerRadius(10)
                            Spacer()
                        }
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Type a message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if !messageText.isEmpty {
                        messages.append(messageText)
                        messageText = ""
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
            .background(Color.white)
        }
        .frame(height: 300)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding()
    }
}
#Preview {
    FloatingChatButton()
}

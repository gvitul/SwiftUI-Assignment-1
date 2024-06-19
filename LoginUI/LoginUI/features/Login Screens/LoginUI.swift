import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showingAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 40)
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(username.isEmpty ? Color.red : Color.clear, lineWidth: 1)
                        )
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8.0)
                                .stroke(password.isEmpty ? Color.red : Color.clear, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 30)
                
                Button(action: {
                    if username.isEmpty || password.isEmpty {
                        alertMessage = "Please fill in all fields."
                        showingAlert = true
                    } else if username.lowercased() != "user" || password.lowercased() != "password" {
                        alertMessage = "Invalid username or password."
                        showingAlert = true
                    } else {
                        isLoggedIn = true
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isLoggedIn) {
                ItemListView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

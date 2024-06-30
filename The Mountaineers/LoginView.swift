//
//  ContentView.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData
import UIKit

struct LoginView: View {
    
    @StateObject var loginManager = LoginManager()
    @State var username: String = ""
    @State var password: String = ""
    @State private var isSecured: Bool = true
    @State private var isValid: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack  {
            ZStack {
                Color(.systemGray4).ignoresSafeArea()
                VStack(spacing: 0.0) {
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.darkBlue)
                            .frame(width: 340, height: 80)
                            .cornerRadius(5)
                        VStack(spacing: 15.0) {
                            TextField("", text: $username, prompt: Text("Enter Username").foregroundStyle(.white))
                                .foregroundColor(.white)
                                .font(.custom("Tahoma", size: 18))
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding(.horizontal, 50)
                            
                            SecureField("", text: $password, prompt: Text("Enter Password").foregroundStyle(.white))
                                .foregroundColor(.white)
                                .font(.custom("Tahoma", size: 18))
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding(.horizontal, 50)
                            
                            
                            /*
                            HStack {
                                if isSecured {
                                    SecureField("", text: $password, prompt: Text("Enter Password").foregroundStyle(.white))
                                } else {
                                    TextField("", text: $password, prompt: Text("Enter Password").foregroundStyle(.white))
                                }
                                
                                
                                Spacer()
                                
                                Button(action: {
                                    isSecured.toggle()
                                }) {
                                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                        .accentColor(.white)
                                }
                            }
                            .foregroundColor(.white)
                            .font(.custom("Tahoma", size: 18))
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(.horizontal, 50)
                             */
                            
                        }
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .frame(width: 300, height:1.5)
                    }
                    
                    Button(action: {
                        isValid = loginManager.isValidUser(username: username, password: password)
                        showError = !isValid
                    }) {
                        Text("Login")
                            .font(.custom("Tahoma", size: 18))
                            .frame(width:100, height:40)
                            .foregroundColor(.white)
                            .background(.darkBlue)
                            .cornerRadius(5)
                            .padding(.top, 30)
                    }
                    
                    if showError {
                        Text("Invalid username or password. Please try again.")
                            .font(.custom("Tahoma", fixedSize: 18))
                            .foregroundStyle(.red)
                            .padding()
                    }
                    
                    NavigationLink(
                        destination:
                            HomeView()
                            .navigationBarBackButtonHidden(true)
                            .environmentObject(loginManager),
                        isActive: $isValid,
                        label: {
                            EmptyView()
                        }
                    )
                    .hidden()
                    
                    Spacer()
                }
            }
        }
    }
}



#Preview {
    LoginView()
}

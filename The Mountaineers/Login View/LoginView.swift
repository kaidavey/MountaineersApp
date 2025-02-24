//
//  ContentView.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData
import UIKit

struct LoginView: View {
    @EnvironmentObject var loginManager: LoginManager
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var isSecured: Bool = true
    @State private var isValid: Bool = false
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack  {
            ZStack {
                Color(.systemGray4).ignoresSafeArea()
                VStack {
                    Image("logo2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 330)
                        .padding(.top, 100)
                    
                    Spacer()
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.darkBlue)
                            .frame(width: 340, height: 80)
                            .cornerRadius(5)
                        VStack(spacing: 14.0) {
                            TextField("", text: $newUsername, prompt: Text("Enter Username").foregroundStyle(.white))
                                .foregroundStyle(.white)
                                .font(.custom("Tahoma", size: 18))
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding(.horizontal, 50)
                            
                            HStack {
                                if isSecured {
                                    SecureField("", text: $newPassword, prompt: Text("Enter Password").foregroundStyle(.white))
                                } else {
                                    TextField("", text: $newPassword, prompt: Text("Enter Password").foregroundStyle(.white))
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    isSecured.toggle()
                                }) {
                                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                        .accentColor(.white)
                                }
                            }
                            .foregroundStyle(.white)
                            .font(.custom("Tahoma", size: 18))
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .padding(.horizontal, 50)

                        }
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .frame(width: 300, height:1.5)
                    }
                    
                    Button(action: {
                        isValid = loginManager.isValidUser(username: newUsername, password: newPassword)
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
                    
                    HStack(spacing: 0.7) {
                        Text("Don't have an account? Make one ")
                            .font(.custom("Tahoma", size: 16))
                            .foregroundStyle(.charcoal)
                        Link("here.", destination: URL(string: "https://www.mountaineers.org/membership/join-the-mountaineers")!)
                            .font(.custom("Tahoma", size: 16))
                            .foregroundStyle(.darkBlue)
                    }
                    .padding(40)
                    
                    if showError {
                        Text("Invalid username or password. Please try again.")
                            .font(.custom("Tahoma", fixedSize: 18))
                            .foregroundStyle(.red)
                            .padding()
                    }
                    
                    if isValid {
                        NavigationLink {
                            MainView()
                                .environmentObject(loginManager)
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            EmptyView()
                        }
                        .hidden()
                    }
                }
            }
        }
    }
}

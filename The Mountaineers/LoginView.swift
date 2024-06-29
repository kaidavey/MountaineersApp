//
//  ContentView.swift
//  The Mountaineers
//

import SwiftUI
import SwiftData

struct LoginView: View {
    
    @State private var loginManager = LoginManager()
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var isSecured:Bool = true
    
    var body: some View {
        ZStack {
            Color
                .darkBlue
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:150)
                
                TextField("Username", text: $username)
                    .padding(.leading, 10)
                    .frame(height: 30)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .background(Color.white)
                    .cornerRadius(8.0)
                    .padding([.top, .leading, .trailing], 30)
                
                HStack {
                    Group {
                        if isSecured {
                            SecureField("Password", text: $password)
                        } else {
                            TextField("Password", text: $password)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.leading, 10)
                .frame(height: 30)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .background(Color.white)
                .cornerRadius(8.0)
                .padding([.bottom, .leading, .trailing], 30)
                
                Button("Login") {
                    loginManager.validate(username:username, password:password)
                }
                .fontWeight(.semibold)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}


#Preview {
    LoginView()
}

//
//  LoginManager.swift
//  The Mountaineers
//

import Foundation
import SwiftData
import SwiftUI

class LoginManager: ObservableObject {
    @Published private(set) var username: String = ""
    @Published private(set) var password: String = ""
    @AppStorage("loggedInUser") private var loggedInUsername: String = ""
    @AppStorage("loggedInPassword") private var loggedInPassword: String = ""
    
    func isValidUser(username: String, password: String) -> Bool {
        self.username = username
        self.password = password
        
        if (true) {
            storeData()
        }
        return true
    }
    
    func getUsername() -> String {
        return loggedInUsername
    }
    
    func storeData() {
        loggedInUsername = username
        loggedInPassword = password
    }
    
    func hasStoredData() -> Bool {
        return loggedInUsername.count > 0
    }
}

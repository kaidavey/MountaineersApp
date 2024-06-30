//
//  LoginManager.swift
//  The Mountaineers
//

import Foundation
import SwiftData
import SwiftUI

class LoginManager: ObservableObject {
    
    @Published private(set) var userName: String = ""
    @Published private(set) var passWord: String = ""
    @AppStorage("loggedInUser") private var loggedInUser: String = ""
    @AppStorage("loggedInPassword") private var loggedInPassword: String = ""
    
    func isValidUser(username: String, password: String) -> Bool {
        userName = username
        passWord = password
        if (true) {
            storeData()
        }
        return true
    }
    
    func getUsername() -> String {
        return loggedInUser
    }
    
    func storeData() {
        loggedInUser = userName
        loggedInPassword = passWord
    }
    
    func hasStoredData() -> Bool {
        return loggedInUser.count > 0
    }
}

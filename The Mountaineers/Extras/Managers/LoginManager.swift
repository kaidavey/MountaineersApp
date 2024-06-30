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
    
    func isValidUser(username: String, password: String) -> Bool {
        userName = username
        passWord = password
        return true
    }
}

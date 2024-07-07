//
//  GlobalVariables.swift
//  The Mountaineers
//

import Foundation
import Combine

class GlobalVariables: ObservableObject {
    static let shared = GlobalVariables()
    
    @Published var showHamburger: Bool = true
    
    private init() {}
}

//
//  LoginManager2.swift
//  The Mountaineers
//
/*
import Foundation
import UIKit
import Alamofire
import SwiftSoup


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Keychain service
        let keychain = Keychain(service: "com.example.yourapp")
        
        // Store user credentials securely in Keychain
        do {
            try keychain.set("yourusername", key: "username")
            try keychain.set("yourpassword", key: "password")
        } catch let error {
            print("Error storing credentials: \(error)")
        }
        
        // Retrieve user credentials
        var username: String?
        var password: String?
        do {
            username = try keychain.get("username")
            password = try keychain.get("password")
        } catch let error {
            print("Error retrieving credentials: \(error)")
        }
        
        guard let un = username, let pw = password else {
            print("Username or password not found")
            return
        }
        
        // URL for login
        let loginURL = "https://example.com/login"
        let dataURL = "https://example.com/data"

        // Perform login and fetch data
        loginAndFetchData(loginURL: loginURL, dataURL: dataURL, username: un, password: pw)
    }

    func loginAndFetchData(loginURL: String, dataURL: String, username: String, password: String) {
        // Parameters for the login request
        let parameters: [String: String] = [
            "username": username,
            "password": password
        ]
        
        // Perform the login request
        AF.request(loginURL, method: .post, parameters: parameters).response { response in
            guard let headers = response.response?.headers else {
                print("Failed to get headers")
                return
            }

            // Assuming cookies are used for authentication
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headers.dictionary, for: response.response!.url!)
            HTTPCookieStorage.shared.setCookies(cookies, for: response.response!.url, mainDocumentURL: nil)

            // Fetch the data after logging in
            self.fetchData(url: dataURL)
        }
    }

    func fetchData(url: String) {
        // Fetch the data
        AF.request(url).responseString { response in
            switch response.result {
            case .success(let html):
                do {
                    let doc: Document = try SwiftSoup.parse(html)
                    
                    // Example: Scrape a specific element
                    let scrapedData = try doc.select("div.example").text()
                    print("Scraped Data: \(scrapedData)")
                    
                    // Update UI or handle the scraped data
                    DispatchQueue.main.async {
                        // self.updateUIWithScrapedData(scrapedData)
                    }
                } catch Exception.Error(let type, let message) {
                    print("Message: \(message)")
                } catch {
                    print("error")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
*/

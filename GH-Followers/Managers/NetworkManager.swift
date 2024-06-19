//
//  NetworkManager.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 19/06/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    private init() {}
    
    func getFollowers(for username: String, page:Int, completed: @escaping ([Follower]?,errorMessage?) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil,.invaildUsername)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil,.unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil,.invaildResponse)
                return
            }
            
            guard let data = data else {
                completed(nil,.invaildData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                completed(nil,.invaildData)
            }
        }
        
        task.resume()
    }
}

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
    
    func getFollowers(for username: String, page:Int, completed: @escaping ([Follower]?,String?) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil,"This username created an invaild request, Please Try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(nil,"Unable to complete your request, Please Check your internet connection.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil,"Invaild response from the server, Please try again.")
                return
            }
            
            guard let data = data else {
                completed(nil,"The data recieved from the server is invalid, Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
            } catch {
                completed(nil,"The data recieved from the server is invalid, Please try again.")
            }
        }
        
        task.resume()
    }
}

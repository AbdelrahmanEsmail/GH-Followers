//
//  NetworkManager.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 19/06/2024.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com"
    let cache = NSCache<NSString,UIImage>()
    
    
    private init() {}
    
    func getFollowers(for username: String, page:Int, completed: @escaping (Result<[Follower],GFError>) -> Void){
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invaildUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invaildResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invaildData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invaildData))
            }
        }
        
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User,GFError>) -> Void){
        let endpoint = baseURL + "/users/\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invaildUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invaildResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invaildData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invaildData))
            }
        }
        
        task.resume()
    }
}

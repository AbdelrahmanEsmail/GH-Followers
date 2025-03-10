//
//  PersistenceManager.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 10/10/2024.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    
    enum keys {
        static let favorites = "favorites"
    }

    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void){
        retrieveFavorites { result in
            switch result {
                
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else { completed(.alreadyInFavorites); return }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll {$0.login == favorite.login}
                }
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoriesData = defaults.object(forKey: keys.favorites) as? Data else { completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorties = try decoder.decode([Follower].self, from: favoriesData)
            completed(.success(favorties))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}

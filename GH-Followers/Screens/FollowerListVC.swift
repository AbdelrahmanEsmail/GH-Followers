//
//  FollowerListVC.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 15/06/2024.
//

import UIKit

class FollowerListVC: UIViewController {
    // MARK: - Properties
    var username: String!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        getFollowers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print("followers Count = \(followers.count)")
                print(followers)
            case . failure(let error ):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttomTitle: "Ok")
            }
        }
    }
}

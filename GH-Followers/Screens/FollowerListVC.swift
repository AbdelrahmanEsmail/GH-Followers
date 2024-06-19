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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers,errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage!, buttomTitle: "Ok")
                return
            }
            print("followers Count = \(followers.count)")
            print(followers)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

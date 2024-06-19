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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

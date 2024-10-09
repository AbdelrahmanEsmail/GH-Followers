//
//  GFItemInfoView.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 09/10/2024.
//

import UIKit

enum ItemInfoType {
     case repos, gists, followers, following
}

class GFItemInfoView: UIView {
    let sympolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(sympolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        sympolImageView.translatesAutoresizingMaskIntoConstraints = false
        sympolImageView.contentMode = .scaleAspectFill
        sympolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            sympolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            sympolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sympolImageView.widthAnchor.constraint(equalToConstant: 20),
            sympolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: sympolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
    
    func set(itemInfoType: ItemInfoType,withCount count: Int) {
        switch itemInfoType {
        case .gists:
            sympolImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
        case .repos:
            sympolImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
        case .followers:
            sympolImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            sympolImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        
        countLabel.text = String(count)
    }
}

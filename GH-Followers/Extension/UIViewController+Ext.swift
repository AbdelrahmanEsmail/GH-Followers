//
//  UIViewController+Ext.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 15/06/2024.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title:String,message:String,buttomTitle:String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttomTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}

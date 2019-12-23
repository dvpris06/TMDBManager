//
//  UIViewController+Extension.swift
//  TMDBManager
//
//  Created by dragdimon on 23/12/2019.
//

import UIKit

extension UIViewController {
    
    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        TMDBClient.logout(completion: handleLogout)
    }
    
    func handleLogout() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
        print("success")
    }
}

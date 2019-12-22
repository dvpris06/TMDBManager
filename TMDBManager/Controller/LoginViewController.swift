//
//  ViewController.swift
//  TMDBManager
//
//  Created by dragdimon on 20/12/2019.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginViaWebsite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(TMDBClient.apiKey)
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        TMDBClient.getRequestToken(completion: handleTokenResponse(success:error:))
    }
    
    func handleTokenResponse(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            DispatchQueue.main.async {
                TMDBClient.login(username: self.usernameTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: self.handleLoginResponse(success:error:))
            }
            
        } 
    }
    
    func handleLoginResponse(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
        }
    }

}


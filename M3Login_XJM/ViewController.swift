//
//  ViewController.swift
//  M3Login_XJM
//
//  Created by Moore, Xander J. on 2/3/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!;
    @IBOutlet weak var passwordTextField: UITextField!;
    @IBOutlet weak var resultLabel: UILabel!;
    
    @IBAction func loginButton(_ sender: Any) {
        let user = usernameTextField.text!;
        let pwd = passwordTextField.text!;
        
        resultLabel.text = (user == "XJM" && pwd == "1234") ? "Login successful" : (user.isEmpty || pwd.isEmpty) ? "Enter username & password" : "User not recognized";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
    }


}


//
//  ViewController.swift
//  M3Login_XJM
//
//  Created by Moore, Xander J. on 2/3/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginOutlet: UIButton!;
    @IBOutlet weak var usernameTextField: UITextField!;
    @IBOutlet weak var passwordTextField: UITextField!;
    @IBOutlet weak var resultLabel: UILabel!;
    
    @IBAction func loginButton(_ sender: Any) {
        guard let user = usernameTextField.text, !user.isEmpty else {
            showAlert("Enter username");
            return;
        }
        
        guard let pwd = passwordTextField.text, !pwd.isEmpty else {
            showAlert("Enter password");
            return;
        }
        
        resultLabel.text = (user == "XJM" && pwd == "1234") ? "Login successful" : "User not recognized";
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil);
        
        alert.addAction(okAction);
        present(alert, animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        usernameTextField.becomeFirstResponder();
    }


}

extension ViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var finalID = usernameTextField.text ?? "";
        var finalPass = passwordTextField.text ?? "";
        
        if textField == usernameTextField {
            guard let range = Range(range, in: finalID) else {
                return true;
            }
            
            finalID = finalID.replacingCharacters(in: range, with: string);
        }
        else if textField == passwordTextField {
            guard let range = Range(range, in: finalPass) else {
                return true;
            }
            
            finalPass = finalPass.replacingCharacters(in: range, with: string);
        }
        
        
        loginOutlet.isEnabled = !finalID.isEmpty && !finalPass.isEmpty;
        
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            let cnt = textField.text?.count ?? 0;
            let isValidID = (6 ... 12).contains(cnt);
            
            textField.layer.borderWidth = isValidID ? 0 : 2;
            textField.layer.borderColor = isValidID ? nil : UIColor.red.cgColor;
            textField.layer.cornerRadius = isValidID ? 0 : 5;
            textField.tintColor = isValidID ? view.tintColor : .red;
            
            return isValidID;
        }
        
        return true;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder();
        case passwordTextField:
            loginButton(self);
        default:
            break;
        }
        
        print(#function, textField);
        
        return false;
    }
}

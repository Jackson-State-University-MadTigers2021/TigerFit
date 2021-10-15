//
//  ViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/4/21.
//

import UIKit
import CoreData

extension UIViewController{
    func HideKeyboard () {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    @objc func DismissKeyboard() {
        view.endEditing(true)
    }
}


class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var jNumberTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
    }
    
    @IBAction func DidTappedSignIn() {
        // Check to see if username exists in our database
        // If not, show no user found error
        // If username does exisit, make sure the passwords match
        // If password matches, present the homeviewcontroller
        
        // Use this function to check if user exists in the database
        guard let jNumber = jNumberTextfield.text else {
            print ("No jNumber entered")
            return
        }
        print("username entered:", (jNumber))
        
        guard let password = passwordTextfield.text else {
            print ("No password entered")
            return
        }
        print("password entered:", (password))
        
        let student = UserService.instance.GetStudentByJNumber(jNumber: jNumber)
        
    
        // If student with jnumber IS NOT found, Print no user exists
        if(student == nil) {
            print("This user does not exist in the database.")
        }
        
        // Else Student is found, Present HomeView Controller (welcome page)
        else {
            if(student?.password == passwordTextfield.text!) {
                let viewController = UINavigationController(rootViewController: storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController)
                viewController.modalPresentationStyle = .fullScreen
                UserService.instance.jNumber = jNumber.uppercased()
                present(viewController, animated: true)
            }
            
            // Else Student is found, but the typed password does not match the Student's password in database
            else {
                print("Incorrect Password")
            
            }
          
        }
        
    }
    
}

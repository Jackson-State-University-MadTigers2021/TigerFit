//
//  CreateViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/7/21.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var jNumberTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var heightFTTextfield: UITextField!
    @IBOutlet weak var heightINTextfield: UITextField!
    @IBOutlet weak var weightTextfield: UITextField!
    @IBOutlet weak var goalWeightTextField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    

    private var newStudent: Student! // Pass the student data into the next create page to get diet information
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EndEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func DidTapNextButton(_ sender: Any) {
        
        guard let jNumber = jNumberTextfield.text else {
            print("No jnumber set")
            return
        }
        
        guard let password = passwordTextfield.text else {
            print("No password set")
            return
        }
        guard let name = nameTextfield.text else {
            print("No name set")
            return
        }
        guard let heightFT = heightFTTextfield.text else {
            print ("No height (FT) set")
            return
        }
        guard let heightIN = heightINTextfield.text else {
            print ("No height (IN) set")
            return
        }
        guard let weight = weightTextfield.text else {
            print("No weight set")
            return
        }
        guard let goalWeight = goalWeightTextField.text else {
            print("No goal weight set")
            return
        }
        
        newStudent = Student(id: jNumber, name: name, password: password, weight: Int32(weight)!, heightFT: Int32(heightFT)!, heightIN:  Int32(heightIN)!, goalWeight:  Int32(goalWeight)!)
        
        guard let createTwoViewController = storyboard?.instantiateViewController(identifier: "CreateTwoViewController") as? CreateTwoViewController else { return }
        createTwoViewController.student =  self.newStudent
        present(createTwoViewController, animated: true)
    }
    
    @objc func EndEditing() {
        view.endEditing(false)
    }

}

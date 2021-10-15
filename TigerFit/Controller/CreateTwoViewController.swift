//
//  CreateTwoViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/10/21.
//

import UIKit

class CreateTwoViewController: UIViewController {

    public var student: Student!
    
    @IBOutlet weak var dietTypeSegmented: UISegmentedControl!
    @IBOutlet weak var daysCountTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    @IBAction func FinishButtonTapped(_ sender: Any) {

        let dietType = dietTypeSegmented.selectedSegmentIndex
        
        guard let count = daysCountTextfield.text else { return }
        
        
        student.SetDietType(type: student.GetDietType(int: Int32(dietType)))
        student.SetNumberOfWorkoutDays(count: Int32(count)!)
        
        student.SaveToDatabase { (success, msg) in
            if success {
                guard let viewController = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else { return }
                self.present(UINavigationController(rootViewController: viewController), animated: true)
            } else {
                print(msg)
            }
        }
        

    }
}

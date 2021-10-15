//
//  SettingsViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/5/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var jNumberView: UIView!

    @IBOutlet weak var weightTextfield: UITextField!
    @IBOutlet weak var goalWeightTextfield: UITextField!
    @IBOutlet weak var heightFTTextfield: UITextField!
    @IBOutlet weak var heightINTextfield: UITextField!
    
    @IBOutlet weak var dietTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var workoutDaysTextfieldField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var jNumberTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    var newStudentInfomation: [String : Any?]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationBar()
        
        jNumberView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DidTapJnumberView)))
        
        let student = UserService.instance.student
        
        newStudentInfomation = [
            "id" : student!.id,
            "weight" : student!.weight,
            "goal-weight" : student!.goalWeight,
            "heightFT" : student!.heightFT,
            "heightIN" : student!.heightIN,
            "diet-type" : student!.dietType,
            "workout-days-count" : student!.workoutDaysCount,
            "password": student!.password
        ]
    }
    
    func SetupNavigationBar() {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "Settings"
        
        let tigerFitTitle = UILabel()
        tigerFitTitle.text = "TIGERFIT"
        tigerFitTitle.Spacing(spacing: 4)
        tigerFitTitle.textColor = APP_THEME_COLOR
        tigerFitTitle.font = UIFont(name: "Avenier-Next", size: 16)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tigerFitTitle)
        
        let saveButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 40))
        saveButton.setTitle("SAVE", for: .normal)
        saveButton.titleLabel?.textAlignment = .right
        saveButton.titleLabel?.Spacing(spacing: 2)
        saveButton.titleLabel?.font = UIFont(name: "Avenier-Next", size: 12)
        saveButton.setTitleColor(UIColor(named: "DarkBlue")!.withAlphaComponent(0.7), for: .normal)
        saveButton.addTarget(self, action: #selector(DidTapSaveButton), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
    }

    @objc func DidTapJnumberView() {
        // I will set this function up later, do not worry about this.
        print("Requested j-number change.")
    }
    
    @objc func DidTapSaveButton() {
  
        // Step 1: Safetly get infomation from the textfields/segmentcontrols
        // Do this for every textfield and segmented control
        // Here is an example of both(The textfields and segmentedcontrols are already linked as you can see above)
        
        // Here I am safetly getting the new number of workout out days from the textfield
        if let workoutDays = workoutDaysTextfieldField.text {
            // Here I am setting our new data by accessing the key used for weight
            // Must be the same key name I used in the newStudentInfomation above
            newStudentInfomation["workout-days-count"] = workoutDays
        }
        
        // Doing the samething for the segmented controls(Example)
        newStudentInfomation["diet-type"] = dietTypeSegmentedControl.selectedSegmentIndex

        
        // After you have gotten the information and overriden it in the newStudentInfomation dictionary
        // You have to save the student's new infomation in the database.
        // I have already created a function to do that for you and this is it.
        // Once you have finished setting the data you are done for now.
        UserService.instance.OverwriteStudent(jNumber: newStudentInfomation["id"] as! String, data: newStudentInfomation) { (success) in
            if success {
                print("Information was successfully overwritten")
            }
        }
       
    }
    
}

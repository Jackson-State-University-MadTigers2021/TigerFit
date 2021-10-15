//
//  ProgressViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/13/21.
//

import UIKit
import ALProgressRing

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var congratulationsLabel: UILabel!
    
    @IBOutlet weak var dailyInfomationLabel: UILabel!
    @IBOutlet weak var stepsTodayLabel: UILabel!
    @IBOutlet weak var caloriesTodayLabel: UILabel!
    
    
    @IBOutlet weak var allTimeInfomationLabel: UILabel!
    @IBOutlet weak var stepsTotalLabel: UILabel!
    @IBOutlet weak var caloriesTotalLabel: UILabel!
    @IBOutlet weak var workoutsTotalLabel: UILabel!
    
    @IBOutlet weak var progressView: UIView!
    
    private lazy var progressRing =  ALProgressRing()
    
    private var student: Student!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationBar()
        Initialize()
        SetupProgessCircle()
    }
    
    func SetupNavigationBar() {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.title = "Your Progress"
        
        let tigerFitTitle = UILabel()
        tigerFitTitle.text = "TIGERFIT"
        tigerFitTitle.Spacing(spacing: 4)
        tigerFitTitle.textColor = APP_THEME_COLOR
        tigerFitTitle.font = UIFont(name: "Avenier-Next", size: 16)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: tigerFitTitle)
        
        if let jNumber = UserService.instance.jNumber {
            let jNumberTitle = UILabel()
            jNumberTitle.text = jNumber
            jNumberTitle.text = UserService.instance.jNumber
            jNumberTitle.textColor = .lightGray
            jNumberTitle.Spacing(spacing: 2)
            jNumberTitle.font = UIFont(name: "Avenier Next-Bold", size: 16)
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: jNumberTitle)
        }
    }
    
    func Initialize() {
        if let student = UserService.instance.student {
            self.student = student
        }
        
        congratulationsLabel.text = "Congratulations \(student.name!)"
        
        
        dailyInfomationLabel.Spacing(spacing: 2.0)
        allTimeInfomationLabel.Spacing(spacing: 2.0)
        
        CaloriesBurnedPerHour(hours: 3)
    }
    
    func CaloriesBurnedPerHour(hours: Int) -> Double {
        var caloriesBurned: Double = 0 // This variable is what you will use to store the number of calories burned.
        let weightPounds = Double(student.weight!) // This is the current weight of the student in pounds
        let weightKilograms = PoundsToKiloGrams(weightInPounds: weightPounds) // This is the current weight of the student in kilograms
        
        // Find more information on MET value here https://www.acefitness.org/education-and-resources/professional/expert-articles/6434/5-things-to-know-about-metabolic-equivalents/
        // Do not worry too much about MET cause I have to create the exercises for this app and the met value will be
        // changed depending on the given exercise.
        let MET = 9.8
        
        // Create an algorithm that determines the number of calories burned.
        // Here is something I found online that may help you.
        
        // Here's your equation:
        // MET value multiplied by weight in kilograms tells you calories burned per hour (MET*weight in kg=calories/hour).
        // If you only want to know how many calories you burned in a half hour, divide that number by two.
        // If you want to know about 15 minutes, divide that number by four.
        
        // If the MET for running is 9.8
        // Suppose I ran 2 hours
        // caloresBurned = MET * WEIGHT IN KILOGRAMS
        
        return caloriesBurned
    }
    
    func PoundsToKiloGrams(weightInPounds: Double) -> Double {
        return weightInPounds * 0.45359237
    }
    
    func SetupProgessCircle() {
        progressView.addSubview(progressRing)
        
        progressRing.startColor = UIColor(named: "DarkBlue")!
        progressRing.endColor = UIColor(named: "DarkBlue")!

        progressRing.translatesAutoresizingMaskIntoConstraints = false
        progressRing.centerXAnchor.constraint(equalTo: progressView.centerXAnchor).isActive = true
        progressRing.centerYAnchor.constraint(equalTo: progressView.centerYAnchor).isActive = true
        // Make sure to set the view size
        progressRing.widthAnchor.constraint(equalToConstant: 180).isActive = true
        progressRing.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        progressRing.setProgress(0.9, animated: true)
    }
    
}

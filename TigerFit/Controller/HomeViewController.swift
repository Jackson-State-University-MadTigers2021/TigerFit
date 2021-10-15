//
//  HomeViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/16/21.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    @IBOutlet weak var mealTimeLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealView: UIView!
        
    @IBOutlet weak var startWeightCountLabel: UILabel!
    @IBOutlet weak var currentWeightCountLabel: UILabel!
    @IBOutlet weak var goalWeightCountLabel: UILabel!
    
    @IBOutlet weak var workOutVideoView: UIImageView!
    
    @IBOutlet weak var moreWorkoutsButton: UIButton!
    
    var currentStudent: Student!
    var currentMeal: Meal!
    var currentExercise: Exercise!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationBar()
        
        if let student = UserService.instance.student {
            startWeightCountLabel.text = "\(student.weight!) LBS"
            currentWeightCountLabel.text = "\(student.weight! - 6) LBS"
            goalWeightCountLabel.text = "\(student.goalWeight!) LBS"
            currentStudent = student
        }
        
        let exercise = exercises.randomElement()
        currentExercise = Exercise(name: exercise!["name"]!, videoPath: exercise!["videoPath"]!, intensity: exercise!["intensity"]!, description: exercise!["description"]!, time: exercise!["time"]!)
        
        mealImageView.clipsToBounds = true
        mealImageView.layer.cornerRadius = 4
        
        GenerateRandomMeal()
        
        mealView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(DidTapMealView)))
        
        
        GenerateThumbnailFrom(path: currentExercise.videoPath!) { (image) in
            self.workOutVideoView.image = image
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        mealTimeLabel.text = "IT'S LUNCH TIME" // \(GetEatingTime().uppercased())
    }
    
    func SetupNavigationBar() {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        if let name = UserService.instance.student?.name {
            self.title = "Welcome, \(name)"
        }
        
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
    
    @IBAction func PlayButtonTapped() {
        guard let viewController = storyboard?.instantiateViewController(identifier: "ExerciseViewController") as? ExerciseViewController else { return }
        viewController.exercise = currentExercise
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func DidTapMealView() {
        guard let viewcontroller = storyboard?.instantiateViewController(identifier: "MealViewController") as? MealViewController else { return }
        viewcontroller.meal = currentMeal
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    func GenerateRandomMeal() {
        let preference = currentStudent.dietType
        var meal = meals.randomElement()
        
        let timeOfDay = GetEatingTime()
        print(currentStudent.dietType)
        
        if timeOfDay == "Breakfast" {
            switch preference {
            case .Vegetarian:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Vegetarian" && meal!["type"] as! String != "Breakfast"
                break
                
            case .Vegan:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Vegan" && meal!["type"] as! String != "Breakfast"
                break
            case .Pescatarian:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Pescatarian" && meal!["type"] as! String != "Breakfast"
                break
            default:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal" && meal!["type"] as! String != "Breakfast"
                break
            }

        } else {
            print("Here")

            switch preference {
            case .Vegetarian:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Vegetarian" && meal!["type"] as! String == "Breakfast"
                break
                
            case .Vegan:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Vegan" && meal!["type"] as! String == "Breakfast"
                break
            case .Pescatarian:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal, Pescatarian" && meal!["type"] as! String == "Breakfast"
                break
            default:
                repeat {
                    meal = meals.randomElement()
                } while meal!["category"] as! String != "Normal" && meal!["type"] as! String == "Breakfast"
                break
            }

        }

            
            
        mealDescriptionLabel.text = "\(meal!["description"] as! String)"
        mealImageView.image = UIImage(named: "\(meal!["image"] as! String)")
        currentMeal = Meal(name: meal!["name"] as! String, calories: meal!["calories"] as! String, sugarInGrams: meal!["sugar"] as! String, sodiumInGrams: meal!["sodium"] as! String, totalFatInGrams: "4g", protienInGrams: meal!["protien"] as! String, fiberInGrams: meal!["fiber"] as! String, cholesterolInMilliGrams: meal!["cholesterol"] as! String, vitaminDInMilligrams: meal!["vitaminD"] as! String, calciumInMilligrams: meal!["calcium"] as! String, ironInMilligrams: meal!["iron"] as! String, potassiumInMillgrams: meal!["potassium"] as! String, mealDescription: meal!["description"] as! String, category: preference!)
        currentMeal.SetMealImageString(string: meal!["image"] as! String)
        currentMeal.SetMealIngedients(ingredients: meal!["ingredients"] as! [String])
    }
    
    func GenerateThumbnailFrom(path: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = Bundle.main.path(forResource: path, ofType:"mp4") else {
            debugPrint("video not found")
                return
        }
        
        let asset = AVURLAsset(url: URL(fileURLWithPath: url), options: nil)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let image = try imageGenerator.copyCGImage(at: CMTime(value: 2, timescale: 1), actualTime: nil)
            completion(UIImage(cgImage: image))
        } catch {
            print(error.localizedDescription)
            print("Failed to create thumbnail from video")
            completion(nil)
        }
    }
    
}

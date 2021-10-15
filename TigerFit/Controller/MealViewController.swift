//
//  MealViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/7/21.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var mealImageView: UIImageView!

    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealDescriptionLabel: UILabel!
    
    @IBOutlet weak var likeMealButton: UIButton!
    @IBOutlet weak var dislikeMealButton: UIButton!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var caloriesCountLabel: UILabel!
    @IBOutlet weak var sugarCountLabel: UILabel!
    @IBOutlet weak var sodiumCountLabel: UILabel!
    @IBOutlet weak var protienCountLabel: UILabel!
    @IBOutlet weak var fiberCountLabel: UILabel!
    @IBOutlet weak var cholesterolCountLabel: UILabel!
    @IBOutlet weak var vitaminDCountLabel: UILabel!
    @IBOutlet weak var calciumCountLabel: UILabel!
    @IBOutlet weak var ironCountLabel: UILabel!
    @IBOutlet weak var potassiumCountLabel: UILabel!
    
    @IBOutlet weak var mealCategoryLabel: UILabel!
    
    @IBOutlet weak var nutritionalView: UIView!
    
    public var meal: Meal!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetupNavigationBar()
        
        dislikeMealButton.layer.cornerRadius = 6
        likeMealButton.layer.cornerRadius = 6
        
        dislikeMealButton.clipsToBounds = true
        likeMealButton.clipsToBounds = true
        
        ingredientsTextView.clipsToBounds = true
        ingredientsTextView.layer.cornerRadius = 6
        
        nutritionalView.clipsToBounds = true
        nutritionalView.layer.cornerRadius = 6
        
        mealImageView.image = UIImage(named: meal.mealImageString)
        mealNameLabel.text = meal.name
        mealDescriptionLabel.text = meal.mealDescription
        
        ingredientsTextView.text = ""
        for ingredient in meal.ingredients {
            ingredientsTextView.text.append("\(ingredient)\n")
        }
        
        caloriesCountLabel.text = meal.calories
        sugarCountLabel.text = meal.sugarInGrams
        sodiumCountLabel.text = meal.sodiumInGrams
        protienCountLabel.text = meal.protienInGrams
        fiberCountLabel.text = meal.fiberInGrams
        cholesterolCountLabel.text = meal.cholesterolInMilliGrams
        vitaminDCountLabel.text = meal.vitaminDInMilligrams
        calciumCountLabel.text = meal.calciumInMilligrams
        ironCountLabel.text = meal.ironInMilligrams
        potassiumCountLabel.text = meal.potassiumInMillgrams
        
        switch meal.category {
        case .Vegetarian:
            mealCategoryLabel.text = "Normal, Vegetarian"
            break
        case .Vegan:
            mealCategoryLabel.text = "Normal, Vegan"
            break
        case .Pescatarian:
            mealCategoryLabel.text = "Normal, Pescatarian"
            break
        default:
            mealCategoryLabel.text = "Normal"
            break
        }
    }
    
    
    
    @objc func GoBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func SetupNavigationBar() {
        self.title = "Today's \(GetEatingTime())"
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        backButton.setTitle(" BACK", for: .normal)
        backButton.titleLabel?.Spacing(spacing: 1.8)
        backButton.titleLabel?.textAlignment = .left
        backButton.setTitleColor(APP_THEME_COLOR, for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.backward")?.withTintColor(APP_THEME_COLOR, renderingMode: .alwaysTemplate), for: .normal)
        backButton.addTarget(self, action: #selector(GoBack), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let newMealButton = UIButton()
        newMealButton.setImage(UIImage(systemName: "goforward")?.withTintColor(APP_THEME_COLOR, renderingMode: .alwaysTemplate), for: .normal)
        newMealButton.target(forAction: #selector(GoBack), withSender: self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: newMealButton)
        
        navigationController?.navigationBar.tintColor = APP_THEME_COLOR
    }

}

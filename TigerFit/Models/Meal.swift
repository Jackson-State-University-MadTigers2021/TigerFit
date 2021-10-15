//
//  Meal.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/28/21.
//

import Foundation

class Meal {
    private(set) public var name: String!
    
    private(set) public var calories: String!
    private(set) public var sugarInGrams: String!
    private(set) public var sodiumInGrams: String!
    private(set) public var totalFatInGrams: String!
    private(set) public var protienInGrams: String!
    private(set) public var fiberInGrams: String!
    
    private(set) public var cholesterolInMilliGrams: String!
    
    private(set) public var vitaminDInMilligrams: String!
    private(set) public var calciumInMilligrams: String!
    private(set) public var ironInMilligrams: String!
    private(set) public var potassiumInMillgrams: String!
    
    private(set) public var mealDescription: String!
    
    private(set) public var category: DietType!
    
    private(set) public var mealImageString: String!
    
    private(set) public var ingredients: [String]!
    
    init(name: String, calories: String, sugarInGrams: String, sodiumInGrams: String, totalFatInGrams: String, protienInGrams: String, fiberInGrams: String, cholesterolInMilliGrams: String, vitaminDInMilligrams: String, calciumInMilligrams: String, ironInMilligrams: String, potassiumInMillgrams: String, mealDescription: String, category: DietType) {
        self.name = name
        self.calories = calories
        self.sugarInGrams = sugarInGrams
        self.sodiumInGrams = sodiumInGrams
        self.totalFatInGrams = totalFatInGrams
        self.protienInGrams = protienInGrams
        self.fiberInGrams = fiberInGrams
        self.cholesterolInMilliGrams = cholesterolInMilliGrams
        self.vitaminDInMilligrams = vitaminDInMilligrams
        self.calciumInMilligrams = calciumInMilligrams
        self.ironInMilligrams = ironInMilligrams
        self.potassiumInMillgrams = potassiumInMillgrams
        self.mealDescription = mealDescription
        
        self.category = category
    }
    
    func SetMealImageString(string: String) {
        self.mealImageString = string
    }
    
    func SetMealIngedients(ingredients: [String]) {
        self.ingredients = ingredients
    }
}

let meals = [
    [
        "name" : "Crispy Almond Flour Waffles",
        "ingredients" : [
            "3 large eggs",
            "1 1/2 cups of applesauce",
            "1 1/4 cups of any milk",
            "1/2 cup maple syrup",
            "1 tsp baking soda",
            "1/2 tsp salt",
            "2 cups oat flour",
            "2 cups almond flour"
        ],
        "calories" : "225",
        "sugar" : "13g",
        "sodium" : ".22g",
        "protien" : "7g",
        "fiber" : "13g",
        "cholesterol" : "35mg",
        "vitaminD" : ".1mg",
        "calcium" : "77mg",
        "iron" : "2mg",
        "potassium" : "102mg",
        "description" : "These Almond Flour Waffles are crispy, flavorful, and 100% gluten-free and oil-free!",
        "image": "FoodImages/0",
        "category" : "Normal, Vegetarian",
        "type" : "Breakfast"
    ],
    
    [
        "name" : "Quinoa Breakfast Bake",
        "ingredients" : [
            "1/2 cup of uncooked quinoa",
            "1 cup of uncooked steal oats",
            "1/2 cup of coconut flakes",
            "1 cup of milk",
            "1 bananna",
            "1/4 cup of blueberries",
            "1/4 cup of raspberries",
            "2 eggs",
            "1 tsp of cinnamon",
            "1 tsp of salt",
            "1 cup of greek yogurt"
        ],
        "calories" : "168",
        "sugar" : "10g",
        "sodium" : ".088g",
        "protien" : "5g",
        "fiber" : "4g",
        "cholesterol" : "36mg",
        "vitaminD" : ".1mg",
        "calcium" : "88mg",
        "iron" : "1mg",
        "potassium" : "1mg",
        "description" : "This easy Quinoa Breakfast Bake is layers of fresh fruit, quinoa, and oats smothered in a cinnamon and syrup egg mixture that is baked.",
        "image": "FoodImages/1",
        "category" : "Normal, Vegetarian",
        "type" : "Breakfast"
    ],
    
    [
        "name" : "Sweet Potato-Black Bean Burgers",
        "ingredients" : [
            "2 cups grated sweet potato",
            "1/2 cup old-fashioned rolled cuts",
            "1 cup no-salt-added black beans",
            "1/2 cup chopped scallions",
            "1/4 cup vegan mayo",
            "1 tablespoon no-salt-added tomato paste",
            "1 teaspoon curry powder",
            "1/2 cup plain unsweetened almond milk yogurt",
            "2 tables chopped fresh dill",
            "2 tablespoons lemon juice",
            "2 tablespoons extra-virgin olive oil",
            "4 whole-wheat hamburger buns",
            "1 cup thinly sliced cucumber"
        ],
        "calories" : "454",
        "sugar" : "8.8g",
        "sodium" : ".4324g",
        "protien" : "11.5g",
        "fiber" : "8.9g",
        "cholesterol" : "5mg",
        "vitaminD" : "5mg",
        "calcium" : "200.1mg",
        "iron" : "3.5mg",
        "potassium" : "612.4mg",
        "description" : "These vegan sweet potato-black bean burgers spiced with curry powder are easy to make. Blending the mixture with your hands gives you a soft, uniform texture then the outside gets crispy by cooking in a cast-iron pan.",
        "image": "FoodImages/2",
        "category" : "Normal, Vegan",
        "type" : "None"
    ],
    
    [
        "name" : "Spicy Weight-Loss Cabbage Soup",
        "ingredients" : [
            "2 tablespoons extra-virgin olive oil",
            "2 cups chopped onions",
            "1 cup chopped carrot",
            "1 cup chopped celery",
            "1 cup chopped green bell pepper",
            "4 large cloves garlic, minced",
            "8 cups sliced cabbage",
            "1 tablespoon tomato paste",
            "1 teaspoon ground cumin",
            "4 cups low-sodium vegetable broth or chicken broth",
            "4 cups water",
            "2 (15 ounce) cans pinto or black beans",
            "2 tablespoons lime juice"
        ],
        "calories" : "167",
        "sugar" : "6.6g",
        "sodium" : "4081g",
        "total fat" : "3.8g",
        "protien" : "6.5g",
        "fiber" : "1.75g",
        "cholesterol" : "0.0mg",
        "vitaminD" : "1mg",
        "calcium" : "115mg",
        "iron" : "2.3mg",
        "potassium" : "623.4mg",
        "description" : "Based on a popular weight-loss plan, this healthy cabbage soup recipe gets tons of flavor and a metabolism-boosting kick from spicy chiles.",
        "image": "FoodImages/3",
        "category" : "Normal, Vegan",
        "type" : "None"
    ],
    
    [
        "name" : "Quinoa Bowls with Arugula & Shrimp",
        "ingredients" : [
            "1 (16 ounce) package frozen cooked quinoa",
            "1 (16 ounce) package frozen peeled and deveined cooked large shrimp",
            "1/2 cup green goddess salad dressing",
            "1 (7 ounce) package baby arugula",
            "1/2 cup crumbled feta cheese",
        ],
        "calories" : "234",
        "sugar" : "2g",
        "sodium" : ".1838",
        "total fat" : "7g",
        "protien" : "14.6g",
        "fiber" : "4g",
        "cholesterol" : "52.2mg",
        "vitaminD" : ".5mg",
        "calcium" : "173.7mg",
        "iron" : "2.9mg",
        "potassium" : "378.1mg",
        "description" : "High-protein lunch bowls in under 20 minutes. Soy-free, Nut-free, Gluten-Free, Egg Free, Healthy.",
        "image": "FoodImages/4",
        "category" : "Normal, Pescatarian",
        "type" : "None"
    ]
    
    
]

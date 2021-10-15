//
//  Student.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/7/21.
//

import UIKit
import CoreData

enum DietType: Int32 {
    case None = 0
    case Vegetarian = 1
    case Vegan = 2
    case Pescatarian = 3
}

class Student {
    
    private(set) public var id: String!
    private(set) public var name: String!
    private(set) public var password: String!
    private(set) public var weight: Int32!
    private(set) public var heightFT: Int32!
    private(set) public var heightIN: Int32!
    private(set) public var goalWeight: Int32!
    
    private(set) public var workoutDaysCount: Int32!
    private(set) public var dietType: DietType!
    
    init(id: String, name: String, password: String, weight: Int32, heightFT: Int32, heightIN: Int32, goalWeight: Int32) {
        self.id = id
        self.name = name
        self.password = password
        self.weight = weight
        self.heightFT = heightFT
        self.heightIN = heightIN
        self.goalWeight = goalWeight
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
        self.password = ""
    }
    
    func SetDietType(type: DietType) {
        self.dietType = type
    }
    
    func SetNumberOfWorkoutDays(count: Int32) {
        self.workoutDaysCount = count
    }
    
    func SaveToDatabase(completion: @escaping (Bool, String) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { completion(false, "Failed to get app delegate"); return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StudentEntity", in: managedContext)!
        let newStudent = NSManagedObject(entity: entity, insertInto: managedContext)
        
        newStudent.setValue(id, forKey: "id")
        newStudent.setValue(name, forKey: "name")
        newStudent.setValue(password, forKey: "password")
        newStudent.setValue(heightIN, forKey: "heightIN")
        newStudent.setValue(heightFT, forKey: "heightFT")
        newStudent.setValue(goalWeight, forKey: "goalWeight")
        newStudent.setValue(weight, forKey: "weight")
        
        do {
            try managedContext.save()
            UserService.instance.jNumber = id
            completion(true, "Successfully created the user")
        } catch let error as NSError {
            print("Could not save the new student. \(error), \(error.userInfo)")
            completion(false, "Failed to save the new student.")
        }
    }

    
    func GetDietType(int: Int32) -> DietType {
        switch int {
        case 1:
            return .Vegetarian
        case 2:
            return .Vegan
        case 3:
            return .Pescatarian
        default:
            return .None
        }
    }
}

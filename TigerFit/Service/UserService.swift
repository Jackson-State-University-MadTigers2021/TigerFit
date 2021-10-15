//
//  UserService.swift
//  TigerFit
//
//  Created by Kyla Wilson on 3/9/21.
//

import UIKit
import CoreData

class UserService {

    public static let instance = UserService()
    
    let defaults = UserDefaults.standard
    
    var jNumber: String? {
        get {
            return defaults.string(forKey: J_NUMBER_KEY)
        } set {
            defaults.setValue(newValue, forKey: J_NUMBER_KEY)
        }
    }
    
    var student: Student? {
        get {
            if let number = jNumber {
                return GetStudentByJNumber(jNumber: number)
            }
            
            return nil
        }
    }
    
    private init() { }
    
    func deleteAllData(entity: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false

        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }

        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    func GetStudentByJNumber(jNumber: String) -> Student? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentEntity")
        
        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)
            print(fetchedResults)
     

            for student in fetchedResults {
                let number = student.value(forKey: "id") as! String
                
                let name = student.value(forKey: "name") as! String
                let password = student.value(forKey: "password") as! String
                
                let weight = student.value(forKey: "weight") as! Int32
                let goalWeight = student.value(forKey: "goalWeight") as! Int32
                let heightIN = student.value(forKey: "heightIN") as! Int32
                let heightFT = student.value(forKey: "heightFT") as! Int32
                
                let dietType = student.value(forKey: "dietType") as! Int32
                let workoutDaysCount = student.value(forKey: "workoutDaysCount") as! Int32

                if number.lowercased() == jNumber.lowercased() {
                    let newStudent = Student(id: number, name: name, password: password, weight: weight, heightFT: heightFT, heightIN: heightIN, goalWeight: goalWeight)
                    newStudent.SetDietType(type: newStudent.GetDietType(int: dietType))
                    newStudent.SetNumberOfWorkoutDays(count: workoutDaysCount)
                    return newStudent
                }
            }
        } catch let error as NSError {
            print(error.description)
        }
        
        return nil
    }
    
    
    func OverwriteStudent(jNumber: String, data: [String: Any?], completion: @escaping (Bool) -> ()) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { completion(false); return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StudentEntity")
        
        do {
            let fetchedResults = try managedContext.fetch(fetchRequest)

            for student in fetchedResults {
                let number = student.value(forKey: "id") as! String
                
                if jNumber.lowercased() == number.lowercased() {
                    if let name = data["name"] as? String {
                        student.setValue(name, forKey: "name")
                    }
                    
                    if let password = data["password"] as? String {
                        student.setValue(password, forKey: "password")
                    }
                    
                    if let weight = data["weight"] as? String {
                        student.setValue(Int32(weight), forKey: "weight")
                    }
                    
                    if let goalWeight = data["goal-weight"] as? String {
                        student.setValue(Int32(goalWeight), forKey: "goalWeight")
                    }
                    
                    if let dietType = data["diet-type"] as? String {
                        student.setValue(Int32(dietType), forKey: "dietType")
                    }
                    if let workoutDaysCount = data["workout-days-count"] as? String {
                        student.setValue(Int32(workoutDaysCount), forKey: "workoutDaysCount")
                    }
                    
                    if let heightFT = data["heightFT"] as? String {
                        student.setValue(Int32(heightFT), forKey: "heightFT")
                    }
                    
                    if let heightIN = data["heightIN"] as? String {
                        student.setValue(Int32(heightIN), forKey: "heightIN")
                    }
                    
                    do {
                        try managedContext.save()
                        completion(true)
                    } catch let error as NSError {
                        print("Could not save the new student. \(error), \(error.userInfo)")
                        completion(false)
                    }
                } else {
                    completion(false)
                }
            }
            
            completion(true)
        } catch let error as NSError {
            print(error.description)
            completion(false)
        }
    }
    
    func ClearDatabase() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.deleteAllData()
    }
    
    func getCoreDataDBPath() {
            let path = FileManager
                .default
                .urls(for: .applicationSupportDirectory, in: .userDomainMask)
                .last?
                .absoluteString
                .replacingOccurrences(of: "file://", with: "")
                .removingPercentEncoding

            print("Core Data DB Path :: \(path ?? "Not found")")
        }
}

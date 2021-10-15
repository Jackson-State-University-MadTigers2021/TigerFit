//
//  Exercise.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/25/21.
//

import Foundation

class Exercise {
    private(set) public var name: String!
    private(set) public var videoPath: String!
    private(set) public var intensity: String!
    private(set) public var description: String!
    private(set) public var time: String!
    
    
    init(name: String, videoPath: String, intensity: String, description: String, time: String) {
        self.name = name
        self.videoPath = videoPath
        self.intensity = intensity
        self.description = description
        self.time = time
    }
}

let exercises = [
    [
        "name" : "15-min Dumbell Exercies",
        "videoPath" : "0",
        "intensity" : "This exercise is medium intensity and is for men and women.",
        "description" : "Get ready for one of the best Home Arm Workouts of your LIFE! Let's do this! A dumbbell only arm workout that you can do from the comfort of your own home! This workout is perfect to grow your biceps, forearms and triceps!",
        "time": "This exercise should only take 15 minutes if done properly. Spend no more than 30 minutes on this workout."
    ]
]

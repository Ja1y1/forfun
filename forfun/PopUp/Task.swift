//
//  Task.swift
//  forfun
//
//  Created by JAY on 16/05/2024.
//

//using an array 
import SwiftUI

//MARK TASK Model
struct Task: Identifiable{
    var id = UUID().uuidString
    var taskTitle : String
    var taskDescription : String
    
    
}
 
//tasks to show inside your popup 
var tasks : [Task] = [
Task(taskTitle: "Continue", taskDescription: "Continue game"),
Task(taskTitle: "Exit", taskDescription: "Exit game"),
Task(taskTitle: "toggle sound", taskDescription: "toggle sound"),
Task(taskTitle: "toggle music", taskDescription:"toggle music" ),
]

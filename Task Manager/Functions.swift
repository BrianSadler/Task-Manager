//
//  Functions.swift
//  Task Manager
//
//  Created by Brian Sadler on 9/13/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation
let currentCalander = Calendar.current
class functions {
    
    private var taskArray:[Task] = []
    var uncompletedTasks: [Task] {
        return taskArray.filter {$0.completed == false} // returns games that do have a due date (checked out)
    }
    var completedTasks: [Task] {
        return taskArray.filter {$0.completed == true} // returns games that do have a due date (checked out)
    }
    
    func addTask() {
        print("What task needs doing?")
        var taskTitle = readLine()
        while taskTitle == nil || taskTitle == "" {
            print("Invalid title, please try again:")
            taskTitle = readLine()
            print("Describe the task")
            
        }
     
        print("Please describe the task")
        let newDescription = readLine()
        print("How many days do you have to complete the task?")
        let currentCalander = Calendar.current
        let numOfDays = Int(readLine()!)
        let completeBy = currentCalander.date(byAdding: .day, value: numOfDays!, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The task needs to be completed by \(dateFormatter.string(from: completeBy!))")
        let newTask = Task(title: taskTitle!, description: newDescription!, dueDate: completeBy!)
        
        print("""
 What is the priority of the task?
 1 = Highest
 2 = Second Highest
 3 = Third Highest
 4 = Lowest
 Any other input will set it at lowest priority
 """)
    let priorityInput = readLine()
        switch priorityInput {
        case "1":
              taskArray.insert(newTask, at: 0)
        case "2":
            taskArray.insert(newTask, at: 1)
        case "3":
            taskArray.insert(newTask, at: 2)
        case "4":
            taskArray.insert(newTask, at: taskArray.endIndex)
        default:
            taskArray.append(newTask)
        }
    print("Task added!")
    }
    
    func removeTask() {
        taskArray.printElements()
        
        print("Please enter the index of the game to remove:")
        
        let index = getIndex(maxIndex: taskArray.count)
        
        taskArray.remove(at: index)
        print("Task removed!")
    }
    func completeTask(){
        print("What task has been completed?")
        uncompletedTasks.printElements()
        let task = uncompletedTasks[getIndex(maxIndex: uncompletedTasks.count)]
        task.completed = true
        print("Another one bites the dust!")
        
    }
    func showTasks()
    {    print("These are your current tasks")
         taskArray.printElements()
    }
    func listCompleted() {
        if completedTasks.isEmpty{
            print("Looks like we need to get to work!")
            
        }
        else {
            print("These tasks are completed! Good work, lets keep it going!")
            completedTasks.printElements()
    }
    
}
    func listUncompleted() {
        if uncompletedTasks.isEmpty {
            print("Looks like it's time for a break")
        }
        else {
            print("These tasks still need to be done")
            uncompletedTasks.printElements()
        }
    }
    func setTaskUncomplete(){
        print("Did we speak too soon on one of these? ")
        completedTasks.printElements()
        let task = completedTasks[getIndex(maxIndex: completedTasks.count)]
        task.completed = false
        print("We'll get em next time")
        
    }
    func editTask(){
        print("Which task would you like to edit?")
        uncompletedTasks.printElements()
        let task = uncompletedTasks[getIndex(maxIndex: uncompletedTasks.count)]
        print("What should the task have been named?")
        task.title = readLine()!
        print("How should the task have been described?")
        task.description = readLine()!
        print("Does the priority need to change, yes or no?")
        var userAnswer = readLine()!
        if userAnswer == "Yes" || userAnswer == "Y" || userAnswer == "yes" || userAnswer == "y" {
            print("""
 What is the priority of the task?
 1 = Highest
 2 = Second Highest
 3 = Third Highest
 4 = Lowest
 Any other input will set it at lowest priority
 """)
            let priorityInput = readLine()
            switch priorityInput {
            case "1":
                taskArray.insert(task, at: 0)
            case "2":
                taskArray.insert(task, at: 1)
            case "3":
                taskArray.insert(task, at: 2)
            case "4":
                taskArray.insert(task, at: taskArray.endIndex)
            default:
                taskArray.append(task)
            }
           
        }
        print("Does the date the task needs to be done by need to change, yes or no?")
        var userAnswer2 = readLine()!
        if userAnswer2 == "Yes" || userAnswer == "Y" || userAnswer == "yes" || userAnswer == "y" {
            print("In how many days should the task completed by?")
            let currentCalander = Calendar.current
            let numOfDays = Int(readLine()!)
            let completeBy = currentCalander.date(byAdding: .day, value: numOfDays!, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: task.dueDate!)
            print("\(task.title) should now be complete on \(dateString) ")
            
        }
        print("Task has been edited!")
        
    }

}

//
//  Functions.swift
//  Task Manager
//
//  Created by Brian Sadler on 9/13/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//


import Foundation
let men = Menu()

class functions {
    
    var taskArray:[Task] = []
    var uncompletedTasks: [Task] {
        return taskArray.filter {$0.completed == false} // returns  tasks that are not completed
    }
    var completedTasks: [Task] {
        return taskArray.filter {$0.completed == true} // returns tasks that are competed
    }
    func getPriority() -> String {
        
        var input: String? = nil
        
        repeat {
            
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if line == "Low" || line == "High"  {
                
                input = line
                 
            } else {
                
                print("Invalid input")
            }
            
        } while input == nil
        
        return input!
    }
    func getDay() -> Int {
        
        var num: Int? = nil
        
        repeat {
            
            let line = Int(readLine()!)
            
            guard let _ = line else {
                
                print("Invalid input! Please try again:")
                
                continue
                
            }
            if line! >= 0 {
                
                num = line
                
            } else {
                
                print("Invalid input! Please try again:")
                num = nil
            }
            
        } while num == nil
        
        return num!
        
    }
    func addTask() {
        var priorityChoice: Task.PrioritySelection!
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
        let numOfDays = getDay()
        let completeBy = currentCalander.date(byAdding: .day, value: numOfDays, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The task needs to be completed by \(dateFormatter.string(from: completeBy!))")
        print("What is the priority of the task? Input High or Low.")
        let priorityInput = getPriority()
        if priorityInput == "High" {
            
            priorityChoice = .High
            
        }
        else if priorityInput == "Low" {
            
            priorityChoice = .Low
        }
        
        
        let newTask = Task(title: taskTitle!, Taskdescription: newDescription!, dueDate: completeBy!, priority: priorityChoice! )
        taskArray.append(newTask)
        
        
        
        
        
        
        print("Task added!")
    }
    
    //END OF ADD TASK
    
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
        let editedTitle = readLine()!
        task.title = editedTitle
        print("How should the task have been described?")
        let editedDescription = readLine()!
        task.Taskdescription = editedDescription
        print("Does the priority need to change, yes or no? Any other input will result in no")
        var userAnswer = readLine()!
        if userAnswer == "Yes" || userAnswer == "Y" || userAnswer == "yes" || userAnswer == "y" {
            print("What is the priority of the task? Input High or Low.")
            var priorityChoice: Task.PrioritySelection!
            let priorityInputEdit = getPriority()
            if priorityInputEdit == "High" {
                
                priorityChoice = .High
                
            }
            else if priorityInputEdit == "Low" {
                
                priorityChoice = .Low
            }
            task.priority = priorityChoice
            
        }
       
        print("Does the date the task needs to be done by need to change, yes or no? Any other input will result in no")
        var userAnswer2 = readLine()!
        if userAnswer2 == "Yes" || userAnswer2 == "Y" || userAnswer2 == "yes" || userAnswer2 == "y" {
            print("In how many days should the task completed by?")
            let currentCalander = Calendar.current
            let numOfDays = getDay()
            var completeBy = currentCalander.date(byAdding: .day, value: numOfDays, to: Date())
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            task.dueDate = completeBy
            let dateString = dateFormatter.string(from: task.dueDate!)
            
            print("\(task.title) should now be complete on \(dateString) ")
            
        }
        print("Task has been edited!")
        
    }
    func easter() {
        print("""
░░░░░░░░░░░░░░░░░░░▒▓▓█████████████▓▓▒░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░▒████▓▓▒▒░▒▒▒░▒▒▒▒▒▒▓▓████▓▒░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░▒███▓░░░░░░░░░░░░░░░░░░░░░░▒███████▓▓▒░░░░░░░░░░░
░░░░░░░░░▒██▓░░░░▒▒███▓▓▒░░░░░░░░░░░░░▓▓▒▒▒▒▒▓██████▓░░░░░░░
░░░░░░░▒██▓░░░▓███▓▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░░░░░▒▓▓███▓████▒▒░░░
░░░░░░██▓░░▒▓██▓░░▒▓██████▓░░░░░░░▒░░░░░░▒██▓▒░░░▓███▒▓▒░░░░
░░░░░██░░▓███▒░░▒██▒░░░░▒▒██▓░░░░░░░░░░░██▒░░░░▒████▒█░░░░░░
░░░░██░▒▓▒▓▓░░░██░░░░░░░░░░░█▓░░░░░░░░░██░░░░░░▒███░░█▒░░░░░
░░░▓█░░░░░░░░░██░░░░░░░░░░░░▓█░░░░░░░░██░░░░░░░░░░░░░█▒░░░░░
░░░█▓░░░░░░░░░█▒░░████░░░░░░░█▒░░░░░░░██░░░░░░░░░░░░███░░░░░
░░▒█░░░░░░░▒▓▒█▓░▓████▓░░░░░▒█░░░░░░░░▒█▒░░░░░░░░░░██░█▒░░░░
░░██░░░░░▒▓▒▓▒██▒▒▓▓▓░░░░░░░██░░░░░░░░░▒████▓███████▓░█▒░░░░
░░█▓░░░░░▒░░░▒░▒██▓▒░░░░░▒██▓░░░░░░░░░░░░░░██▓░░░░░░▒██▓░░░░
░░█░░░░░░░░░▓▒░░░░▒▓██████▓░░░░░░░░░░░░░░▒██░░░▓█▓▓▒░░░██░░░
░▒█░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒▓▒▒▒▒▒▓▓▓▓██░░▓█▓░▒▒██▒░░██░░
░▓█░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▓▓▒░░██░░██▓░▒░▒░██░░▒█░░
░██░░░░░░░░░░░░░░░░░░░░░░░▒▓▒▒▒▒▒▒▒▒░░░██░░▓█░█▓░█▒█▓█▓░░█░░
░██░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒░▒▒░░▓█▓░░██░█▒▒█▒█▒▓█░░█░░
░██░░░░░░░░░░░░░░░░░░░░░░░░▒░░░░░░░░░░▓█░░░█▒░░░░▒▒░░▒█░▓█░░
░▒█░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░█▒░░█▒░░░░░░░░▓█░█▓░░
░░█▓░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓█░░█▒░░░░░░░░█░▒█░░░
░░▓█░░▒░░▒▒░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░░█▓░█▓░░░
░░░█▒░░▒░░▒░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░▓█░░█░░░░
░░░██░░░▒░▒░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░██░░█░░░░
░░░░█▓░░░▒░▒░░░░▒▒░░░░░▒▒▒▒▒▒░░░░░░░░░░▒█░▒█░░░░░░░█▒░░█▓░░░
░░░░▓█░░░░▒▒░░░░░▒▒░░░░░░▒▒▒▓▓▓▒░░░░░░░██░██░░░░░░░██░░▓█░░░
░░░░░██░░░▒░▒░░░░░▒░░░░░░░░▒░▒▒▓█▒░░░░▒█░░█▓▒▓▓▓▒░░▓█░░░█▒░░
░░░░░▒█▒░░░▒▒▒░░░░▒░░░░░░░░░░▒▒▒░▒▓░░░██░▒█░░░░▒▓▓░░██░░█▒░░
░░░░░░▒█▒░░░▒░▒░░░▒░░░░░░▒▒▒░░░░▒▒░░░▒█░░██░░░░░░░█░▒█░░█▒░░
░░░░░░░▓█░░░▒░▒░░░░▒▒░░░░▓▒▒▓▓▓▒░░▓▒░██░░██▒▒▒▒▓▒▓▓███░░█▒░░
░░░░░░░░██░░░▒░▒░░░░░▒▒░░░░░░░░▓█▓░░░█▓░░██░▓█░█░█░░█▒░░█▒░░
░░░░░░░░░██░░░░▒▒░░░░░░▒▒░░░░░░░░▒█▓░█▓░░▓█▒▒█▒█░█▒██░░▒█░░░
░░░░░░░░░░██▒░░░░▒░░░▒░░░▒▒░░░░░░░░▒▓██░░░██░░░░▒▒██░░░██░░░
░░░░░░░░░░░▓██░░░░░░░░▒▒░░░▒░░░░░░░░░▓█░░░░▓███▓▓██░░░██░░░░
░░░░░░░░░░░░░▓██▒░░░░░░▒▒▒▒▒░░░░░░░░░░██░░░░░░▒▒▒░░░░██░░░░░
░░░░░░░░░░░░░░░▓███▒░░░░░░░▒▒▒▒▒▒▒▒░░░░▓██▒░░░░░░░▒███░░░░░░
░░░░░░░░░░░░░░░░░▒▓███▓▒░░░░░░░▒░░▒▒▒▒░░░▒██▓██████▓░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░▒████▓▒▒░░░░░░░░░░░░░░░▓██▒░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░▒▓████▓░░░░░░░▓█████▒░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒█████████▒░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒░░░░░░░░░░░░░░░░░░░░░░░
""")
    }
    
}



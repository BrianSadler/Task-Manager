//
//  Menu.swift
//  Task Manager
//
//  Created by Brian Sadler on 9/13/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation

class Menu {
    let Functions = functions()
    var userQuit = false
    
    func quit() {
        userQuit = true
        print("Thanks for using the Task Manager!")
    }
    
    func menuStart() {
        repeat{
            
            print("""
        1. Add a task
        2. Remove a task
        3. Show all tasks
        4. Mark completed task
        5. Show all uncompleted tasks
        6. Show all completed tasks
        7. Mark completed task as incomplete
        8. Edit a task
        9. Quit

        """)
            var input = getInput()
            while validateInput(input) == false {
                print("Invalid input")
                input = getInput()
            }
            handleInput(input)
        } while !userQuit
        
        
        
    }
    func getInput() -> String {
        var input: String? = nil
        repeat {
            let line = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
            if line != "" {
                input = line
            } else {
                print("Invalid input.")
            }
        } while input == nil
        return input!
    }
    func validateInput(_ input: String) -> Bool {
        let menuOptions = Array(1...9)
        
        guard let number = Int(input) else { return false }
        return menuOptions.contains(number)
    }
    func handleInput (_ input: String) {
        switch input {
        case "1":
            Functions.addTask()
            sleep(2)
        case "2":
            Functions.removeTask()
            sleep(2)
        case "3":
            Functions.showTasks()
            sleep(2)
        case "4":
            Functions.completeTask()
            sleep(4)
        case "5":
        Functions.listUncompleted()
        case "6":
            Functions.listCompleted()
            sleep(2)
        case "7":
        Functions.setTaskUncomplete()
            sleep(2)
        case "8":
            Functions.editTask()
            sleep(2)
        case "9":
            quit()
        default:
            break
        }
    }
}
extension Array where Element == Task {
    func printElements() {       //calling print element will print the game titles and the index they are located at.
        for (index, task) in self.enumerated() {
            //Make a date formatter to format the due date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: task.dueDate!)
            print("\(index). \(task.title), \(task.description), \(dateString)")
        }
    }
}
func getIndex(maxIndex: Int) -> Int {
    var validInput: Int? = nil
    repeat {
        var userInput = Int(readLine()!)
        
        //If the user has entered something that can't be converted to an Int, make them put in more input
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        
        if userInput! < maxIndex && userInput! >= 0 {
            validInput = userInput
        } else {
            print("Please enter a valid index.")
        }
    } while validInput == nil
    
    return validInput!
}



//
//  Menu.swift
//  Task Manager
//
//  Created by Brian Sadler on 9/13/18.
//  Copyright © 2018 Brian Sadler. All rights reserved.
//

import Foundation
class Menu {
    var userQuit = false
    
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
        8. Quit
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
            print("up")
        case "2":
            print("up")
        case "3":
            print("up")
        case "4":
            print("up")
        case "5":
            print("up")
        case "6":
            print("up")
        case "7":
            print("up")
        case "8":
            print("up")
        case "9":
            print("up")
        default:
            break
        }
    }
}

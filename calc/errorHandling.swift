//
//  ErrorHandling.swift
//  calc
//
//  Created by Edwardchen on 3/4/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
//Creat a class for centrally handle errors
class errorHandling {
    func invalidInput(){
        //Exit when the index is odd and the value is not opeator.
        for (index,value) in args.enumerated(){
            if index % 2 != 0 && calcProccessTest.isOperator(currentToken: value) == false {
                print("Invalid input, please input format such as 1 + 1")
                exit(1)
            }
        //Exit when the index is even and the value is not a number.
            else if index % 2 == 0 && Int(value) == nil{
                print("Invalid input, please input format such as 1 + 1")
                exit(1)
            }
            else if args.count == 2{
                print("Invalid input, please input format such as 1 + 1")
                exit(1)
            }
        }
    }
    func divideByZero(){
        for (index,value) in args.enumerated(){
            if value == "/" && Int(args[index+1])! == 0{
                print("Can't divide by Zero")
                exit(2)
            }
        }
    }
}

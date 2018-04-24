//
//  ErrorHandling.swift
//  calc
//
//  Created by Edwardchen on 3/4/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
//A class for centrally handle error.
class errorHandling{
    func invalidInput(){
        for (index,value) in args.enumerated(){
            //exit and show error when the index is odd and value is not Operator.
            if index % 2 != 0 && calcProccessTest.isOperator(currentToken : value) == false {
            print("Invalid input. Please input format such as 1 + 1")
            exit(1)
            }
            // exit when the index is even and value is not number.
            else if index % 2 == 0 && Int(value) == nil{
                print("Invalid input. Please input format such as 1 + 1")
                exit(1)
            }
            else if args.count == 2 {
                print("Invalid input. Please input format such as 1 + 1")
                exit(1)
            }
        }
        }
    func devideByZero(){
        for (index,value) in args.enumerated(){
            if value == "/" && Int(args[index + 1])! == 0{
                print( "Can't divide by zero")
                exit(2)
            }
        }
    }
   }

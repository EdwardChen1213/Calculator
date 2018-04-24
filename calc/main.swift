    
//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

class calcProcess{
    var _index = -1
        //Assign an index to take token
    
    func nextToken()->String?{
        //Advance to the next token, and return it
        if _index < args.count - 1 && (args.count >= 3 || args.count == 1){
            _index += 1}
        return args[_index]
    }
    //Atom is the number in equation, the expression inside the parentheses can also be calculated here if needed in future.
    func compute_atom() -> Int{
        let currentToken = Int(nextToken()!)
        if currentToken != nil{
            return currentToken!
        }
        return currentToken!
    }
    func isOperator(currentToken : String)->Bool{
        if(currentToken == "+" || currentToken == "-"  || currentToken == "x"  || currentToken == "/"  || currentToken == "%" ){
            return true
        }
        else {
            return false
        }
    }
    func isLastOperand()->Bool{
       if _index == args.count - 1{
        return true
       }
       else {
        return false
        }
    }
    func getPrecedenceFromOperator(ope : String)->Int{
        switch ope {
        case "+","-":
            return 1
        case "x","/","%":
            return 2
        default:
            return 0
        }
    }
    //Calculate the expression with current operator
    func compute_operator(ope: String, result :Int,rhs :Int)->Int{
        switch ope {
        case "+":
            return result + rhs
        case "-":
            return result - rhs
        case "x":
            return result * rhs
        case "/":
            return Int(result / rhs)
        case "%":
            return result % rhs
        default:
            return -1
        }
    }
    func compute_expr(min_prec : Int) -> Int {
        var atom_lhs = compute_atom()
        while isLastOperand() == false{//return lhs if this is the end of expression
            let cur = nextToken()
            let prec = getPrecedenceFromOperator(ope: cur!)
            if
                (cur == nil || isOperator(currentToken: cur!) == false || prec < min_prec)
            {
                _index -= 1 //back to the previous token if break, becasue the extra token had been used in the beginning of the loop.
            break
            }
            if isOperator(currentToken: cur!) {
            let ope = cur
                let next_min_prec = prec + 1//Precedence climbing
            let atom_rhs = compute_expr(min_prec: next_min_prec)//Get into recursing
              atom_lhs = compute_operator(ope: ope!, result: atom_lhs, rhs: atom_rhs)
            }
        }
        return atom_lhs
    }
}
var calcProccessTest = calcProcess()
var errorTesting = errorHandling()
    errorTesting.invalidInput()
    errorTesting.divideByZero()
var expr = calcProccessTest.compute_expr(min_prec: 1)
print(expr)

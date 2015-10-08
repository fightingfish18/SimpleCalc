//
//  main.swift
//  SimpleCalc
//
//  Created by Smyth May on 10/7/15.
//  Copyright (c) 2015 Smyth May. All rights reserved.
//

import Foundation

let operandDictionary : [String : String] = ["Add" : "+", "Subtract" : "-", "Multiply" : "*", "Divide" : "/", "Modulo" : "%"];
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput();
    let inputData = keyboard.availableData;
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String;
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
}

func convert(incoming:String) -> Int {
    //return NSFormatter().numberFromString(incoming)!.integerValue;
    return 1;
}

func determineOperandAndConduct(operatorType:String, num1:Int, num2:Int) -> Int {
    switch operatorType {
    case operandDictionary["Add"]!:
        return num1 + num2;
    case operandDictionary["Subtract"]!:
        return num1 - num2;
    case operandDictionary["Multiply"]!:
        return num1 * num2;
    case operandDictionary["Divide"]!:
        return num1 / num2;
    case operandDictionary["Modulo"]!:
        return num1 % num2;
    default:
        return 0;
    }
}


let input1 = input();
let operand = input();
let input2 = input();

let num1 = convert(input1);
let num2 = convert(input2);

let result = determineOperandAndConduct(operand, num1, num2);
println(result);





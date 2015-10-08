//
//  main.swift
//  SimpleCalc
//
//  Created by Smyth May on 10/7/15.
//  Copyright (c) 2015 Smyth May. All rights reserved.
//

import Foundation

let simpleOperandDictionary : [String : String] = ["Add" : "+", "Subtract" : "-", "Multiply" : "*", "Divide" : "/", "Modulo" : "%"];
let complexOperandDictionary : [String : String] = ["Factorial" : "fact", "Average" : "avg", "Count" : "count"];
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput();
    let inputData = keyboard.availableData;
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String;
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
}


func determineSimpleOperandAndConduct(operatorType:String, num1:Int, num2:Int) -> Int {
    switch operatorType {
    case simpleOperandDictionary["Add"]!:
        return num1 + num2;
    case simpleOperandDictionary["Subtract"]!:
        return num1 - num2;
    case simpleOperandDictionary["Multiply"]!:
        return num1 * num2;
    case simpleOperandDictionary["Divide"]!:
        return num1 / num2;
    case simpleOperandDictionary["Modulo"]!:
        return num1 % num2;
    default:
        return 0;
    }
}

func determineComplexOperandAndConduct(operatorType:String, numberArray:[Int]) -> Int {
    var result = 1;
    switch operatorType {
    case complexOperandDictionary["Factorial"]!:
        if (numberArray.count == 1 && numberArray[0] < 21) {
            for (var i = 0; i < numberArray[0]; i++) {
                result *= (numberArray[0] - i);
            }
            return result;
        } else {
            print("Either too many numbers or too large number entered for Factorial");
        }
    case complexOperandDictionary["Average"]!:
        result = 0;
        for (var i = 0; i < numberArray.count; i++) {
            result += numberArray[i];
        }
        return result / numberArray.count;
    case complexOperandDictionary["Count"]!:
        return numberArray.count;
    default:
        return 0;
    }
    return 0;
}

var result = 0;
let input1 = input();
var inputArray = [String]();
let input1Trim = input1.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
if (input1Trim.containsString(" ")) {
    inputArray = input1Trim.characters.split{$0 == " "}.map(String.init);
}
let operand = input();
if (!simpleOperandDictionary.values.contains(operand)) {
    if (!complexOperandDictionary.values.contains(operand)) {
        print("Invalid operation selected");
    } else {
        if (inputArray.count > 0 || operand == "fact") {
            if (operand != "fact" || inputArray.count > 1) {
                var numberArray = [Int](count:inputArray.count, repeatedValue:0);
                for (var i = 0; i < inputArray.count; i++) {
                    let number:Int? = Int(inputArray[i]);
                    numberArray[i] = number!;
                }
                result = determineComplexOperandAndConduct(operand, numberArray: numberArray);
            } else {
                var numberArray = [Int](count:1, repeatedValue:0);
                let fNum:Int? = Int(input1Trim);
                numberArray[0] = fNum!;
                result = determineComplexOperandAndConduct(operand, numberArray: numberArray);
            }
        }
    }
} else {
    let input2 = input();
    let input2Trim = input2.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
    let num1:Int? = Int(input1Trim);
    let num2:Int? = Int(input2Trim);
    result = determineSimpleOperandAndConduct(operand, num1: num1!, num2: num2!);
}

print(result);
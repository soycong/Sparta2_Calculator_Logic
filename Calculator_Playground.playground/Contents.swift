import UIKit

class Calculator {
    //더하기
    func addOperation(_ num1: Double, _ num2: Double) -> Double {
        return num1 + num2
    }
    
    //빼기
    func substractOperation(_ num1: Double, _ num2: Double) -> Double {
        return num1 - num2
    }
    
    //곱하기
    func multiplyOperation(_ num1: Double, _ num2: Double) -> Double {
        return num1 * num2
    }
    
    //나누기
    func divideOperation(_ num1: Double, _ num2: Double) -> Double {
        if num2 == 0 {
            return 0
        } else {
            return num1 / num2
        }
    }
}

let calculator = Calculator()

var add = calculator.addOperation(5, 2)
var subtract = calculator.substractOperation(5, 2)
var multiply = calculator.multiplyOperation(5, 2)
var divide = calculator.divideOperation(5, 2)

print("더하기 결과: \(add)")
print("빼기 결과: \(subtract)")
print("곱하기 결과: \(multiply)")
print("나누기 결과: \(divide)")



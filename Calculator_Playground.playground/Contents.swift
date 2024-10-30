//import Foundation

protocol AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double?
}

class AddOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        return num1 + num2
    }
}

class SubtractOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        return num1 - num2
    }
}

class MultiplyOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        return num1 * num2
    }
}

class DivideOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        if num2 == 0 {
            return nil
        }
        
        return num1 / num2
    }
    
    func calculateRemainder(_ num1: Double, _ num2: Double) -> Double? {
        if num2 == 0 {
            return nil
        }
        
        return num1.truncatingRemainder(dividingBy: num2)
    }
}

class Calculator {
    func operation(_ num1: Double, _ num2: Double, operation: String) -> Double? {
        switch operation {
        case "add":
            return AddOperation().calculate(num1, num2)
        case "subtract":
            return SubtractOperation().calculate(num1, num2)
        case "multiply":
            return MultiplyOperation().calculate(num1, num2)
        case "divide":
            return DivideOperation().calculate(num1, num2)
        case "remainder":
            return DivideOperation().calculateRemainder(num1, num2)
        default:
            print("Invalid operation")
            return nil
        }
    }
}

let calculator = Calculator()

if let result = calculator.operation(5, 3, operation: "add") {
    print("더하기: \(result)")
} else {
    print("오류 입니다.")
}

if let result = calculator.operation(5, 3, operation: "subtract") {
    print("빼기: \(result)")
} else {
    print("오류 입니다.")
}

if let result = calculator.operation(5, 3, operation: "multiply") {
    print("곱하기: \(result)")
} else {
    print("오류 입니다.")
}

if let result = calculator.operation(5, 3, operation: "divide") {
    print("나누기: \(result)")
} else {
    print("오류 입니다.")
}

if let result = calculator.operation(5, 3, operation: "remainder") {
    print("나머지: \(result)")
} else {
    print("오류 입니다.")
}


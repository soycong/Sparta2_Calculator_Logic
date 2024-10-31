// 사칙 연산에 사용되는 프로토콜 선언 (계산 함수, Double 타입 매개변수 2개, Double 타입 옵셔널 반환값 1개)
protocol AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double?
}

// 더하기 클래스
class AddOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        var result = num1 + num2
        
        return result
    }
}

// 빼기 클래스
class SubtractOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        var result = num1 - num2
        
        return result
    }
}

// 곱하기 클래스
class MultiplyOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        var result = num1 * num2
        
        return result
    }
}

// 나누기 및 나머지 클래스
class DivideOperation: AbstractOperation {
    func calculate(_ num1: Double, _ num2: Double) -> Double? {
        // 예외처리) 나누기 진행할 시, 분모가 0이 될 수 없으므로.
        if num2 == 0 {
            return nil
        }
        
        var result = num1 / num2
        
        return result
    }
    
    func calculateRemainder(_ num1: Double, _ num2: Double) -> Double? {
        // 예외처리) 나누기 진행할 시, 분모가 0이 될 수 없으므로.
        if num2 == 0 {
            return nil
        }
        
        // Double 타입은 나머지를 %가 아닌 truncatingRemainder 사용해서 구해주어야한다.
        var result = num1.truncatingRemainder(dividingBy: num2)
        
        return result
    }
}

// 각 사칙 연산이 진행될 수 있도록 하는 Calculator 클래스
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
            print("존재하지 않는 연산입니다.") // 더하기, 빼기, 곱하기, 나누기, 나머지 연산이 아닐 경우
            return nil
        }
    }
}

let calculator = Calculator()

// 계산을 진행할 숫자 입력
let num1 = 5.0
let num2 = 3.0

let operations = ["add", "subtract", "multiply", "divide", "remainder"]

//반복문을 통해 각 연산을 진행
for operation in operations {
    // 각 연산의 반환값이 옵셔널이므로, 옵셔널 바인딩을 통해 결과값 출력
    if let result = calculator.operation(num1, num2, operation: operation) {
        print("\(operation): \(result)")
    } else {
        print("\(operation): 오류 입니다.")
    }
}

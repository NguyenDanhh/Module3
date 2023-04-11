package com.example.bai2;

public class Calculator {
    public static int calculate(String operator , int firstOperand , int secondOperand){

        switch (operator) {
            case "addition":
                return  firstOperand + secondOperand;
            case "subtraction":
                return firstOperand - secondOperand;
            case "multiplication":
                return firstOperand * secondOperand;
            case "division":
                if(secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Can't divide by zero");
            default:
                throw new RuntimeException("Invalid operation");
        }

    }
}

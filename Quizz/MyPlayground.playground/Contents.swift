//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str = "Hello Swift !"

let constStr = "Hello swift !"
var nextYear:Int
var bodytemp:Float
var hasPet:Bool

var arrayInts: [Int]
var dict: [String:String]
var winningLotteryNumbers : Set<Int>

let numbers = 42
let fm = 92.1
let counting = ["one", "two"]

var reading1: Float?
var reading2: Float?
var reading3: Float?
reading1 = 9.1
reading2 = 9.4
reading3 = 9.7

if let r1 = reading1,
    r2 = reading2,
    r3 = reading3 {
        let avg = (r1 + r2 + r3) / 3
} else {
    let error = "A value was nil"
}

enum PieType: Int {
    case Apple = 0
    case Cherry
    case Pecan
}

let pieRawValue = PieType.Apple.rawValue

if let pieType = PieType(rawValue: pieRawValue) {
    //It works
}
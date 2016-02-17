//watso157
//Assignment 0
//February 12, 2016
//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("hello")
print("world")

var x = 2
print (x.successor())

extension Int {
    func plus3() -> Int{
        return self + 3
    }
}

print(x.plus3())

let five = 5
var six = 6

six = five

func doSomething(){
    print("Something")
}

doSomething()

func doSomethingElse(){
    class Alien{
        var species = "Unknown"
    }

    let A = Alien()
    print(A.species)
}

doSomethingElse()

class Cow{
    var name = ""
    
    func sayName(){
        print("Hi I'm \(self.name)")
    }
}

var c1 = Cow()
c1.name = "Brown"
c1.sayName()
let c2 = Cow()
c2.name = "Felicia"
c2.sayName()
print("and we're cows!")

func saySomething(words : String...){
    
    for word in words{
        print(word)
    }
}

saySomething("I'm", "typing", "multiple", "words")
saySomething("oneWord")

print("string", true, 100)

var y = 9
y.dynamicType

var q : Int

var phrase : String = "word thingy"
let f = 4.20
f.dynamicType

let width : CGFloat = 25.0
let height : CGFloat = 35.0

let view = UIView(frame: CGRectMake(0,0,width,height))
view.backgroundColor = UIColor.blueColor()

enum BicycleType{
    case Bi
    case Tri
    case Noob
}
let bike1 = BicycleType.Bi
var bike2 : BicycleType
bike2 = .Tri

for i in 1..<200
{
    if i % 2 == 0{
        print("\(i) is even")
    }
}

func countVowels(inString word : String) -> (Int){
    var vowelCount = 0
    
    for c in phrase.characters{
//        if c == ("a" || "A" || "e" || "E" || "i" || "I" || "o" || "O" || "u"){
        if c == "a"{
            vowelCount+=1}
        if c == "A"{
            vowelCount+=1}
        if c == "e"{
            vowelCount+=1}
        if c == "E"{
            vowelCount+=1}
        if c == "I"{
            vowelCount+=1}
        if c == "i"{
            vowelCount+=1}
        if c == "O"{
            vowelCount+=1}
        if c == "o"{
            vowelCount+=1}
        if c == "u"{
            vowelCount+=1}
        if c == "U"{
            vowelCount+=1}
        
    }
    return (vowelCount)
}

var result = countVowels(inString: "Animal")

print(result)

func doMaths(functionIn: (x: Int, y: Int) -> Int) -> Int{
    let result = functionIn(x: 6, y: 3)
    return result
}

func secondFunc(a: Int, b: Int) -> Int{
    return a - b
}

print(doMaths(secondFunc))

let spookyGhost = {
    (c: Int, d: Int) -> Int in
    return c*d
}
print(doMaths(spookyGhost))



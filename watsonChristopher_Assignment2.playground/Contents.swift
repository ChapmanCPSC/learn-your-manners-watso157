//Chris Watson
//Assignment 2
//Professor Burns
//7 March 2016

//: Playground - noun: a place where people can play, unless they don't have any friends

import UIKit

var str = "Hello, playground"


//######### OPTIONAL TYPES ############

var name = Optional("Bob")

var strType : String?
var string : String
strType = "Hi \(name!)"
print(strType)

print (strType!)

var amINeeded : String? = "You are needed"

print(amINeeded!)

class Cat {
    var color : UIColor?
    
    func showColorExample(){
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view1.backgroundColor = color
    }
}

var c1 : Cat? = nil

c1?.showColorExample()
c1 = Cat()

//Yes i know this will cause a fatal error, but it unwraps it :)
//c1!.color! = UIColor.brownColor()

let catName : String = "Whiskers"

//Op vs NonOp
catName == "Whiskers"


//######### OBJECT TYPES ############

//Classes

class Homework {
    class func HomeworkSucks(dayOfWeek : String){
        print("Homework on \(dayOfWeek) sucks")
    }
    class func HomeworkAnyDay(dayOfWeek : String){
        print ("Homework on \(dayOfWeek) and every other day sucks!")
    }
}

//call the class methods
Homework.HomeworkSucks("Tuesday")
Homework.HomeworkAnyDay("Friday")

class Person {
    var name : String
    var age : Int
    
    init?(name : String, age : Int){
        self.name = name
        self.age = age
        
        if age < 0 {
            print("How could a person be a person if dankmemes arent real?")
        }
    }
    
    func wantToHearAJoke() {
        print(name)
    }
}

var someDude = Person(name: "Charles", age: 24)
print(someDude!.name)
someDude?.wantToHearAJoke()

var someNonRealDude = Person(name: "Mike", age: -2)

//Subscripts
class Month {
    private var monthKeys = ["nil","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Nov","Dec"]
    
    subscript(idx : Int) -> String {
        return monthKeys[idx]
    }
}
let bestMonthEver = Month()
print("My bday is in the month of \(bestMonthEver[6]) and I will be old")

enum Colors {
    case Blue
    case Red
    case Yellow
}

let yourColor = Colors.Red

enum Crayons : String {
    case RobinsEggBlue = "blue"
    case RosePetal = "red"
    case LittleMissSunshine = "yellow"
}

let kidWants = "blue"

let kidGets = Crayons(rawValue: kidWants)
let whatIsHeDoing = Crayons(rawValue: "eatsCrayon")

//Wont fail, is optional conversion
var degree = 23.045
var angle = degree as? Int

//Will absolutely fail
//var person2 = someDude as! Homework

//And i have yet to figure out a reasonable cast that doesnt crash

//######### PROTOCOLS AND EXTENSIONS ############

protocol Vehicle{
    var rpm : Int { get }
    
    func openDoors()
    
    func blowUp() -> Void
}

class Sedan : Vehicle {
    var rpm : Int = 2000
    
    func openDoors() {
        print("Four doors were opened")
    }
    
    func blowUp() {
        print("The Sedan completely disintegrated. Sucks man.")
    }
}

struct SchoolBus : Vehicle {
    var rpm : Int = 1750
    
    func openDoors() {
        print("One door opened.")
    }
    
    func blowUp() {
        print("You can't do that, there's kids in there!!!")
    }
}

let altima = Sedan()
let yellowBus = SchoolBus()

func checkOutThatVehicle(rate: Vehicle){
    print("Current RPM is at \(rate.rpm)")
    rate.openDoors()
    rate.blowUp()
}

checkOutThatVehicle(altima)
checkOutThatVehicle(yellowBus)

func anyObjectExpect(obj : AnyObject){}
func anyClassExpect(clss : AnyClass){}
func anyExpect(whatever : Any){}

//This is nice
anyObjectExpect(altima)
anyObjectExpect(22)
//This is also nice
anyClassExpect(Cat)
//This just seems arbitrarily pointless, as in a null checker
anyExpect(Vehicle)

extension Int {
    func butHowOld(){
        if self > 35{
            print("\(self) years is old but still not as old as \(someDude)'s mom")
        }
        else {
            print ("\(self) years old? You've got so much to live for!")
        }
    }
}

var age = 45
age.butHowOld()

var littleKid = 8
littleKid.butHowOld()

extension UIView{
    class func Sun() -> UIView{
        let glowingThing = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        glowingThing.backgroundColor = UIColor.yellowColor()
        glowingThing.layer.cornerRadius = 20
        
        return glowingThing
    }
}

let goodMorning = UIView.Sun()

//######### Containers ############

var cheeseList = ["Mice": "Cheddar Cheese", "People" : "American Cheese", "Strangers" : "Free Cheese"]

for cheese in cheeseList{
    print(cheese)
}

//######### Flow Control ############

let type : Colors = .Blue

switch type {
case .Red:
    print("oooh red")
case .Blue:
    print("I see you blue")
case .Yellow:
    print("so happy right now")
default:
    print("no color for you")
}

//######## Error Handling ##########
let error = NSError(domain: "myProg", code: 0, userInfo: nil)
enum ErrorHandle : ErrorType{
    case Whoops
    case Shoot
    case Darn
}

func goingToFail() throws{
    throw ErrorHandle.Darn
}

do {
    try goingToFail()
}
catch ErrorHandle.Whoops{
    print("\(error)...Whoopsies")
}
catch ErrorHandle.Shoot{
    print("\(error)...Oh shoot")
}
catch ErrorHandle.Darn{
    print("\(error)...Darn it")
}

//In case we just want to do it regardless
try? goingToFail()



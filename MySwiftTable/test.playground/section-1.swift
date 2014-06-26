// Playground - noun: a place where people can play

import Cocoa


var str = "Hello, playground"

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.toRaw()
ace.hashValue
let two = Rank.Two
let twoRawValue = two.toRaw()

let j = Rank.Jack
let jRawValue = j.toRaw()
j.simpleDescription()
j.hashValue

var commandbtns:Array = [[Rank.Two,Rank.Two,Rank.Three],
    [Rank.Four,Rank.Five,Rank.Six]]
commandbtns[1].count

 var coms2:Array = [[1,2],[3,4]]
coms2.count
/*var familys = UIFont.familyNames()
var i:Int = 0
var j:Int = 0
for i = 0; i<familys.count; i++  {

var family:String = String(familys[i] as NSString)

var fonts = UIFont.fontNamesForFamilyName(family)

for j = 0; j<fonts.count; j++ {
println(fonts[j])

}
}*/

commandbtns[0][0]
var cgr = CGRectMake(CGFloat(10), CGFloat(10), CGFloat(10), CGFloat(10))
cgr.offset(dx: 11, dy: 11)
cgr.size.height = 22
cgr

var currentNumber = "sdfasdfasdfasfd."
currentNumber.substringFromIndex(7).lengthOfBytesUsingEncoding(NSStringEncoding.allZeros)
currentNumber.componentsSeparatedByString(".").count
currentNumber.componentsSeparatedByString(".")[1]
var nns:String = "01222"
var nn:NSString = String.bridgeFromObjectiveC(nns)!
var f: Float = nn.floatValue;
f

var int:Int = "111111111111".toInt()!



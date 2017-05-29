import Foundation

/*
 
 ORGANIZING YOUR SOLUTION
 
 A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.
 
 The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?
 
 */

/*
 
 INPUT
 
 Be sure that your implementation of this section discards all the possible bad inputs the user could provide.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
struct CityTime {
    var city : String
    var diff : Int
    var time : Int?
    
    func output() -> String {
        return "\(self.time!) in \(self.city)"
    }
}

var cities : [CityTime] = [CityTime]()
cities.append(CityTime(city: "Ottawa", diff: 0, time: nil))
cities.append(CityTime(city: "Victoria", diff: -300, time: nil))
cities.append(CityTime(city: "Edmonton", diff: -200, time: nil))
cities.append(CityTime(city: "Winnipeg", diff: -100, time: nil))
cities.append(CityTime(city: "Toronto", diff: 0, time: nil))
cities.append(CityTime(city: "Halifax", diff: 100, time: nil))
cities.append(CityTime(city: "St. Johns", diff: 130, time: nil))

var inputToProcess : Int = Int.max

// Loop until valid input is received
while inputToProcess == Int.max {
    
    // Show the prompt
    print("", terminator: "")
    
    // Get the user's input
    var input : String?
    input = readLine()
    
    // Use optional binding to see if the string can be unwrapped (to see if it is not nil)
    if let notNilInput = input {
        if let inputAsInt = Int(notNilInput) {
            if inputAsInt >= 0 && inputAsInt < 2360 {
                if (inputAsInt / 10) % 10 <= 5 {
                    inputToProcess = inputAsInt
                }
            } else {
                print("Please provide an integer value between 0 and 2359.")
            }
        }
    }
    
}

/*
 
 PROCESS
 
 Here is where you implement the logic that solves the problem at hand.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'process' code below....
// add newline to space out input from output

//for i in 0...cities.count - 1 {
//    if inputToProcess + cities[i].diff < 0 {
//        if ((2400 + (inputToProcess + cities[i].diff)) / 10) % 10 < 6 {
//            cities[i].time = 2400 + (inputToProcess + cities[i].diff)
//        } else {
//            cities[i].time = ((2400 + (inputToProcess + cities[i].diff)) % 60) + 100
//            var i = 0
//            while (cities[i].time! / 10 % 10 > 6) {
//                i += 1
//                cities[i].time = ((2400 + (inputToProcess + cities[i].diff)) % (60 * i)) + (100 * i)
//            }
//        }
//    } else if inputToProcess + cities[i].diff > 2359 {
//        if (abs(2400 - (inputToProcess + cities[i].diff)) / 10) % 10 < 6 {
//            cities[i].time = abs(2400 - (inputToProcess + cities[i].diff))
//        } else {
//            cities[i].time = (abs(2400 - (inputToProcess + cities[i].diff)) % 60) + 100
//            var j = 0
//            while (cities[i].time! / 10 % 10 > 6) {
//                j += 1
//                cities[i].time = (abs(2400 - (inputToProcess + cities[i].diff)) % (60 * j)) + (100 * j)
//            }
//        }
//    } else {
//        cities[i].time = inputToProcess + cities[i].diff
//    }
//}

//for i in 0...cities.count - 1 {
//    var timeVal = inputToProcess + cities[i].diff
//    if (timeVal > 2359) {
//        timeVal = abs(2400 - timeVal)
//        while ((timeVal / 10) % 10 > 6) {
//            timeVal = (timeVal % 60) + 100
//        }
//        cities[i].time = timeVal
//    } else if (timeVal  < 0) {
//        timeVal = 2400 + timeVal
//        if ((timeVal / 10) % 10 > 6) {
//            while ((timeVal / 10) % 10 > 6) {
//                timeVal = (timeVal % 60) + 100
//            }
//            cities[i].time = timeVal
//        }
//    } else if timeVal < 2400 && timeVal >= 0 {
//        cities[i].time = timeVal
//    }
//}

print("") // add newline for output readability

for i in 0...cities.count - 1 {
    var timeVal = inputToProcess + cities[i].diff
    if (timeVal > 2359) {
        timeVal = abs(2400 - timeVal)
        while ((timeVal / 10) % 10 > 6) {
            timeVal = (timeVal % 60) + 100
        }
        cities[i].time = timeVal
    } else if (timeVal < 0) {
        timeVal = 2400 + timeVal
        cities[i].time = timeVal
        if ((abs(timeVal) / 10) % 10 > 6) {
            while ((timeVal / 10) % 10 > 6) {
                timeVal = (timeVal % 60) + 100
            }
            cities[i].time = timeVal
        }
    } else {
        cities[i].time = timeVal
        if ((abs(timeVal) / 10) % 10 > 6) {
            var j = 1
            while ((timeVal / 10) % 10 > 6) {
                j += 1
                timeVal = (timeVal % 100 - 60) + 100 * j
            }
            cities[i].time = timeVal
        }
    }
}


/*
 
 OUTPUT
 
 Here is where you report the results of the 'process' section above.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Add 'output' code below... replace what is here as needed.
for city in cities {
    print(city.output())
}

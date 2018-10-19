//: [Previous](@previous)

// Activity class to hold information about interests - 9/24
class Activity: Hashable, Equatable {
    // conform to Hashable ->       class Activity: Equatable, Hashable {
    
    let name: String
    let description: String
    var hashValue: Int {
        return self.name.count
    }
    
    // MARK ::::: Hashable protocols - 10/1
    
    
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    // MARK ::::: Equatable protocols - 10/1
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}

// Person class to hold information about participants and interests - 9/24
//           When comparing two Persons you are comparing their interest values - 10/12
class Person: Hashable, Equatable {
    // conform to Hashable ->       class Person: Equatable, Hashable {
    
    let name: String
    let hometown: String // 9/25
    let interest: Activity
    let interestTwo: Activity // 9/25
    let interestThree: Activity // 9/25
    
    
    
    // MARK ::::: assigning a hashvalue to a paremeter in Person    -   HashValue protocols - 10/1
    var hashValue: Int {
        // hashvalue for the name parameter
        return self.interest.hashValue
    }
    
    
    
    // add more interests - 9/24
    
    
    init(name: String, hometown: String, interest: Activity, interestTwo: Activity, interestThree: Activity) {
        self.name = name
        self.hometown = hometown
        self.interest = interest
        self.interestTwo = interestTwo
        self.interestThree = interestThree
    }
    
    
    
    // MARK ::::: Hashable protocols - 10/1
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.interest == rhs.interest &&
            lhs.interestTwo == rhs.interestTwo &&
            lhs.interestThree == rhs.interestThree
    }
    
}

// list of constants for activites to be listed (21 Activities) - 9/24
let archery = Activity.init(name: "Archery", description: "The practice of shooting arrows with a bow.")
let acting = Activity.init(name: "Acting", description: "The art of preforming in plays etc.")
let astronomy = Activity.init(name: "Astronomy", description: "Studying celestial objects, space, and the whole physical universe.")
let baking = Activity.init(name: "Baking", description: "A method of cooking that uses proloned dry heat.")
let basketball = Activity.init(name: "Basketball", description: "A sport won by a shooting a ball through a hoop the most amount of times.")
let cooking = Activity.init(name: "Cooking", description: "The art of preparing food.")





let person1: Set = [Person.init(name: "James", hometown: "California", interest: archery, interestTwo: acting, interestThree: astronomy)]

let person2: Set = [Person.init(name: "Steve", hometown: "Massachussetts", interest: archery, interestTwo: acting, interestThree: astronomy)]

let person3: Set = [Person.init(name: "Brittany", hometown: "Texas", interest: archery, interestTwo: cooking, interestThree: baking)]

person1.symmetricDifference(person3)



if person1 == person3 {
    print("Equatable")
} else {
    print("Not Equatable")
}




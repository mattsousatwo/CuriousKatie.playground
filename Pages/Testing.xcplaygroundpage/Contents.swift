//: [Previous](@previous)
class Person: Hashable {
    var hashValue: Int {
        return self.name.count
    }
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
       return lhs.name == rhs.name
       
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

let person1 = Person.init(name: "Darryl")
let person2 = Person.init(name: "Darryl")
let person3 = Person.init(name: "Ellec")

if person1 == person3 {
    print("Equatable")
} else {
    print("Not Equatable")
}


// symetric difference / intersection
let set1: Set = [1,2,3,4]

let set2: Set = [3,5,2,6]

let sym = set1.symmetricDifference(set2)
print(sym)

let inter = set1.intersection(set2)
print(inter)

/*
// array to create a new array that take two people as parameters
func newArray(person: Person, personTwo: Person ) -> [Person] {
    let firstPerson = person
    let secondPerson = personTwo
    
    let newArray = [firstPerson, secondPerson]
    
    return newArray
}


*/


/*
 // func to assign interests to names - 9/24
 func generatePeople() -> [Person] {
 let numberOfPlayers = numberOfParticipants().count
 
 let generatedPlayer = Person.init(name: randomName(), interest: randomActivity())
 
 for person in 1...numberOfPlayers {
 print(person)
 
 print("\(generatedPlayer.name)\n\(generatedPlayer.interest.name)")
 return [generatedPlayer]
 
 }
 return [generatedPlayer]
 }
 
 let list: [Person] = generatePeople()
 
 */




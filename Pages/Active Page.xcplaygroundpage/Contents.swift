// Curious Katie - Matthew Sousa - 9/24/18

import GameKit

// Activity class to hold information about interests - 9/24
class Activity  {
// conform to Hashable ->       class Activity: Equatable, Hashable {
    
    
    let name: String
    let description: String
   
    
/*
    
     // MARK ::::: Equatable protocols - 10/1
    var hashValue: Int {
        return name.hashValue
    }
*/
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
 
/*
     // MARK ::::: Hashable protocols - 10/1
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
      lhs.name == rhs.name
      lhs.description == rhs.description
    }
 */

}



// Person class to hold information about participants and interests - 9/24
class Person {
// conform to Hashable ->       class Person: Equatable, Hashable {
    
    let name: String
    let hometown: String // 9/25
    let interest: Activity
    let interestTwo: Activity // 9/25
    let interestThree: Activity // 9/25
    
    
/*
    // MARK ::::: Equatable protocols - 10/1
    var hashValue: Int {
           return name.hashValue
        
    }
*/
    
    
    // add more interests - 9/24
    
    
    init(name: String, hometown: String, interest: Activity, interestTwo: Activity, interestThree: Activity) {
        self.name = name
        self.hometown = hometown
        self.interest = interest
        self.interestTwo = interestTwo
        self.interestThree = interestThree
       
    }
  
    
/*
     // MARK ::::: Hashable protocols - 10/1
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.name == rhs.name
        lhs.hometown == rhs.hometown
        lhs.interest == rhs.interest
        lhs.interestTwo == rhs.interestTwo
        lhs.interestThree == rhs.interestThree
    }
*/

}





// Array to store a list of names for potential particiapants - 9/24
let listOfNames: [String] = ["Liam", "Destiny", "Noah", "Diamond", "William", "Jeremiah", "James", "Logan", "Benjamin", "Nubian", "Mason", "Elijah", "Oliver", "Aliyah", "Jacob", "Emma", "Isaiah", "Olivia", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Evelyn", "Abigail", "Jamal", "Kenny",]

// Array to store list of letters for players last Names - 9/25
let lastInitial: [String] = ["A.", "B.", "C.", "D.", "E.", "F.", "G.", "H.", "I.", "J.", "K.", "L.", "M.", "N.", "O.", "P.", "Q.", "R.", "S.", "T.", "U.", "V.", "W.", "X.", "Y.", "Z."]

// Array of Hometowns for participants to have (25 Cities) - 9/25
 let hometown: [String] = ["New York, NY.", "Los Angeles, CA.", "Chicago, IL.", "Houston, TX.", "Philadelphia, PN.", "Pheonix, AZ.", "San Antonio, TX.", "San Diego, CA.", "Dallas, TX.", "San Jose, CA.", "Austin, TX.", "Jacksonville, FL.", "San Francisco, CA.", "Indianapolis, IN.", "Colombus, OH.", "Fort Worth, TX.", "Charlotte, NC.", "Detroit, MI.", "El Paso, TX.", "Seattle, WA.", "Denver, CO.", "Washington, DC.", "Memphis, TN.", "Boston, MA.", "Nashville, TN."]

// list of constants for activites to be listed (21 Activities) - 9/24
    let archery = Activity.init(name: "Archery", description: "The practice of shooting arrows with a bow.")
    let acting = Activity.init(name: "Acting", description: "The art of preforming in plays etc.")
    let astronomy = Activity.init(name: "Astronomy", description: "Studying celestial objects, space, and the whole physical universe.")
    let baking = Activity.init(name: "Baking", description: "A method of cooking that uses proloned dry heat.")
    let basketball = Activity.init(name: "Basketball", description: "A sport won by a shooting a ball through a hoop the most amount of times.")
    let cooking = Activity.init(name: "Cooking", description: "The art of preparing food.")
    let calligraphy = Activity.init(name: "Calligraphy", description: "The art of giving form to signs in an expressive harmonius, and skillful manner.")
    let computerProgramming = Activity.init(name: "Computer Programming", description: "Talking to computers.")
    let football = Activity.init(name: "Football", description: "A sport where each team attepmts to move a ball to the opposing teams goal through running or passing.")
    let gardening = Activity.init(name: "Gardening", description: "Tending to plants in a garden.")
    let hunting = Activity.init(name: "Hunting", description: "The practice of killing animals for food or sport.")
    let hiking = Activity.init(name: "Hiking", description: "Exploring a high rocky terrain.")
    let martialArts = Activity.init(name: "Martial Arts", description: "The practice of using different schools of fighting.")
    let painting = Activity.init(name: "Painting", description: "Using liquid colored materials to make a picture.")
    let paintball = Activity.init(name: "Paintball", description: "A sport where each team uses paint guns to eliminate the players of opposing teams.")
    let pottery = Activity.init(name: "Pottery", description: "Using clay to make bowls and other goods.")
    let rockClimbing = Activity.init(name: "Rock Climbing", description: "The sport of climbing rocks.")
    let running = Activity.init(name: "Running", description: "The act of leasierly or competivly jogging.")
    let skateboarding = Activity.init(name: "Skateboarding", description: "An action sport consiting of riding a small piece of wood with 4 wheels.")
    let writting = Activity.init(name: "Writting", description: "The act or skill of making coherent words fit in a story.")
    let yoga = Activity.init(name: "Yoga", description: "A hindu spiritual and ascetic disipline, that includes breath control, simple meditation and the adoption of specific bodily postures.")

// Array to store list of interests - 9/24
var listOfInterests: [Activity] = [archery, acting, astronomy, baking, basketball, cooking, calligraphy, computerProgramming, football, gardening, hunting, hiking, martialArts, painting, paintball, pottery, rockClimbing, running, skateboarding, writting, yoga]




// array to store selected Activities from listOfInterests - 9/25
var removedInterests: [Activity] = []

// func to return randomNumber
func randomNumber(limit: Int) -> Int {
    let selectedNumber = GKRandomSource.sharedRandom().nextInt(upperBound: limit)
    return selectedNumber
}

// Func to randomly select an activity 9/24
func randomActivity() -> Activity {
    let selectedNumber = randomNumber(limit: listOfInterests.count)
    let selectedActivity = listOfInterests[selectedNumber]
    removedInterests.append(listOfInterests.remove(at: selectedNumber))
 
// If more than 8 Activities are removed from listOfInterests, then put the removed Activities back - 9/25
     if removedInterests.count >= 8 {
        listOfInterests.append(contentsOf: removedInterests)
    }
    return selectedActivity
}

// func to randomly choose a name - 9/24
func randomName() -> String {
    let selectedNumber = randomNumber(limit: listOfNames.count)
    let selectedInitial = randomNumber(limit: lastInitial.count)
    let selectedName = "\(listOfNames[selectedNumber]) \(lastInitial[selectedInitial])"
    return selectedName
}

// Func to randomly choose a hometown - 9/25
 func randomHometown() -> String {
    let selectedNumber = randomNumber(limit: hometown.count)
    let selectedTown = hometown[selectedNumber]
    return selectedTown
 
 }

// func to generate introductions with hometown and participants name - 9/25
func generateIntroduction(for person: Person) -> String {
    let selectedPerson = person
    
// could update introductions to display information about selectedPersons interests
// array to store introductions
        let introductions: [String] = ["Hello, I am from \(selectedPerson.hometown).", "Hi, I was born in \(selectedPerson.hometown), its nice to meet you.", "How are you? I am from \(selectedPerson.hometown) where are you from?", "Hello there everyone, I am \(selectedPerson.name) and I am from \(selectedPerson.hometown)", "How is everyone? I am \(selectedPerson.name) from \(selectedPerson.hometown). It is nice to meet you."]
    
    let selectedNumber = randomNumber(limit: introductions.count)
    let selectedIntroduction = introductions[selectedNumber]
    print(selectedIntroduction)
    return selectedIntroduction
}

// func to generate a new array to pull count from for number of participants - 9/24
// created this func to create an array so that numberOfParticipants() can have a lower limit of 2
func newArrayFromTwo(until upperBound: Int) -> [Int] {
    let newArray = Array(2...upperBound)
    return newArray
}

// func to generate number of participants - 9/24
// uses newArrayFromTwo(until:) to set a lower limit of 2
func numberOfParticipants() -> [Int] {
    let selectedNumber = randomNumber(limit: 12)
    return newArrayFromTwo(until: selectedNumber)
}



// array to store participants - 9/25
// changed to a Set<Person>   - 10/1
    // had to conform Person & Activity to Hashable & Equatable
    // change how elements are added to participants now that its a set and how to access them
//var participants: Set<Person> = []

var participants: [Person] = []






// array to store conversation pairs - 9/26
var conversationPair: [Person] = []

// generateParticipant Loop
// loop to itereate over number of participants and create a Person for each - 9/24
for person in 1...numberOfParticipants().count {    
    let chosenName = randomName()
    let chosenHometown = randomHometown()
    var interest1 = randomActivity()
    var interest2 = randomActivity()
    var interest3 = randomActivity()
    
// loop to check for repeating interests within player - 9/25
        switch interest1.name {
        case interest2.name:
            interest1 = randomActivity()
            interest2 = randomActivity()
        case interest3.name:
            interest1 = randomActivity()
            interest3 = randomActivity()
        default: break
        }
    
        switch interest3.name {
        case interest2.name:
            interest3 = randomActivity()
        default: break
        }
    
    let generatedPerson = Person.init(name: chosenName, hometown: chosenHometown, interest: interest1, interestTwo: interest2, interestThree: interest3)
    
    
    // participants == Set   - 10/1
   // participants.insert(generatedPerson)
    
    // participants == Array   - 10/1
   participants.append(generatedPerson)
    print("\(person)\n\(generatedPerson.name) \(generatedPerson.hometown) \(generatedPerson.interest.name) \(generatedPerson.interestTwo.name) \(generatedPerson.interestThree.name)\n")
    generateIntroduction(for: generatedPerson)
    
}



// func to create a new array of people - 9/26    < ~~~ unsure if this will be used
func newArray(person: Person, personTwo: Person ) -> [Person] {
    let firstPerson = person
    let secondPerson = personTwo
    
    let newArray = [firstPerson, secondPerson]
    
    return newArray
}



// attempting to put the participants into pairs based upon similar intersts 9/26
// printing out copies of the same person "James G. and James G. are a pair"
//

func curiousKatie() -> [Person] {
    let selectedNumber = randomNumber(limit: participants.count)
    let selectedParticipant = participants[selectedNumber]
    var tempArry: [Person] = []
    
    
        for person in participants {
            if selectedParticipant.interest.name == person.interest.name || selectedParticipant.interestTwo.name == person.interestTwo.name || selectedParticipant.interestThree.name == person.interestThree.name  {                                 if selectedParticipant.name != person.name {
                        tempArry.append(selectedParticipant)
                        tempArry.append(person)
                        print("\(tempArry[0].name) and \(tempArry[1].name) are a pair")
                   newArray(person: selectedParticipant, personTwo: person)
                } 
            }
        }
    return tempArry
}


let name = curiousKatie()
















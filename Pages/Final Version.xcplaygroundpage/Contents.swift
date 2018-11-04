// Curious Katie - Matthew Sousa - 9/24/18

import GameKit

// Activity class to hold information about interests - 9/24
class Activity: Hashable, Equatable {
    
    let name: String
    let description: String
    // assigning a hashvalue for the name parameter - 10/12
    var hashValue: Int {
        return self.name.count
    }
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    // if two Activity.name are equal then return true
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        return lhs.name == rhs.name
    }
}

// Person class to hold information about participants - 9/24
// When comparing two Persons you are comparing their interest Set - 10/12
class Person: Hashable, Equatable {
    
    let name: String
    let hometown: String // 9/25
    let interests: Set<Activity>
    
    // assigning a hashvalue to a parameter in Person - 10/12
    var hashValue: Int {
        // hashvalue for the interests parameter
        return self.interests.hashValue
    }
    
    init(name: String, hometown: String, interests: Set<Activity>) {
        self.name = name
        self.hometown = hometown
        self.interests = interests
    }
    
    
    // if all of the three interests in their Set are equal then return true
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.interests == rhs.interests
        
    }
}

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
var listOfInterests = [archery, acting, astronomy, baking, basketball, cooking, calligraphy, computerProgramming, football, gardening, hunting, hiking, martialArts, painting, paintball, pottery, rockClimbing, running, skateboarding, writting, yoga]

// ListOfInterestsSet to copy listOfInterest: Later used by being compared to a Set of opposing couple interests
var listOfInterestsSet: Set<Activity> = []
listOfInterestsSet.union(listOfInterests)

// array to store selected Activities from listOfInterests - 9/25
var removedInterests: [Activity] = []

// array to store participants (personSets)
var participants: [Set<Person>] = []

// creating a second array with the contents of participants to avoid repetition when participants are being compared
var secondaryParticipants: [Set<Person>] = []

// Dictionary to store each [Person: [Person they are compared to: Comparison Set]]
var comparisonDict: [Person: [Person: Set<Activity>]] = [:]

// array to store a person if that person is the same as the person being compared to the rest of the participants
var duplicateSetCollection: [Set<Person>] = []

// func to return randomNumber
func randomNumber(limit: Int) -> Int {
    let selectedNumber = GKRandomSource.sharedRandom().nextInt(upperBound: limit)
    return selectedNumber
}

// func to randomly assign a name - 9/24
func randomName() -> String {
    // Array to store a list of names for potential particiapants (28 first names)  - 9/24
    let listOfNames: [String] = ["Liam", "Destiny", "Noah", "Diamond", "William", "Jeremiah", "James", "Logan", "Benjamin", "Nubian", "Mason", "Elijah", "Oliver", "Aliyah", "Jacob", "Emma", "Isaiah", "Olivia", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Evelyn", "Abigail", "Jamal", "Kenny",]
    
    // Array to store list of letters to be used as participant last Names - 9/25
    var lastInitial: [String] = ["A.", "B.", "C.", "D.", "E.", "F.", "G.", "H.", "I.", "J.", "K.", "L.", "M.", "N.", "O.", "P.", "Q.", "R.", "S.", "T.", "U.", "V.", "W.", "X.", "Y.", "Z."]
    
    // array to store used Initials to avoid name repetition
    let usedInitials: [String] = []
    
    
    let selectedNumber = randomNumber(limit: listOfNames.count)
    let selectedInitial = lastInitial.remove(at: randomNumber(limit: lastInitial.count))
    let selectedName = "\(listOfNames[selectedNumber]) \(selectedInitial)"
    
    if lastInitial.count >= 9 {
        lastInitial.append(contentsOf: usedInitials)
    }
    
    return selectedName
}

// Func to randomly choose a hometown - 9/25
func randomHometown() -> String {
    
    // Array of Hometowns for participants to assign to participants (25 US Cities) - 9/25
    let hometown: [String] = ["New York, NY.", "Los Angeles, CA.", "Chicago, IL.", "Houston, TX.", "Philadelphia, PN.", "Pheonix, AZ.", "San Antonio, TX.", "San Diego, CA.", "Dallas, TX.", "San Jose, CA.", "Austin, TX.", "Jacksonville, FL.", "San Francisco, CA.", "Indianapolis, IN.", "Colombus, OH.", "Fort Worth, TX.", "Charlotte, NC.", "Detroit, MI.", "El Paso, TX.", "Seattle, WA.", "Denver, CO.", "Washington, DC.", "Memphis, TN.", "Boston, MA.", "Nashville, TN."]
    
    let selectedNumber = randomNumber(limit: hometown.count)
    let selectedTown = hometown[selectedNumber]
    return selectedTown
}

// func to generate introductions with hometown and participants name - 9/25
func generateIntroduction(for person: Person) -> String {
    let selectedPerson = person
    
    // array to store introductions
    let introductions: [String] = ["Hello, I am from \(selectedPerson.hometown)", "Hi, I was born in \(selectedPerson.hometown), its nice to meet you.", "How are you? I am from \(selectedPerson.hometown) where are you from?", "Hello there everyone, I am \(selectedPerson.name) and I am from \(selectedPerson.hometown)", "How is everyone? I am \(selectedPerson.name) from \(selectedPerson.hometown) It is nice to meet you."]
    
    let selectedNumber = randomNumber(limit: introductions.count)
    let selectedIntroduction = introductions[selectedNumber]
    print("Introduction: \(selectedIntroduction)")
    return selectedIntroduction
}

// Func to randomly select an activity 9/24
func randomActivity() -> Activity {
    
    let selectedNumber = randomNumber(limit: listOfInterests.count)
    
    // selecting an Activity
    let chosenActivity = listOfInterests.remove(at: selectedNumber)
    
    removedInterests.append(chosenActivity)
    
    if removedInterests.count >= 8 {
        listOfInterests.append(contentsOf: removedInterests)
    }
    
    return chosenActivity
}

// func to compare each person and print out their differences
func compare(personOne: Person, personTwo: Person) {
    
    print("..\n\(personTwo.name)\n")
    
    print("\(personTwo.name)'s unshared interests with \(personOne.name):")
    
    // storeing symmetricDifference for each person in participants and assigning them to an individual Set
    let participantDifference = personOne.interests.symmetricDifference(personTwo.interests)
    
    // selecting activityElement from each symmetricDifferenceSet
    for element in participantDifference {
        
        // print activity name
        print("----> \(element.name)")
        
    } // element
    print("Difference = \(participantDifference.count)\n")
    
    if participantDifference.count == 0 {
        print("\(personOne) and \(personTwo) are a perfect match!")
    }
    
    comparisonDict[personOne] = [personTwo: participantDifference]
    
}

// func to iterate over comparisonDictionary and compare each comparisonSet to listOfActivities
func comparisonToCollection() {
    print(" - - - - - - - - - - - ~  Key  ~ - - - - - - - - - - - \n")
    print("Perfect Match *** = 0 interests are different\nGood Match + + + = 2 interests are different\nSimilar Interests = 4 interests are different\n")
    print(" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~\n\n")
    
    print("           ----  Comparison Results ----\n")
    for (person, comparisonPerson)  in comparisonDict {
        for (comparedPerson, comparisonSet) in comparisonPerson {
            
            // comparing comparisonSet to the Set version of Activity Collection
            let subtractingSet = comparisonSet.subtracting(listOfInterestsSet)
            
            if subtractingSet.count == 0 {
                print("*** \(person.name) and \(comparedPerson.name) are a Perfect Match! ***\n..")
            } else if subtractingSet.count == 2 {
                print("Looks like \(person.name) and \(comparedPerson.name) are a Good Match + + +\n..")
            } else if subtractingSet.count == 4 {
                print("\(person.name) and \(comparedPerson.name) have some similar Interests\n..")
            } else if subtractingSet.count == 6 {
                print("\(person.name) and \(comparedPerson.name) are not compatible -- \n..")
            }
        }
    }
}

// function to select and remove a PersonSet from participants at random
func chooseParticipantSet() -> Set<Person> {
    // randomizing number
    let randomizedNumber = randomNumber(limit: secondaryParticipants.count)
    
    // selecting a random participant to be pulled for comparison
    let chosenParticipantSet = secondaryParticipants.remove(at: randomizedNumber)
    
    return chosenParticipantSet
    
}

// -----------------------------------------------------------------------------

print("      ----    Introducing Participants    ---- \n\n")

// generateParticipant Loop
// loop to itereate over number of participants and create a Person for each - 9/24
for _ in 1...randomNumber(limit: 12) {
    let chosenName = randomName()
    let chosenHometown = randomHometown()
    var interest1 = randomActivity()
    var interest2 = randomActivity()
    var interest3 = randomActivity()
    
    // Checking for repeating interests within the Person Set - 9/25
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
    
    // Generated Activity Set to be added to a generated Person
    let generatedActivitySet: Set = [Activity.init(name: interest1.name, description: interest1.description), Activity.init(name: interest2.name, description: interest2.description), Activity.init(name: interest3.name, description: interest3.description)]
    
    // Generating a person as a Set to be compared later
    let generatedPerson: Set = [Person.init(name: chosenName, hometown: chosenHometown, interests: generatedActivitySet)]
    
    // adding generatedPerson Set to the participants array
    participants.append(generatedPerson)
    
    // introducing (printing to the console) players to each other
    for person in generatedPerson {
        print("Participant Name: \(person.name) \nFrom: \(person.hometown)\nInterests: \(interest1.name), \(interest2.name), \(interest3.name)")
        generateIntroduction(for: person)
        print("\n")
    }
}

// adding contents of the participants array to a duplicate Set
secondaryParticipants.append(contentsOf: participants)

// displaying spacing message
if participants.count >= 1 {
    
    print("\n\n\n____________________________________________________\n\n              Comparing participants\n\n____________________________________________________\n\n\n")
    
} else if participants.count >= 1 {
    
    print("\n\n\n____________________________________________________\n\n       Sorry are not enough participants to compare to \n\n____________________________________________________\n\n\n")
}

// loop to cycle through each player and print out Symmertrical Difference between each participant
while participants.count > 1 && secondaryParticipants.count != 0 {
    
    // selecting a Person from participants Array
    var selectedSet = chooseParticipantSet()
    
    let personYIndex = participants.firstIndex(of: selectedSet)
    duplicateSetCollection.append(participants.remove(at: personYIndex!))
    
    // selecting personX to be compared to the rest of the participants from selectedSet
    for personX in selectedSet {
        print("                   -- \(personX.name) -- \n\n\(personX.name) is now being compared to the rest of the participants:\n")
        
        // comparing personX to each person in participants
        //  selecting a personSet from particpants array to be compared to personX
        for comparisonPersonSet in participants {
            
            // selecting personY from comparisonPersonSet
            for personY in comparisonPersonSet {
                
                compare(personOne: personX, personTwo: personY)
                
            }
            
        }
        
    }
    
    participants.append(selectedSet)
    
    // removing the PersonSet inside selectedSet for the next round
    selectedSet.removeFirst()
    
    // printing a line to make space
    print("___________________________________________________\n")
    
} // while participants.count != 0 {

// displaying spacing message
if participants.count >= 2 {
    
    print("\n\n\n\n      ----    Matching participants    ----\n\n\n\n____________________________________________________\n\n\n")
    
} else if participants.count >= 1 {
    
    print("\n\n\n____________________________________________________\n\n       Sorry are not enough participants to compare to \n\n____________________________________________________\n\n\n")
}

comparisonToCollection()

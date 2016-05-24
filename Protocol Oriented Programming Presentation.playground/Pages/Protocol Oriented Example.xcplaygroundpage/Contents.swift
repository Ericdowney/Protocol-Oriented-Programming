/*:
 [Previous](@previous)
 
## Protocol Oriented Example
 
### Quote:
 ---
#### "If you're subclassing, then you're doing it wrong!"
 ---


\- Hector Matos
 \- <http://krakendev.io/blog/subclassing-can-suck-and-heres-why>

* Now lets look at the exact same example with protocols
* How do we think in a protocol oriented way?
* Traits!

*/

protocol Alive {
    var alive: Bool { get }
}

protocol Ears {
    var ears: Int { get }
    func listen() -> String
}

protocol Eyes {
    var eyes: Int { get }
    func lookAround() -> String
}

protocol Nose {
    func smell(something: String) -> String
}

protocol Name {
    var name: String { get }
    func identify() -> String
}

protocol Age {
    var age: Int { get }
    func howOld() -> String
}

class PersonImplemented: Alive, Ears, Eyes, Nose, Name, Age {
    var alive: Bool = true
    var ears: Int = 2
    var eyes: Int = 2
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func listen() -> String {
        return "Person: I'm listening with \(ears) ears"
    }
    
    func lookAround() -> String {
        return "Person: I'm looking with \(eyes) eyes"
    }
    
    func smell(something: String) -> String {
        return "Person: I'm smelling for \(something)"
    }
    
    func identify() -> String {
        return "Person: My name is \(name)"
    }
    
    func howOld() -> String {
        return "Person: I'm \(age) years old"
    }
}

let newEric = PersonImplemented(name: "Eric", age: 25)

newEric.identify()
newEric.howOld()
newEric.listen()
newEric.lookAround()
newEric.smell("cake")


/*:
## Now the Best thing ever!

### Protocol Extensions

*/


extension Ears {
    func listen() -> String {
        return "I'm listening with \(ears) ears"
    }
}

extension Eyes {
    func lookAround() -> String {
        return "I'm looking with \(eyes) eyes"
    }
}

extension Nose {
    func smell(something: String) -> String {
        return "I'm smelling \(something)"
    }
}

extension Name {
    func identify() -> String {
        return "My name is \(name)"
    }
}

extension Age {
    func howOld() -> String {
        return "I'm \(age) years old"
    }
}

class Person: Alive, Ears, Eyes, Nose, Name, Age {
    var alive: Bool = true
    var ears: Int = 2
    var eyes: Int = 2
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let finalEric = Person(name: "Eric", age: 25)

finalEric.identify()
finalEric.howOld()
finalEric.listen()
finalEric.lookAround()
finalEric.smell("Cremé Brulee")

/*:
## Now lets get an alien in here

> Remember the Mind Powers!

*/

protocol Telepathy {
    func mindPower() -> String
}

extension Telepathy {
    func mindPower() -> String {
        return "I have MIND POWERS!"
    }
}

class Alien: Alive, Ears, Nose, Telepathy {
    var alive: Bool = true
    var ears: Int = 4
}

let anAlien = Alien()

anAlien.listen()
anAlien.smell("Space Pie")
anAlien.mindPower()

/*:
## Advanced Protocol Extensions

> the where and Self keywords

*/

extension Ears where Self: Person {
    var ears: Int {
        return 2
    }
}

protocol Strong {}

extension Nose where Self: Strong {
    func smell(something: String) -> String {
        return "I have a super smeller"
    }
}

//:##### Uncomment this line for cool stuff

//extension Person: Strong {}

let superEric = Person(name: "Super Eric", age: 25)

superEric.smell("something")

//: [Next](@next)

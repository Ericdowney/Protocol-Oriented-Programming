/*:
 [Previous](@previous)
 
## Objected Oriented Example

* Our Mission
    * A client wants an app that can display a list of creatures
        * Creatures included:
            * People
            * Animals
        * Attributes Available
            * Alive
            * Ears
            * Nose
            * Eyes
*/

class Being {
    let alive: Bool
    init(alive: Bool) {
        self.alive = alive
    }
}

class Animal: Being {
    var ears: Int
    var eyes: Int
    var nose: Bool
    
    init(ears: Int, eyes: Int, nose: Bool) {
        self.ears = ears
        self.eyes = eyes
        self.nose = nose
        super.init(alive: true)
    }
    
    func listen() -> String {
        if self.ears > 0 {
            return "I'm listening with \(ears) ears"
        }
        return ""
    }
    
    func lookAround() -> String {
        if self.eyes > 0 {
            return "I'm looking with \(eyes) eyes"
        }
        return ""
    }
    
    func smell(something: String) -> String {
        if self.nose {
            return "I'm smelling for \(something)"
        }
        return ""
    }
}

class Person: Animal {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init(ears: 2, eyes: 2, nose: true)
    }
}

let eric = Person(name: "Eric", age: 25)

eric.listen()
eric.lookAround()
eric.smell("pie")

/*:
## Uh-Oh!

Now the clients wants to add aliens with mind powers

class Alien: ? {

}

[Next](@next)
*/

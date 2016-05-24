/*:
 [Previous](@previous)
 
## Protocol Associated Types

#### Generic Element Container Protocol
#### Mutability

Reference Types vs Value Types
*/
protocol ElementContainer {
    associatedtype Type
    var elements: [Type] { get set }
    mutating func add(elements: [Type])
}

extension ElementContainer {
    mutating func add(elements: [Type]) {
        self.elements += elements
    }
}

/*:
#### String Element Container Implemented
*/
struct StringContainer: ElementContainer {
    var elements: [String]
}

/*:
#### Int Element Container Implemented
*/
struct IntContainer: ElementContainer {
    var elements: [Int]
}

/*:
#### Generic Element Container Implemented
*/
struct Container<T>: ElementContainer {
    var elements: [T]
    init(elements: T...) {
        self.elements = []
        self.add(elements)
    }
}

struct SomeObject {
    var name: String
}

let sContainer = StringContainer(elements: ["1", "2", "3"])
sContainer.elements

let iContainer = IntContainer(elements: [1, 2, 3])
iContainer.elements

let container1 = Container(elements: ["hello", "world"])
container1.elements

let container2 = Container(elements: [1, 2])
container2.elements

let container3 = Container(elements: SomeObject(name: "Eric"), SomeObject(name: "Scott"), SomeObject(name: "Holden"), SomeObject(name: "Bobby"), SomeObject(name: "Matt"))
container3.elements

//: [Next](@next)

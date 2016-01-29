//: [Previous](@previous)

import UIKit

/*:
## Protocol Associated Types

*/

/*:
#### Generic Element Container Protocol
*/
protocol ElementContainer {
    typealias Type
    var elements: [Type] { get set }
    mutating func add(element: Type)
}

extension ElementContainer {
    mutating func add(element: Type) {
        self.elements.append(element)
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

    This essentially reimplements Array
*/
struct Container<T>: ElementContainer {
    var elements: [T]
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

let container3 = Container(elements: [SomeObject(name: "Eric"), SomeObject(name: "Scott"), SomeObject(name: "Holden"), SomeObject(name: "Bobby"), SomeObject(name: "Matt")])
container3.elements

/*:
#### Mutability

    Reference Types vs Value Types
*/

//: [Next](@next)

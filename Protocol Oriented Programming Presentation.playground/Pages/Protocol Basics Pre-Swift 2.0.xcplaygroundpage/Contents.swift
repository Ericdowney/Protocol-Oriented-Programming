//: [Previous](@previous)

import UIKit

/*:
## Protocol Basics: Pre-Swift 2.0

    Delegates
    Table View Data Source / Delegate

*/

protocol MyProtocol {
    func myMethod() -> String
}

class MyNotUsedClass: MyProtocol {
    func myMethod() -> String {
        return "Does something cool"
    }
}

MyNotUsedClass().myMethod()

//:#### Your normal delegate pattern

//: > 1: MyActionDelegate protocol has been defined
protocol MyActionDelegate {
    func actionOccurred() -> String
}

//: > 2: A UI element now has some instance variable which is of type MyActionDelegate1
class SomeUIElement {
    var delegate: MyActionDelegate? = nil
    
    func userDidSomething() -> String {
        return self.delegate?.actionOccurred() ?? "Stock String"
    }
}

//: > 3: A class now conforms to the previously declared protocol
class MyClass: MyActionDelegate {
    var uiInstance: SomeUIElement?
    
    func initialize(element: SomeUIElement) {
        self.uiInstance = element
//: > 5: This instance of MyClass is now the delegate for the UI element
        self.uiInstance?.delegate = self
    }
    
    func actionOccurred() -> String {
        // Respond to Some UI Action
        return "Hello Delegate Pattern"
    }
}

let uiElement = SomeUIElement()
let myObj = MyClass()

//: > 4: A MyClass object is instantiated with a ui element
myObj.initialize(uiElement)

//: > 6: We now call userDidSomething on our UI element which in turn will call our delegate function
uiElement.userDidSomething()

//:#### Table View

class NormalViewController: UIViewController, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("Cell")!
    }
}

//: [Next](@next)

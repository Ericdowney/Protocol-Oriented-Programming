//: [Previous](@previous)

import Foundation

/*:
## What is a Protocol?

A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality <https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html>

### Java Action Listener

    public interface ActionListener {
        public void actionPerformed(ActionEvent e)
    }



    public class MyClass1 extends ActionListener {
        public void actionPerformed(ActionEvent e) {
            // Do something cool here.
        }
    }



    A reimplementation of Java's ActionListener Interface in Swift
*/

struct ActionEvent {}

protocol ActionListener {
    func actionPerformed(e: ActionEvent)
}

class MyClass1: ActionListener {
    func actionPerformed(e: ActionEvent) {
        // Do something cool here.
    }
}

/*:
## Is this really what we want?
*/

//: [Next](@next)

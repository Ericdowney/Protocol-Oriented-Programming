import XCTest

/*:
 [Previous](@previous)
 
## Testing made Simple with Protocols

Scenario:
* Register push notifications when user logs in


*/
struct User {}

/*:
### Once user object is set register the app for remote notifications
*/
class MyModel1 {
    var user: User? {
        didSet {
            UIApplication.sharedApplication().registerForRemoteNotifications()
        }
    }
}

/*:
### What do we Assert on?
*/

class MyModel1Tests: XCTestCase {
    func testShouldRegisterUser() {
        let subject = MyModel1()
        let user = User()
        
        subject.user = user
        
        // Assert: ?
    }
}

/*:
### Here come the protocols
*/

protocol RegisterRemoteNotifications {
    func registerForRemoteNotifications()
}

class MyModel {
    
    var remoteNotificationRegistrar: RegisterRemoteNotifications? = nil
    
    init(remoteNotificationRegistrar: RegisterRemoteNotifications) {
        self.remoteNotificationRegistrar = remoteNotificationRegistrar
    }
    
    var user: User? {
        didSet {
            self.remoteNotificationRegistrar?.registerForRemoteNotifications()
        }
    }
}

/*:
#### My Model Tests
*/

class MyModelTests: XCTestCase {
    private class MockRegistrar: RegisterRemoteNotifications {
        var register = false
        func registerForRemoteNotifications() {
            self.register = true
        }
    }
    
    
    func testShouldRegisterUser() {
        let registrar = MockRegistrar()
        let subject = MyModel(remoteNotificationRegistrar: registrar)
        let user = User()
        
        subject.user = user
        
        XCTAssertTrue(registrar.register)
    }
}

/*:
### What does this get us?

    UIApplication != RegisterRemoteNotifications

*/

extension UIApplication: RegisterRemoteNotifications {}

let model = MyModel(remoteNotificationRegistrar: UIApplication.sharedApplication())

//: [Next](@next)

# MulticastDelegate
Alternative mechanism for NotificationCenter for trigger the events in broadcasting style


**HOW TO USE:**

// Create a protocol for methods you want to invoke

protocol SignUpProtocol {
   func didCompleteSignUp()
}

extension LandingViewController: SignUpProtocol {
   func didCompleteSignUp() {
       // Do something
   }
}

// Create an instance for the delegate

let onCompleteSignUp = MulticastDelegate<SignUpProtocol>()
  
// Add to targets
  
onCompleteSignUp.add(self) // Here self is reference of LandingViewController
  
// Invoke
  
onCompleteSignUp.invoke { $0.didCompleteSignUp() }

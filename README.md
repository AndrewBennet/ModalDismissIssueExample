# Modal Dismiss Issue Example
A demo of an issue in iOS 11 when dismissing modally presented navigation controllers

This project supplements [this stack overflow question](https://stackoverflow.com/q/46228862/5513562).

There are two ways of dismissing a modally presented navigation controller, from the final view controller in the navigation flow:
 
- Ask the presenting VC to dismiss it: `self.presentingViewController!.dismiss(animated: true)`
- Call dismiss on the navigation controller: `self.navigationController!.dismiss(animated: true)`

The second is allowed since the [docs](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621505-dismiss) say: 

> If you call this method on the presented view controller itself, UIKit asks the presenting view controller to handle the dismissal.
        
They both have problems!
        
Type 1 produces a visual artifact: a duplicate VS is seen under the dismissed one
Type 2 needs to be called twice in order to work! Presumably, the first call is dismissing the search controller?...

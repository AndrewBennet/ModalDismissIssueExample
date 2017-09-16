//
//  ViewController.swift
//  ModalDismissIssueExample
//
//  Created by Andrew Bennet on 16/09/2017.
//  Copyright © 2017 Andrew Bennet. All rights reserved.
//

import UIKit

class Page1VC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up a search controller, add it to the navigation item.
        // When the following block is commented out, the issue upon dismissing Page2VC is not present
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

class Page2VC: UIViewController {
    
    @IBAction func doneWasPressed(_ sender: Any) {
        // There are two ways of dismissing this modal navigation series.
        // 1. Ask the preseting VC to dismiss it (https://developer.apple.com/documentation/uikit/uiviewcontroller/1621505-dismiss)
        // 2. Call dismiss on this VC, which should also work. Accoding to the docs:
                /* If you call this method on the presented view controller itself,
                 UIKit asks the presenting view controller to handle the dismissal. */
        
        // They both have problems!
        
        // Type 1 produces a visual artifact: a duplicate VS is seen under the dismissed one
        self.presentingViewController!.dismiss(animated: true)
        
        // Type 2 needs to be called twice in order to work! Presumably, the first call is dismissing
        // the search controller?...
        // self.navigationController!.dismiss(animated: true)
        
    }
}


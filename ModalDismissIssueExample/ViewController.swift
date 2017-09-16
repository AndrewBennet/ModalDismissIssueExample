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
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.searchController?.isActive = false
    }
    
    // this is not needed, but I wanted to make sure dismiss worked from Page1VC, too
    
    @IBAction func doneWasPressed(_ sender: Any) {
        navigationController!.dismiss(animated: true)
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
        // presentingViewController!.dismiss(animated: true)
        
        // Type 2 needs to be called twice in order to work! Presumably, the first call is dismissing
        // the search controller?...
        navigationController!.dismiss(animated: true)
    }
}


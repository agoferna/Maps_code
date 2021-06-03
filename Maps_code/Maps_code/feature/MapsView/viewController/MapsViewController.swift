//
//  ViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 02/06/2021.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
    }
    
    func configureMap(){        
        if let view = self.view as? MapsView {
            view.configureView()
        }
    }


}


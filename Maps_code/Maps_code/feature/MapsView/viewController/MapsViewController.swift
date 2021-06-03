//
//  ViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 02/06/2021.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController {

    private var mapsViewModel : MapsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        callToViewModelForUIUpdate()

    }
    
    func callToViewModelForUIUpdate(){
        
        self.mapsViewModel =  MapsViewModel()
        self.mapsViewModel.bindEmployeeViewModelToController = {
            //self.updateDataSource()
        }
    }
    
    func configureMap(){        
        if let view = self.view as? MapsView {
            view.configureView()
        }
    }


}


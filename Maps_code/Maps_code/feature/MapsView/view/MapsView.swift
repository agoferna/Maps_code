//
//  MapsView.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import UIKit
import GoogleMaps

class MapsView: UIView {

    @IBOutlet weak var mapsView: GMSMapView!

    func configureView(){
        configureMapsView()
    }
    
    func configureMapsView(){
        mapsView.mapType = .normal
    }

}

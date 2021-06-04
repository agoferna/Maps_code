//
//  MapsView.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 03/06/2021.
//

import UIKit
import GoogleMaps

private struct Constants {
    static let cellID : String = "TripsTableViewCell"
}

class MapsView: UIView {

    @IBOutlet weak var mapsView: GMSMapView!
    @IBOutlet weak var mapsTableView: UITableView!
    
    func configureView(){
        configureMapsView()
        configureTableView()
    }
    
    func configureMapsView(){
        mapsView.mapType = .normal
    }
    
    func configureTableView(){
        self.mapsTableView.register(UINib(nibName: Constants.cellID, bundle: nil), forCellReuseIdentifier: Constants.cellID)
    }
    
    func getTableView() -> UITableView {
        return mapsTableView
    }

}

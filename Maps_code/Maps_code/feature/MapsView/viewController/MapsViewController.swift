//
//  ViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 02/06/2021.
//

import UIKit
import GoogleMaps

private struct Constants {
    static let cellName : String = "TripsTableViewCell"
}

class MapsViewController: UIViewController {

    private var mapsViewModel : MapsViewModel!
    private var dataSource : EmployeeTableViewDataSource<TripsTableViewCell,Trip>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        callToViewModelForUIUpdate()

    }
    
    func callToViewModelForUIUpdate(){        
        self.mapsViewModel =  MapsViewModel()
        self.mapsViewModel.bindEmployeeViewModelToController = {
            self.configureTableViewDataSource()
        }
    }
    
    func configureMap(){        
        if let view = self.view as? MapsView {
            view.configureView()
        }
    }
    
    func configureTableViewDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: Constants.cellName, items: self.mapsViewModel.trips, configureCell: { (cell, trip) in
           
            cell.titleCellLabel.text = trip.description
            cell.originLabel.text = trip.origin?.address
            cell.destinationLabel.text = trip.destination?.address
            cell.statusLabel.text = trip.status?.rawValue
            
        })
        
        DispatchQueue.main.async {
            if let view = self.view as? MapsView {
                view.mapsTableView.dataSource = self.dataSource
                view.mapsTableView.reloadData()
            }
        }
    }


}


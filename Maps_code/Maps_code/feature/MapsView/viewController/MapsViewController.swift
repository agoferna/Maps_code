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
            view.configureView(delegate: self)
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
    
    func configureMapStopsAndPolyline(selectedTrip: Int){
        
        if let trip = mapsViewModel.getTrip(tripIndex: selectedTrip) {
            
            for stop in trip.stops {
            
                if let latitude = stop?.point?.latitude, let longitude = stop?.point?.longitude {
                
                let position = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees.init(latitude),
                    longitude: CLLocationDegrees.init(longitude))
                let marker = GMSMarker(position: position)
                    
                    if let view = self.view as? MapsView {
                        view.addMarker(marker: marker)
                    }
                }
            }
        }
    }
}

extension MapsViewController : MapsViewProtocol {
    func selectedRow(row: Int) {
        self.configureMapStopsAndPolyline(selectedTrip: row)
    }
}


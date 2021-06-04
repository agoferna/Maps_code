//
//  ViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 02/06/2021.
//

import UIKit
import GoogleMaps
import Polyline

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
    
    func configureMapWhenSelectRow(selectedTrip: Int){
       
        let markers = configureMapMarkers(selectedTrip: selectedTrip)
        let path = configureMapPolyline(selectedTrip: selectedTrip)
        if let view = self.view as? MapsView {
            view.drawPolyLine(path: path)
            view.zoomMap(path: path)
            for marker in markers {
                view.addMarker(marker: marker)
            }
        }
    }
    
    func configureMapPolyline(selectedTrip: Int) -> GMSMutablePath?{
        var resultPolyline : GMSMutablePath? = nil
        if let trip = mapsViewModel.getTrip(tripIndex: selectedTrip) {
            
            let polyline = Polyline(encodedPolyline: trip.route ?? "")
            if let decodedCoordinates = polyline.coordinates {
                let path = GMSMutablePath()
                
                for coordinates in decodedCoordinates {
                    path.add(coordinates)
                }
                resultPolyline = path
            }
        }
        return resultPolyline
    }
    
    func configureMapMarkers(selectedTrip: Int) -> [GMSMarker]{
        
        var arrayOfMarkers : [GMSMarker] = []
        
        if let trip = mapsViewModel.getTrip(tripIndex: selectedTrip) {
            
            for stop in trip.stops {
            
                if let latitude = stop?.point?.latitude, let longitude = stop?.point?.longitude {
                
                let position = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees.init(latitude),
                    longitude: CLLocationDegrees.init(longitude))
                let marker = GMSMarker(position: position)
                    arrayOfMarkers.append(marker)
                }
            }
            
            if let startLatitude = trip.origin?.point?.latitude, let startLongitude = trip.origin?.point?.longitude {
                let position = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees.init(startLatitude),
                    longitude: CLLocationDegrees.init(startLongitude))
                let marker = GMSMarker(position: position)
                arrayOfMarkers.append(marker)
            }
            
            if let destinationLatitude = trip.destination?.point?.latitude,
               let destinationLongitude = trip.destination?.point?.longitude {
                let position = CLLocationCoordinate2D(
                    latitude: CLLocationDegrees.init(destinationLatitude),
                    longitude: CLLocationDegrees.init(destinationLongitude))
                let marker = GMSMarker(position: position)
                arrayOfMarkers.append(marker)
            }
        }
        return arrayOfMarkers
    }
}

extension MapsViewController : MapsViewProtocol {
    func selectedRow(row: Int) {
        self.configureMapWhenSelectRow(selectedTrip: row)
    }
}


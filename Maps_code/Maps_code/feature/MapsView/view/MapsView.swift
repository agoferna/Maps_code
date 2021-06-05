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
    static let markerId : String = "id"
}

protocol MapsViewProtocol {
    func selectedRow(row: Int)
    func selectedMarker(markerId: Int)
}


class MapsView: UIView {

    @IBOutlet weak var mapsView: GMSMapView!
    @IBOutlet weak var mapsTableView: UITableView!
    
    var delegate : MapsViewProtocol?
    
    func configureView(delegate: MapsViewProtocol){
        configureMapsView()
        configureTableView()
        self.delegate = delegate
    }
    
    func configureMapsView(){
        mapsView.mapType = .normal
        mapsView.delegate = self
    }
    
    func configureTableView(){
        self.mapsTableView.register(UINib(nibName: Constants.cellID, bundle: nil), forCellReuseIdentifier: Constants.cellID)
        self.mapsTableView.delegate = self
    }
    
    func drawPolyLine(path: GMSMutablePath?){
        if let path = path {
            let polyline = GMSPolyline(path: path)
            polyline.strokeWidth = 2
            polyline.strokeColor = .red
            polyline.map = mapsView
        }
    }
    
    func addMarker(marker: GMSMarker){
        marker.map = mapsView
    }
    
    func zoomMap(path: GMSMutablePath?){
        if let path = path {
            let bounds = GMSCoordinateBounds(path: path)
            mapsView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 50.0))
        }
    }
    
    func deleteMarkers(){
        mapsView.clear()
    }
    
}

extension MapsView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteMarkers()
        self.delegate?.selectedRow(row: indexPath.row)
    }
}

extension MapsView: GMSMapViewDelegate {

    // tap map marker
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        print("didTap marker \(marker.title)")

        // remove color from currently selected marker
        if let selectedMarker = mapView.selectedMarker {
            selectedMarker.icon = GMSMarker.markerImage(with: nil)
        }

        // select new marker and make green
        mapView.selectedMarker = marker
        marker.icon = GMSMarker.markerImage(with: UIColor.green)

        // tap event handled by delegate
        if let id =  marker.userData as? Int {
            self.delegate?.selectedMarker(markerId: id)
        }
        return true
    }
}

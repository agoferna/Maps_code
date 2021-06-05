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

protocol MapsViewProtocol {
    func selectedRow(row: Int)
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

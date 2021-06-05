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
    static let yMarkerViewDistance : CGFloat = 50.0
}

protocol MapsViewProtocol {
    func selectedRow(row: Int)
    func selectedMarker(markerId: Int)
}


class MapsView: UIView {

    @IBOutlet weak var mapsView: GMSMapView!
    @IBOutlet weak var mapsTableView: UITableView!
    
    var delegate : MapsViewProtocol?
    var markerView : MarkerView?
    var selectedMarker : GMSMarker?
    
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
    
    func addMarkerViewInformation(stationName: String, passenger: String, time: String, price: String){
        
        self.markerView?.removeFromSuperview()
        self.markerView = MarkerView(frame: CGRect(x: 0, y: 0, width: 200, height: 80))
        self.markerView?.configureData(stationName: stationName,
                                          passengerName: passenger,
                                          stopTime: time,
                                          price: price)
        
        if let infoView = markerView, let location = self.selectedMarker?.position {
            infoView.center = mapsView.projection.point(for: location)
            infoView.center.y = infoView.center.y - Constants.yMarkerViewDistance
            self.addSubview(infoView)
        }
    }
    
}

extension MapsView : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deleteMarkers()
        self.markerView?.removeFromSuperview()
        self.delegate?.selectedRow(row: indexPath.row)
    }
}

extension MapsView: GMSMapViewDelegate {

    // tap map marker
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        if let selectedMarkerMap = mapView.selectedMarker {
            selectedMarkerMap.icon = GMSMarker.markerImage(with: nil)
        }
        mapView.selectedMarker = marker
       

        // tap event handled by delegate
        if let id =  marker.userData as? Int {
           if id != self.selectedMarker?.userData as? Int {
            marker.icon = GMSMarker.markerImage(with: UIColor.green)
            self.selectedMarker = marker
            self.delegate?.selectedMarker(markerId: id)
        } else {
            self.selectedMarker = nil
            self.markerView?.removeFromSuperview()
        }
        } else {
            marker.icon = GMSMarker.markerImage(with: UIColor.green)
            self.selectedMarker = nil
            self.markerView?.removeFromSuperview()
        }
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        if let infoView = markerView, let location = self.selectedMarker?.position {
            infoView.center = mapsView.projection.point(for: location)
            infoView.center.y = infoView.center.y - Constants.yMarkerViewDistance
        }
    }
}

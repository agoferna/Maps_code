//
//  MarkerView.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

class MarkerView: UIView {

    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var passengerTitleLabel: UILabel!
    @IBOutlet weak var passengerLabel: UILabel!
    @IBOutlet weak var stopTimeTitleLabel: UILabel!
    @IBOutlet weak var stopTimeLabel: UILabel!
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet var view: UIView!
    
    
    //MARK: - Life Cycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    private func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth,
                                 UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
        self.view = view
        self.configureView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
    }

    
    func configureData(stationName: String,
                       passengerName: String,
                       stopTime: String,
                       price: String) {
        
        stationNameLabel.text = stationName
        passengerLabel.text = passengerName
        stopTimeLabel.text = stopTime
        priceLabel.text = price
    }
    
    func configureView(){
        configureStrings()
    }
    
    func configureStrings(){
        
        passengerTitleLabel.text =  NSLocalizedString("Map_Marker_Passenger_Title", comment: "")
        stopTimeTitleLabel.text =  NSLocalizedString("Map_Marker_StopTime_Title", comment: "")
        priceTitleLabel.text =  NSLocalizedString("Map_Marker_Price_Title", comment: "")
    }
    

}



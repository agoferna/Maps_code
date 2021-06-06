//
//  ReportViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

class ReportViewController: UIViewController {
    
    private var reportViewModel : ReportViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureViewModel()
    }
    
    func configureView(){
        self.hideKeyboardWhenTappedAround() 
        configureTextFields()
    }
    
    func configureViewModel(){
        self.reportViewModel =  ReportViewModel()
    }
    
    func configureTextFields(){
        
        if let view = self.view as? ReportView {
            view.configureView(delegate: self)
        }
    }
    

}

extension  ReportViewController : nameReportViewProtocol{
    
    func sendInformation(name: String,
                         surname: String,
                         phone: String,
                         email: String,
                         date: String,
                         description: String) {
        
        let report = Report(name: name,
                            surname: surname,
                            phoneString: phone,
                            email: email,
                            dateString: date,
                            description: description)
        
        self.reportViewModel.saveReportRealmModel(report: report)
    }
}

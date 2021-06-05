//
//  ReportViewController.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

class ReportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    func configureView(){
        self.hideKeyboardWhenTappedAround() 
        configureTextFields()
    }
    
    func configureTextFields(){
        
        if let view = self.view as? ReportView {
            view.configureView()
        }
    }
    

    

}

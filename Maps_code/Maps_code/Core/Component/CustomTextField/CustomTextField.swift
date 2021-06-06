//
//  CustomTextField.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

enum typeOftextField{
    case text
    case phone
    case email
    case date
}

class CustomTextField: UIView {

    @IBOutlet weak var requiredFieldView: UIView!
    @IBOutlet var view: UIView!
    @IBOutlet weak var requiredFieldLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var typeOfTextField : typeOftextField?
    var datePiker : UIDatePicker?
    
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
    
    func configureView(){
        configureStrings()
    }
    
    func configureStrings(){
        requiredFieldLabel.text =  NSLocalizedString("Common_Required_field", comment: "")
    }
    
    func configureTextField(placeHolder: String, typeOfInfo: typeOftextField, isRequired : Bool = true){
        textField.placeholder = placeHolder
        self.typeOfTextField = typeOfInfo
        self.requiredFieldView.isHidden = !isRequired
        
        switch typeOfInfo {
        case .date:
            self.datePiker = UIDatePicker()
            self.datePiker?.datePickerMode = .dateAndTime
            self.datePiker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
            
            textField.inputView = datePiker
        case .phone:
            textField.keyboardType = .numberPad
        default:
            break
        }
    }

@objc func dateChanged(datePicker: UIDatePicker){
    textField.text =  DateFormatter().getStringFromDateTextField(date: datePicker.date)
}
    
    func validateTextField() -> Bool{
        var response = false
        
        guard let text = textField.text else {
            self.setErrorTextfield(setError: true)
            return false
        }
        
        if requiredFieldView.isHidden && text.isEmpty {
            response = true
        } else {
            switch typeOfTextField {
            case .phone:
                response = text.isValidPhone()
            case .email:
                response = text.isValidEmail()
            default:
                response = !requiredFieldView.isHidden ? !text.isEmpty : true
            }
        }
        self.setErrorTextfield(setError: !response)
        return response
    }
    
    func setErrorTextfield(setError: Bool){
        
        textField.textColor = setError ?  UIColor.red :  UIColor.black
        requiredFieldLabel.textColor = setError ?  UIColor.red :  UIColor.black
        
    }
    
    
}

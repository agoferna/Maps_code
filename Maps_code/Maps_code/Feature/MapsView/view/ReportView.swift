//
//  ReportView.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

class ReportView: UIView {

    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var surnameTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var dateTextField: CustomTextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var descriptionLabelTitle: UILabel!
    @IBOutlet weak var requiredFieldLabel: UILabel!
    
    func configureView(){
        
        
        let nameText =  NSLocalizedString("Report_Name_TextField_Placeholder", comment: "")
        nameTextField.configureTextField(placeHolder: nameText, typeOfInfo: .text, isRequired: true)
        
        let surnameText =  NSLocalizedString("Report_Surname_TextField_Placeholder", comment: "")
        surnameTextField.configureTextField(placeHolder: surnameText, typeOfInfo: .text, isRequired: true)
        
        let phoneText =  NSLocalizedString("Report_Phone_TextField_Placeholder", comment: "")
        phoneTextField.configureTextField(placeHolder: phoneText, typeOfInfo: .phone, isRequired: false)
        let emailText =  NSLocalizedString("Report_Email_TextField_Placeholder", comment: "")
        emailTextField.configureTextField(placeHolder: emailText, typeOfInfo: .email, isRequired: true)
        let dateText =  NSLocalizedString("Report_Date_TextField_Placeholder", comment: "")
        dateTextField.configureTextField(placeHolder: dateText, typeOfInfo: .date, isRequired: true)
        descriptionLabelTitle.text = NSLocalizedString("Report_Description_Title", comment: "")
        requiredFieldLabel.text = NSLocalizedString("Common_Required_field", comment: "")
        textView.delegate = self
        
    }
    
    func setTextFieldError(setError: Bool){
        requiredFieldLabel.textColor = setError ? UIColor.red : UIColor.black
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        let namevValidation = nameTextField.validateTextField()
        let surnameValidation =  self.surnameTextField.validateTextField()
        let phonevalidation  = self.phoneTextField.validateTextField()
        let emailvalidation  =   self.emailTextField.validateTextField()
        let dateValidation  =   self.dateTextField.validateTextField()
        let textFieldValidation  = !self.textView.text.isEmpty
        
        self.setTextFieldError(setError: !textFieldValidation)
        
        if namevValidation &&
            surnameValidation &&
            phonevalidation &&
            emailvalidation &&
            dateValidation &&
            textFieldValidation{
            print ("OK")
        }
    }
}

extension ReportView : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 200
    }
}

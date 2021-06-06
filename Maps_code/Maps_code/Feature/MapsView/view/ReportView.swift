//
//  ReportView.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 05/06/2021.
//

import UIKit

protocol nameReportViewProtocol {
    func sendInformation(name: String, surname: String, phone: String, email: String, date: String, description : String)
}

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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomConstrainScrollView: NSLayoutConstraint!
    
    var delegate : nameReportViewProtocol?
    
    func configureView(delegate: nameReportViewProtocol?){

        textView.delegate = self
        configureStrings()
        configureScrollViewWithKeyboard()
        self.delegate = delegate
    }
    
    func configureStrings(){
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
        submitButton.setTitle(NSLocalizedString("Report_Button_Title", comment: ""), for: .normal)
    }
    
    func setTextFieldError(setError: Bool){
        requiredFieldLabel.textColor = setError ? UIColor.red : UIColor.black
    }
    
    func configureScrollViewWithKeyboard(){
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = self.convert(keyboardScreenEndFrame, from: self.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - self.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset
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
           
            self.delegate?.sendInformation(name: nameTextField.textField.text ?? "",
                                           surname: surnameTextField.textField.text ?? "",
                                           phone: phoneTextField.textField.text ?? "",
                                           email: emailTextField.textField.text ?? "",
                                           date: dateTextField.textField.text ?? "",
                                           description: self.textView.text ?? "")
        }
    }
}

extension ReportView : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 200
    }
}

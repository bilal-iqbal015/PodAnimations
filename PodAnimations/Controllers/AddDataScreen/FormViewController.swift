//
//  FormViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 10/31/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    var textfieldArray = [CustomTextField]()
    var personArray = [PersonDataModel]()
    let person = PersonDataModel(name: "", email: "", phoneNo: "")

    @IBOutlet weak var nameTxtField     : CustomTextField!
    @IBOutlet weak var emailTxtField    : CustomTextField!
    @IBOutlet weak var phoneNoTxtField  : CustomTextField!
    @IBOutlet weak var doneBtn          : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        
        setupNavBar()
        textfieldArray = [nameTxtField, emailTxtField, phoneNoTxtField]
        for textfield in textfieldArray {
            textfield.setupTextField(vc: self)
        }
        
        doneBtn.layer.cornerRadius = 8
        doneBtn.addTarget(self, action: #selector(doneBtnAction), for: .touchUpInside)
        
    }
    
    private func setupNavBar() {
        navigationItem.title = "Person Data Form"
        navigationController?.navigationBar.isTranslucent       = false
        navigationController?.navigationBar.barStyle            = .blackTranslucent
        navigationController?.navigationBar.tintColor           = .orange
        view.backgroundColor                                    = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
    }
    
    private func resignTextFields (textfieldArray: [UITextField]) {
        for textfield in textfieldArray {
            textfield.resignFirstResponder()
        }
    }
    
    private func textFieldEditingCompleted(person: PersonDataModel, textfield: UITextField, valueToSet: String) {
        if textfield == nameTxtField {
            person.name = valueToSet
        }
        else if textfield == emailTxtField {
            person.email = valueToSet
        }
        else if textfield == phoneNoTxtField {
            person.phoneNo = valueToSet
        }
        textfield.resignFirstResponder()
    }
    
    private func openDisplayDataScreen(person: PersonDataModel) {
        personArray.append(person)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dataVC = storyboard.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
//        dataVC.personsArray = personArray
        self.navigationController?.pushViewController(dataVC, animated: true)
    }
    
    @objc private func doneBtnAction() {
        resignTextFields(textfieldArray: textfieldArray)
        openDisplayDataScreen(person: person)
    }

}

extension FormViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTxtField {
            textFieldEditingCompleted(person: person, textfield: nameTxtField, valueToSet: textField.text ?? "")
        }
        else if textField == emailTxtField {
            textFieldEditingCompleted(person: person, textfield: emailTxtField, valueToSet: textField.text ?? "")
        }
        else if textField == phoneNoTxtField {
            textFieldEditingCompleted(person: person, textfield: phoneNoTxtField, valueToSet: textField.text ?? "")
        }
        
    }
}


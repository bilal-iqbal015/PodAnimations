//
//  FormViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 10/31/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var phoneNoTxtField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        self.view.backgroundColor = .black
        
        doneBtn.layer.cornerRadius = 8
        doneBtn.addTarget(self, action: #selector(doneBtnAction), for: .touchUpInside)
        
        nameTxtField.layer.cornerRadius = 8
        nameTxtField.layer.borderWidth = 2
        nameTxtField.layer.borderColor = UIColor.orange.cgColor
        
        emailTxtField.layer.cornerRadius = 8
        emailTxtField.layer.borderWidth = 2
        emailTxtField.layer.borderColor = UIColor.orange.cgColor
        
        phoneNoTxtField.layer.cornerRadius = 8
        phoneNoTxtField.layer.borderWidth = 2
        phoneNoTxtField.layer.borderColor = UIColor.orange.cgColor
        
        
    }
    
    @objc private func doneBtnAction() {
        self.dismiss(animated: true, completion: nil)
    }

}

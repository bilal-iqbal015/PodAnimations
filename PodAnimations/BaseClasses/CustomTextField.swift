//
//  CustomTextField.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/1/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    func setupTextField(vc: UIViewController) {
        self.layer.cornerRadius    = 8
        self.layer.borderWidth     = 2
        self.layer.borderColor     = UIColor.orange.cgColor
        self.delegate = vc as? UITextFieldDelegate
    }

}

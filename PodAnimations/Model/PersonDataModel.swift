//
//  PersonDataModel.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/4/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import Foundation

class PersonDataModel: NSObject {
    
    var name: String?
    var email: String?
    var phoneNo: String?
    
    init(name: String, email: String, phoneNo: String) {
        self.name = name
        self.email = email
        self.phoneNo  = phoneNo
    }
}

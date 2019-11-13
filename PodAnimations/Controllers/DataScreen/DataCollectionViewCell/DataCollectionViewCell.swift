//
//  DataCollectionViewCell.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/4/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewData: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    
    func setupCollectionViewCell(){
        
        viewData.layer.borderColor = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1).cgColor
        viewData.layer.borderWidth = 4
        
        self.contentView.backgroundColor = .black
        self.viewData.backgroundColor = .black
        self.viewData.layer.cornerRadius = 8
        self.nameLbl.textColor = .orange
    }
    
    func setData(personData: PersonDataModel) {
        nameLbl.text = personData.name
    }
}

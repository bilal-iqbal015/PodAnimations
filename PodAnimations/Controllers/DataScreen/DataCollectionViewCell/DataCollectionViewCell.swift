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
        self.contentView.backgroundColor = .gray
        self.viewData.backgroundColor = .black
        self.viewData.layer.cornerRadius = 8
        self.nameLbl.textColor = .orange
    }
    
    func setData(personData: PersonDataModel) {
        nameLbl.text = personData.name
    }
}

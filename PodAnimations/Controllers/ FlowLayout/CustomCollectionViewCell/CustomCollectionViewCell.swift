//
//  CustomCollectionViewCell.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/11/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var dataLbl: UILabel!
    
    func setupCell(data: PersonSubjects){
        labelView.backgroundColor = .orange
        labelView.layer.cornerRadius = 8
        labelView.layer.borderColor = UIColor(ciColor: .black).cgColor
        labelView.layer.borderWidth = 4
        
        dataLbl.text = data.name
    }
    
}

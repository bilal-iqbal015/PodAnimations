//
//  ShowDataViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/5/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController {
    
    var person: PersonDataModel?
    
    @IBOutlet weak var dismissScreenBtn: UIButton!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLBl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        nameLbl.text = person?.name
        emailLbl.text = person?.email
        phoneLBl.text = person?.phoneNo
        
        dismissScreenBtn.setTitle("Dismiss", for: .normal)
        dismissScreenBtn.setTitle("Dismiss", for: .selected)
        dismissScreenBtn.layer.cornerRadius = 8
        dismissScreenBtn.addTarget(self, action: #selector(btnDismiss), for: .touchUpInside)
    }

    @objc private func btnDismiss() {
        print("Dismissed Screen")
        view.hero.modifiers = [ .translate(x: 0, y: -20, z: 0)]
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .none, dismissing: .none)
        self.navigationController?.popViewController(animated: true)
    }
}

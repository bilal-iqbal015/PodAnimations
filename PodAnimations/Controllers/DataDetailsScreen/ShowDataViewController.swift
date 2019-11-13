//
//  ShowDataViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/5/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit
import CoreAnimator
import Hero

class ShowDataViewController: UIViewController {
    
    var person: PersonDataModel?
    
    @IBOutlet weak var dismissScreenBtn: UIButton!
    @IBOutlet weak var flowBtn: UIButton!
    
    @IBOutlet weak var viewToMove: UIView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneLBl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissScreen(gr:))))
        
        nameLbl.text = person?.name
        emailLbl.text = person?.email
        phoneLBl.text = person?.phoneNo
        
        flowBtn.layer.cornerRadius = 8
        flowBtn.addTarget(self, action: #selector(flowBtnAction), for: .touchUpInside)
        
        dismissScreenBtn.setTitle("Dismiss", for: .normal)
        dismissScreenBtn.setTitle("Dismiss", for: .selected)
        dismissScreenBtn.layer.cornerRadius = 8
        dismissScreenBtn.addTarget(self, action: #selector(btnDismiss), for: .touchUpInside)
    }

    @objc private func flowBtnAction() {
        print("Button working")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "FlowLayoutViewController") as! FlowLayoutViewController
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .auto, dismissing: .auto)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func btnDismiss() {
        print("Dismissed Screen")
        view.hero.modifiers = [ .translate(x: 0, y: -20, z: 0)]
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .none, dismissing: .none)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @objc private func dismissScreen(gr: UIPanGestureRecognizer) {
        let translation = gr.translation(in: view)
        switch gr.state {
        case .began:
            self.navigationController?.popViewController(animated: true)
        case .changed:
            Hero.shared.update(translation.y / view.bounds.height)
        default:
            let velocity = gr.velocity(in: view)
            if ((translation.y + velocity.y) / view.bounds.height) > 0.5 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
}

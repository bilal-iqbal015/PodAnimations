//
//  ViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 10/31/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit
import CoreAnimator

class ViewController: UIViewController {

    var path: UIBezierPath!
    
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeScreen()
    }

    private func setupHomeScreen() {
        self.view.backgroundColor = .black
        
        registerLbl.textColor = .orange
        
        
        signupBtn.setTitleColor(.black, for: .normal)
        signupBtn.setTitleColor(.black, for: .selected)
        btnShape(isOval: true, viewToChange: signupBtn)
        
        signupBtn.addTarget(self, action: #selector(signupBtnAction), for: .touchUpInside)
    }
    
    private func btnShape(isOval: Bool, viewToChange: UIButton) {
        viewToChange.backgroundColor = .clear
        path = isOval ? UIBezierPath(ovalIn: viewToChange.bounds) : UIBezierPath(ovalIn: CGRect(x: viewToChange.frame.size.width/2 - viewToChange.frame.size.height/2, y: 0, width: viewToChange.frame.size.height, height: viewToChange.frame.size.height))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.orange.cgColor
        viewToChange.layer.addSublayer(shapeLayer)
    }
    
    @objc private func signupBtnAction() {
        print("Button Pressed")
        registerLbl.isHidden = true
        
        let animator = CoreAnimator(layer: signupBtn.layer)
        animator.move(y: -300).thenAfter(t: 0.5).preAnimationBlock {
            print("Completion of animation")
            self.signupBtn.isHidden = true
            self.progressIndicatorAnimation()
        }.spring.bounce.animate(t: 0.5)
    }
    
    private func progressIndicatorAnimation() {
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        let spinnerAnimation = CoreAnimator(view: activityIndicator)
        spinnerAnimation.move(y: 500).wait(t: 2).postAnimationBlock {
            self.openForm()
            }.animate(t: 1) {
            activityIndicator.stopAnimating()
        }
    }
    
    private func openForm() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let formVC = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        self.present(formVC, animated: true) {
            self.signupBtn.isHidden = false
            self.registerLbl.isHidden = false
        }
        
    }
}



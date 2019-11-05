//
//  ViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 10/31/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit
import CoreAnimator
import Hero

class ViewController: UIViewController {

    var path: UIBezierPath!
    let animationTime = 0.5
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

    
    @IBOutlet weak var registerLbl: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeScreen()
    }

    private func setupHomeScreen() {
        self.view.backgroundColor = .black
        
        registerLbl.textColor = .orange
        
        signupBtn.backgroundColor = .orange
        signupBtn.setTitleColor(.black, for: .normal)
        signupBtn.setTitleColor(.black, for: .selected)
        signupBtn.layer.cornerRadius = signupBtn.frame.size.height / 2
        signupBtn.addTarget(self, action: #selector(signupBtnAction), for: .touchUpInside)
    }
    
    @objc private func signupBtnAction() {
        print("Button Pressed")
        registerLbl.isHidden = true

        let animator = CoreAnimator(view: signupBtn)
        animator.move(y: -100).make(width: 100, height: 100).make(cornerRadius: Double(self.signupBtn.frame.size.width / 2)).preAnimationBlock {
            self.activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

            self.activityIndicator.center = CGPoint(x: self.signupBtn.frame.size.width / 2, y: self.signupBtn.frame.size.height / 2)
            self.signupBtn.addSubview(self.activityIndicator)
            }.thenAfter(t: animationTime).postAnimationBlock {
                self.activityIndicator.startAnimating()
            self.moveButton()
            }.animate(t: animationTime)
    }
    
    private func moveButton() {
        let animator = CoreAnimator(view: signupBtn)
        animator.move(y: 600).thenAfter(t: animationTime).postAnimationBlock {
            self.openForm()
            }.animate(t: animationTime) {
                self.signupBtn.isHidden = true
        }
    }
    
    private func openForm() {
        activityIndicator.stopAnimating()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let formVC = storyboard.instantiateViewController(withIdentifier: "FormViewController") as! FormViewController
        let navController = UINavigationController(rootViewController: formVC)
        navController.hero.isEnabled = true
        self.present(navController, animated: true){
            self.signupBtn.isHidden = false
            self.registerLbl.isHidden = false
        }
    }
}



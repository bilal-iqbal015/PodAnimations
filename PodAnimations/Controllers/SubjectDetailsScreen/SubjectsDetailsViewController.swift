//
//  SubjectsDetailsViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/12/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit
import  Hero

class SubjectsDetailsViewController: UIViewController {

    var subjectsData: PersonSubjects?
    
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var testLbl: UILabel!
    @IBOutlet weak var assignmentLbl: UILabel!
    @IBOutlet weak var midsLbl: UILabel!
    @IBOutlet weak var finalLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        // Do any additional setup after loading the view.
    }
    

    private func setupScreen() {
        subjectName.text = subjectsData?.name
        testLbl.text = "Test Marks: \n" + String(format: "%.1f", subjectsData?.testMarks ?? 0) + "/100"
        assignmentLbl.text = "Assignment Marks: \n" + String(format: "%.1f", subjectsData?.assignmentMarks ?? 0) + "/100"
        midsLbl.text = "Mid-Term Marks: \n" + String(format: "%.1f", subjectsData?.midMarks ?? 0) + "/100"
        finalLbl.text = "Final Marks: \n" + String(format: "%.1f", subjectsData?.finalMarks ?? 0) + "/100"
        totalLbl.text = "Total Marks: \n" + String(format: "%.1f", subjectsData?.totalMarks() ?? 0) + "%"
        
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(dismissScreen(gr:))))

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
            if ((translation.y + velocity.y) / view.bounds.height) > 0.3  {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    
    
}

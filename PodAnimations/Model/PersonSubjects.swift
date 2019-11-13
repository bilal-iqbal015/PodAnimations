//
//  PersonSubjects.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/11/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import Foundation

class PersonSubjects: NSObject {
    
    var name: String?
    var testMarks: Double?
    var assignmentMarks: Double?
    var midMarks: Double?
    var finalMarks: Double?
    
    init(name: String, testMarks: Double, assignmentMarks: Double, midMarks: Double, finalMarks: Double) {
        self.name = name
        self.testMarks = testMarks
        self.assignmentMarks  = assignmentMarks
        self.midMarks = midMarks
        self.finalMarks = finalMarks
    }
    
    func totalMarks() -> Double {
        let newTestMarks = ((testMarks ?? 0) * 0.2)
        let newAssignmentMarks = ((assignmentMarks ?? 0) * 0.1)
        let newMidMarks = ((midMarks ?? 0) * 0.3)
        let newFinalMarks = ((finalMarks ?? 0) * 0.4)
        
        let total = newTestMarks + newAssignmentMarks + newMidMarks + newFinalMarks
        
        return total
    }
    
}

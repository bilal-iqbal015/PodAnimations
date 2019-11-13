//
//  FlowLayoutViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/7/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class FlowLayoutViewController: UIViewController {
    
    var personSubjectArray = [PersonSubjects]()
    var totalMarksArray = [Double]()

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    private func setupScreen() {
        
        let customLayout: PaginatedCollectionView = PaginatedCollectionView()
        customLayout.itemSize = CGSize(width: 214, height: 164)
        customLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        customLayout.minimumInteritemSpacing = 0
        customLayout.minimumLineSpacing = 0
        customLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        customCollectionView.delegate = self
        customCollectionView.dataSource = self
        customCollectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        customCollectionView.contentInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
        
        let subject1 = PersonSubjects(name: "Maths", testMarks: 75, assignmentMarks: 60, midMarks: 75, finalMarks: 80)
        personSubjectArray.append(subject1)
        
        let subject2 = PersonSubjects(name: "English", testMarks: 80, assignmentMarks: 85, midMarks: 75, finalMarks: 90)
        personSubjectArray.append(subject2)
        
        let subject3 = PersonSubjects(name: "Science", testMarks: 73, assignmentMarks: 64, midMarks: 80, finalMarks: 90)
        personSubjectArray.append(subject3)
        
        let subject4 = PersonSubjects(name: "Urdu", testMarks: 87, assignmentMarks: 88, midMarks: 91, finalMarks: 80)
        personSubjectArray.append(subject4)
        
        cancelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
    }
    
    @objc private func cancelBtnAction() {
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .auto, dismissing: .auto)
        navigationController?.popViewController(animated: true)
    }
    
    private func updateCellsLayout()  {
        
        let centerX = customCollectionView.contentOffset.x + (customCollectionView.frame.size.width)/2
        for cell in customCollectionView.visibleCells {
            
            var offsetX = centerX - cell.center.x
            if offsetX < 0 {
                offsetX *= -1
            }
            cell.transform = CGAffineTransform.identity
            let offsetPercentage = offsetX / (view.bounds.width * 3.0)
            let scaleX = 1-offsetPercentage
            cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
        }
    }
    
    private func subjectsDataScreen(cell: CustomCollectionViewCell, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let subjectsDataVC = storyboard.instantiateViewController(withIdentifier: "SubjectsDetailsViewController") as! SubjectsDetailsViewController
        subjectsDataVC.subjectsData = personSubjectArray[indexPath.item]
        subjectsDataVC.view.hero.id = cell.labelView.hero.id
        cell.labelView.hero.modifiers = [.spring(stiffness: 250, damping: 25)]
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .none
            , dismissing: .none)
        self.navigationController?.pushViewController(subjectsDataVC, animated: true)
    }

}

extension FlowLayoutViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personSubjectArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        let data = personSubjectArray[indexPath.item]
        cell.setupCell(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = collectionView.bounds.size
        
        cellSize.width -= collectionView.contentInset.left * 2
        cellSize.width -= collectionView.contentInset.right * 2
        collectionView.contentInset.top = 8
        collectionView.contentInset.bottom = 8
        
        return cellSize
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCellsLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = customCollectionView.cellForItem(at: indexPath) as? CustomCollectionViewCell{
            cell.labelView.hero.id = "456" + "\(indexPath.item)"
            subjectsDataScreen(cell: cell , indexPath: indexPath)
        }
    }
}

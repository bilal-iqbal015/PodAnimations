//
//  DataViewController.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/1/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit
import Hero

class DataViewController: UIViewController {

    var personsArray = [PersonDataModel]()
    var personData: PersonDataModel?
    
    @IBOutlet weak var dataCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    
    private func setupScreen() {
        personsArray.removeAll()
        self.hero.isEnabled = true
        
        self.view.backgroundColor = .gray
        self.navigationController?.navigationBar.isHidden = true
        
        let person1 = PersonDataModel(name: "Mustafa", email: "mustafa@xyz.com", phoneNo: "123")
        personsArray.append(person1)

        let person2 = PersonDataModel(name: "Taha", email: "taha@xyz.com", phoneNo: "124")
        personsArray.append(person2)

        let person3 = PersonDataModel(name: "Bilal", email: "bilal@xyz.com", phoneNo: "135")
        personsArray.append(person3)

        let person4 = PersonDataModel(name: "Maaz", email: "maaz@xyz.com", phoneNo: "231")
        personsArray.append(person4)

        let person5 = PersonDataModel(name: "Usman", email: "usman@xyz.com", phoneNo: "435")
        personsArray.append(person5)

        let person6 = PersonDataModel(name: "Zohair", email: "zohair@xyz.com", phoneNo: "659")
        personsArray.append(person6)

        
        
        dataCollectionView.backgroundColor = .gray
        dataCollectionView.delegate = self
        dataCollectionView.dataSource = self
    }
    
    private func showDataScreen(cell: DataCollectionViewCell, indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let showDataVC = storyboard.instantiateViewController(withIdentifier: "ShowDataViewController") as! ShowDataViewController
        showDataVC.person = personsArray[indexPath.item]
        cell.hero.modifiers = [.spring(stiffness: 250, damping: 25), .scale(x: UIScreen.main.bounds.size.width, y: UIScreen.main.bounds.size.height, z: 0)]
        navigationController?.hero.navigationAnimationType = .selectBy(presenting: .none
            , dismissing: .none)
        self.navigationController?.pushViewController(showDataVC, animated: true)
    }
}

extension DataViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath) as? DataCollectionViewCell
            else { return UICollectionViewCell() }
        cell.setupCollectionViewCell()
        let data = personsArray[indexPath.item]
        cell.setData(personData: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = dataCollectionView.cellForItem(at: indexPath){
            cell.hero.id = "123"
            showDataScreen(cell: cell as! DataCollectionViewCell, indexPath: indexPath)
        }
    }
}



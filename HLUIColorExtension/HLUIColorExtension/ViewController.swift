//
//  ViewController.swift
//  HLUIColorExtension
//
//  Created by hony on 16/12/7.
//  Copyright © 2016年 hony. All rights reserved.
//

import UIKit

private let kContentCellID = "kContentCellID"

class ViewController: UIViewController {
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(hex: "0xFF26FF")
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kContentCellID)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentCellID, for: indexPath)
        // cell.backgroundColor = UIColor(r: 50, g: 150, b: 200)
        // cell.backgroundColor = UIColor(hex: "0xFC6200")
        cell.backgroundColor = UIColor.randomColor()
        return cell
    }
}

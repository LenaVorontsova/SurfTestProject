//
//  SecondCollectionView.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 12.02.2023.
//

import UIKit

final class SecondCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let vocations = ["IOS", "Android", "Design", "QA", "Flutter",
                     "PM", "Go", "GameDev", "Analytics", "PythonDev"]
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        self.showsHorizontalScrollIndicator = false
        delegate = self
        dataSource = self
        register(GalaryCollectionViewCell.self,
                 forCellWithReuseIdentifier: GalaryCollectionViewCell.collectionCellId)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vocations.count/2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: GalaryCollectionViewCell.collectionCellId,
            for: indexPath) as? GalaryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(text: vocations[indexPath.row % vocations.count])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = vocations[indexPath.row % vocations.count]
        let font = UIFont.systemFont(ofSize: 14, weight: .medium)
        let itemSize = item.size(withAttributes: [.font: font])
        let size = CGSize(
            width: itemSize.width.rounded(.up) + 24 + 24,
            height: itemSize.height.rounded(.up) + 12 + 12
        )
        return size
    }
    
}

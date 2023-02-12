//
//  CarouselViewController.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 11.02.2023.
//

import Foundation
import UIKit

final class CarouselViewController: UIViewController {
    let vocations = ["IOS", "Android", "Design", "QA", "Flutter",
                     "PM", "Go", "GameDev", "Analytics", "PythonDev"]
    private var gallaryCollectionView = GalaryCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        configureConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let indexPath = IndexPath(row: gallaryCollectionView.numberOfItems / 2, section: 0)
        self.gallaryCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
    }
    
    private func configureConstraints() {
        view.addSubview(gallaryCollectionView)
        gallaryCollectionView.snp.makeConstraints {
            $0.bottom.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

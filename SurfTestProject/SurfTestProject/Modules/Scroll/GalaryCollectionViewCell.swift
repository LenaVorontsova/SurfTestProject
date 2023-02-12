//
//  GalaryCollectionViewCell.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 11.02.2023.
//

import Foundation
import UIKit

final class GalaryCollectionViewCell: UICollectionViewCell {
    static let collectionCellId = "GalaryCollectionViewCellId"
    
    lazy var collectionButton: UIButton = {
        let button = UIButton()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContstrains() {
        addSubview(collectionButton)
        collectionButton.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

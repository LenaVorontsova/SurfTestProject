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
        button.backgroundColor = UIColor(red: 243, green: 243, blue: 245, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitle("IOS", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let label: UILabel = {
        #warning("Вынести в константу")
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        let color = UIColor(
            red: 49/255,
            green: 49/255,
            blue: 49/255,
            alpha: 1
        )
        label.textColor = color
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(text: String) {
        label.text = text
    }
    
    private func setupUI() {
        #warning("Вынести в константу")
        let color = UIColor(
            red: 243/255,
            green: 243/255,
            blue: 245/255,
            alpha: 1
        )
        contentView.backgroundColor = color
        contentView.layer.cornerRadius =  12
        contentView.layer.masksToBounds = true
        
        configureContstrains()
    }
    
    private func configureContstrains() {
        contentView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
    }
}

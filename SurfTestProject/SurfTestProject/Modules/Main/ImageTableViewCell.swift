//
//  ImageTableViewCell.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 09.02.2023.
//

import Foundation
import UIKit

final class ImageTableViewCell: UITableViewCell {
    private lazy var imageBack: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "back")
        image.contentMode = .redraw
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(imageBack)
        imageBack.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
           
        }
    }
}

extension ImageTableViewCell: ReusableView {
    static var identifier: String {
        return "ImageTableViewCell"
    }
}

//
//  MainTableViewCell.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 09.02.2023.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

final class MainTableViewCell: UITableViewCell {
    var carouselVC: CarouselViewController
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
//    private lazy var buttonF: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .green
//        button.setTitle("ios", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 15
//        return button
//    }()
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    private lazy var buttonS: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("ios", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    private lazy var buttonT: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("ios", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.carouselVC = CarouselViewController()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
//        self.carouselVC = CarouselViewController()
//        contentView.layer.cornerRadius = 20
//        contentView.clipsToBounds = true
        self.configureConstraints()
    }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(carouselVC.view)
        contentView.addSubview(secondLabel)
        contentView.addSubview(buttonS)
        contentView.addSubview(buttonT)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(descLabel.safeAreaLayoutGuide.snp.top).offset(-12)
        }
        descLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.safeAreaLayoutGuide.snp.bottom).offset(12)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(carouselVC.view.safeAreaLayoutGuide.snp.top).offset(-12)
        }
        carouselVC.view.snp.makeConstraints {
            $0.top.equalTo(descLabel.safeAreaLayoutGuide.snp.bottom).offset(12)
            $0.height.equalTo(44)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(secondLabel.safeAreaLayoutGuide.snp.top).offset(-12)
        }
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(carouselVC.view.safeAreaLayoutGuide.snp.bottom).offset(12)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(buttonS.safeAreaLayoutGuide.snp.top).offset(-12)
        }
        buttonS.snp.makeConstraints {
            $0.top.equalTo(secondLabel.safeAreaLayoutGuide.snp.bottom).offset(12)
            $0.height.equalTo(44)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(buttonT.safeAreaLayoutGuide.snp.top).offset(-12)
        }
        buttonT.snp.makeConstraints {
            $0.top.equalTo(buttonS.safeAreaLayoutGuide.snp.bottom).offset(12)
            $0.height.equalTo(44)
            $0.leading.equalTo(contentView.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.safeAreaLayoutGuide.snp.trailing).offset(-20)
//            $0.bottom.equalTo(secondLabel.safeAreaLayoutGuide.snp.top).offset(-12)
        }
    }
}

extension MainTableViewCell: ReusableView {
    static var identifier: String {
        return "MainTableViewCell"
    }
}

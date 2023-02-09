//
//  MainViewController.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 08.02.2023.
//

import Foundation
import UIKit
import SnapKit

enum Constants {
    static let buttonHeight = 60
    static let buttonL = 136
    static let buttonR = 20
    static let bottomViewTop = 650
    static let labelTrail = 20
    static let labelHeight = 40
}

final class MainViewController: UIViewController {
    private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private var topView: UIView = {
        let view = UIView()
        return view
    }()
    // bottom view's elements
    private var sendRequestButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Отправить заявку", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        return button
    }()
    private var questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    // top view's elements
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    private var imageBackground: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "back")!
        return image
    }()
    
    override func viewDidLoad() {
        configureConstraints()
        super.viewDidLoad()
    }
    
    func configureConstraints() {
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        topView.addSubview(imageBackground)
        bottomView.addSubview(sendRequestButton)
        bottomView.addSubview(questionLabel)
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(Constants.bottomViewTop)
            $0.bottom.equalToSuperview()
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        topView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(self.bottomView.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        imageBackground.snp.makeConstraints {
            $0.top.bottom.trailing.leading.equalToSuperview()
        }
        
        sendRequestButton.snp.makeConstraints {
            $0.height.equalTo(Constants.buttonHeight)
            $0.trailing.equalTo(bottomView.safeAreaLayoutGuide.snp.trailing).offset(-Constants.buttonR)
            $0.leading.equalTo(bottomView.safeAreaLayoutGuide.snp.leading).offset(Constants.buttonL)
            $0.top.equalTo(bottomView.safeAreaLayoutGuide.snp.top).offset(Constants.buttonR)
        }
        questionLabel.snp.makeConstraints {
            $0.trailing.equalTo(sendRequestButton.safeAreaLayoutGuide.snp.leading).offset(-Constants.buttonR)
            $0.top.equalTo(bottomView.safeAreaLayoutGuide.snp.top).offset(Constants.labelHeight)
        }
    }
}

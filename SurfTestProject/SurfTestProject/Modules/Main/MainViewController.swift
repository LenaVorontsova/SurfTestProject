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
        view.backgroundColor = .clear
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
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        return tableView
    }()
    private var imageBackground: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "back")!
        image.contentMode = .redraw
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        configureConstraints()
        self.tableView.register(MainTableViewCell.self,
                                forCellReuseIdentifier: MainTableViewCell.identifier)
        self.tableView.register(ImageTableViewCell.self,
                                forCellReuseIdentifier: ImageTableViewCell.identifier)
        sendRequestButton.addTarget(self, action: #selector(showNotification), for: .touchUpInside)
    }
    
    @objc
    func showNotification() {
        var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
        topWindow?.rootViewController = MainViewController()
        topWindow?.windowLevel = UIWindow.Level.alert + 1
        let alert = UIAlertController(title: "Поздравляем!",
                                      message: "Ваша заявка успешно отправлена!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть",
                                      style: .cancel) { _ in
            topWindow?.isHidden = true
            topWindow = nil
        })
        topWindow?.makeKeyAndVisible()
        topWindow?.rootViewController?.present(alert, animated: false, completion: nil)
    }
    
    func configureConstraints() {
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        bottomView.addSubview(sendRequestButton)
        bottomView.addSubview(questionLabel)
        topView.addSubview(tableView)
        
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
        tableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.top)
            $0.bottom.trailing.leading.equalTo(topView.safeAreaLayoutGuide)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                           for: indexPath) as? ImageTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier,
                                                           for: indexPath) as? MainTableViewCell else {
                return UITableViewCell()
            }
            cell.layer.cornerRadius = 30
            cell.contentView.clipsToBounds = true
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
//         return UITableView.automaticDimension
    }
}

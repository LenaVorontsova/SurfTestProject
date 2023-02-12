//
//  CarouselViewController.swift
//  SurfTestProject
//
//  Created by Lena Vorontsova on 11.02.2023.
//

import Foundation
import UIKit

final class CarouselViewController: UIViewController {
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.IOS.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.Android.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.Design.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button4: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.QA.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button5: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.Flutter.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button6: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.PM.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button7: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.Go.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button8: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.GameDev.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button9: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.Analytics.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    private lazy var button10: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(Vocations.PythonDev.rawValue, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    var buttons: [UIButton]  {
        return [self.button1, self.button2, self.button3, self.button4,
                self.button5, self.button6, self.button7, self.button8,
                self.button9, self.button10]
    }
    private var gallaryCollectionView = GalaryCollectionView()
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        gallaryCollectionView.setCells(cells: buttons)
//        let indexPath = IndexPath(row: gallaryCollectionView.numberOfItems / 2, section: 0)
//        self.gallaryCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        gallaryCollectionView.setCells(cells: buttons)
        let indexPath = IndexPath(row: gallaryCollectionView.numberOfItems / 2, section: 0)
        self.gallaryCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        configureConstraints()
    }
    
    private func configureConstraints() {
        view.addSubview(gallaryCollectionView)
        gallaryCollectionView.snp.makeConstraints {
            $0.bottom.top.trailing.leading.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(44)
//            $0.width.equalTo(200)
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
//            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
//                .offset(20)
//            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
//                .offset(-20)
        }
    }
}

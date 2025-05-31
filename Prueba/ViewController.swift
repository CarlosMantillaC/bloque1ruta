//
//  ViewController.swift
//  Prueba
//
//  Created by Gopenux on 30/05/25.
//

import UIKit

class ViewController: UIViewController {

    
    private let closureLabel1: UILabel = {
        let label1 = UILabel()
        label1.text = "Hello, Worldssssssssssssssssssssssssssssssssssssssssssssssssssssss!"
        label1.numberOfLines = 0
        label1.textColor = .label
        label1.font = .systemFont(ofSize: 30, weight: .bold)
        label1.translatesAutoresizingMaskIntoConstraints = false
        return label1
    }()
    
     private let closureImage1: UIImageView = {
        let image1 = UIImageView()
        image1.image = UIImage(systemName: "sun.max.fill")
        image1.contentMode = .scaleAspectFit
        image1.translatesAutoresizingMaskIntoConstraints = false
        return image1
    }()
    
    private let closureImage2: UIImageView = {
        let image2 = UIImageView()
        image2.image = UIImage(named: "rickandmorty")
        image2.contentMode = .scaleAspectFit
        image2.translatesAutoresizingMaskIntoConstraints = false
        return image2
    }()
    
    private lazy var closureButton1: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "UITableView"
        configuration.titleAlignment = .center
        configuration.buttonSize = .large

        
        let button1 = UIButton(type: .system, primaryAction: UIAction(handler: { _ in self.tableView() }))
        button1.configuration = configuration
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        
        return button1
    }()
    
    private lazy var closureButton2: UIButton = {
        var configuration = UIButton.Configuration.bordered()
        configuration.title = "UICollectionView"
        configuration.titleAlignment = .center
        configuration.buttonSize = .large

        
        let button2 = UIButton(type: .system, primaryAction: UIAction(handler: { _ in self.collectionView() }))
        button2.configuration = configuration
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        return button2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(viewXib))
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        
        [closureLabel1, closureImage1, closureImage2, closureButton1, closureButton2].forEach(contentView.addSubview)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

        ])
        
        
        NSLayoutConstraint.activate([
            closureLabel1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closureLabel1.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 50),
            closureLabel1.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor, constant: 20),
            closureLabel1.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: -20),
                
            closureImage1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closureImage1.topAnchor.constraint(equalTo: closureLabel1.bottomAnchor, constant: 20),
            closureImage1.widthAnchor.constraint(equalToConstant: 80),
            closureImage1.heightAnchor.constraint(equalToConstant: 80),
                
            closureImage2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closureImage2.topAnchor.constraint(equalTo: closureImage1.bottomAnchor, constant: 20),
            closureImage2.widthAnchor.constraint(equalToConstant: 200),
                
            closureButton1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closureButton1.topAnchor.constraint(equalTo: closureImage2.bottomAnchor, constant: 20),

            closureButton2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            closureButton2.topAnchor.constraint(equalTo: closureButton1.bottomAnchor, constant: 20),
            closureButton2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)

        ])
    }

    func tableView() {
        self.present(TableView(), animated: true)
    }
    
    func collectionView() {
        self.present(CollectionView(), animated: true)
    }
    
    @objc
    private func viewXib() {
        self.navigationController?.pushViewController(TableView(), animated: true)
    }

}


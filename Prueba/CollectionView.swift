//
//  CollectionView.swift
//  Prueba
//
//  Created by Gopenux on 31/05/25.
//

import UIKit

struct Device {
    let title: String
    let imageName: String
}

let houseCollectionView = [
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3"),
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv"),
]


class CollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let closureCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 100, height: 100)
        
        let collection1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection1.translatesAutoresizingMaskIntoConstraints = false
        return collection1
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        view.addSubview(closureCollection)
        
        closureCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collection")
        closureCollection.dataSource = self
        closureCollection.delegate = self
        
        NSLayoutConstraint.activate([
            
            closureCollection.topAnchor.constraint(equalTo: view.topAnchor),
            closureCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            closureCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            closureCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        houseCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath)
        
        let model = houseCollectionView[indexPath.row]
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = model.title
        listContentConfiguration.image = UIImage(systemName: model.imageName)
        
        collection.contentConfiguration = listContentConfiguration
        
        return collection
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(houseCollectionView[indexPath.row])
    }

}

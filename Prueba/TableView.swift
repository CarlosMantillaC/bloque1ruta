//
//  ViewController2.swift
//  Prueba
//
//  Created by Gopenux on 31/05/25.
//

import UIKit

let work: [Device] = [
    
    Device(title: "Laptop", imageName: "laptopcomputer"),
    Device(title: "Mac mini", imageName: "macmini"),
    Device(title: "Mac Pro", imageName: "macpro.gen3")
]

let entertainment: [Device] = [
    Device(title: "Pantallas", imageName: "display.2"),
    Device(title: "Apple TV", imageName: "appletv")
    
]

let devices = [work, entertainment, entertainment]

class TableView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    struct Device {
        let title: String
        let imageName: String
    }
    
    let secciones = ["Computadores", "Otros", "sd"]
    
    
    let closureTable1: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(closureTable1)
        
        closureTable1.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        closureTable1.dataSource = self
        closureTable1.delegate = self
        
        NSLayoutConstraint.activate([
            closureTable1.topAnchor.constraint(equalTo: view.topAnchor),
            closureTable1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            closureTable1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            closureTable1.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        secciones.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        secciones[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devices[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let model = devices[indexPath.section][indexPath.row]
        
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = model.title
        listContentConfiguration.image = UIImage(systemName: model.imageName)
        
        cell.contentConfiguration = listContentConfiguration
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = devices[indexPath.section][indexPath.row]
        print("\(model.title)")
    }
}

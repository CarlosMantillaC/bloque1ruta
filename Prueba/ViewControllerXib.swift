//
//  ViewControllerXib.swift
//  Prueba
//
//  Created by Gopenux on 31/05/25.
//

import UIKit

class ViewControllerXib: UIViewController {

    
    @IBAction func irAMain(_ sender: Any) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }



}

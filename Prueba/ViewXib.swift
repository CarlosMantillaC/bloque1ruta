//
//  ViewXib.swift
//  Prueba
//
//  Created by Gopenux on 31/05/25.
//

import UIKit

class ViewXib: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        let nib = UINib(nibName: "ViewXib", bundle: nil)
        guard let viewXib = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("error")
        }
        addSubview(viewXib)
    }
    
    
}

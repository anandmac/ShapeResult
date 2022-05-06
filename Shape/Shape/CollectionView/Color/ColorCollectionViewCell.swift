//
//  ColorCollectionViewCell.swift
//  Shape
//
//  Created by Anand on 5/5/22.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var view: UIView!
    
    func setColor(color: UIColor) {
        view.backgroundColor = color
    }
}

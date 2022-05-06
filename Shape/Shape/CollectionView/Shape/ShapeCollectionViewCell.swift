//
//  ShapeCollectionViewCell.swift
//  Shape
//
//  Created by Anand on 5/5/22.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    
    func setImage(image: UIImage) {
        imageView.image = image
    }
}

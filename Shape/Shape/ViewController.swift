//
//  ViewController.swift
//  Shape
//
//  Created by Anand on 5/5/22.
//

import UIKit

enum Color: String, CaseIterable {
    case red
    case yellow
    case blue
    case green
    case none
}

enum ShapeType: String, CaseIterable {
    case circle
    case triangle
    case star
    case rectangle
    case none
}

enum ResultShape: String {
    case greenCircle
    case yellowSquare
    case yellowRectagle
    case none
}

class ViewController: UIViewController {
    
    @IBOutlet weak var colorCollectionView: ColorCollectionView!
    @IBOutlet weak var shapeCollectionViewCell: ShapeCollectionView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let result = shape(color: selectedColor(), shape: selectedShape()), result != .none else {
            textLabel.text = "Selected \n Color: \(selectedColor().rawValue)" + " Shape: \(selectedShape().rawValue)"
            return
        }
    }
    
    private func shape(color: Color, shape: ShapeType) -> ResultShape? {
        let result: ResultShape? = ResultShape.none
        imageView.isHidden = false
        guard color == .red else {
            imageView.isHidden = true
            return result
        }
        
        guard !greenCircle(shape) else {
            imageView.image = #imageLiteral(resourceName: "greencircle")
            return .greenCircle
        }
        
        guard !yellowSquare(shape) else {
            imageView.image = #imageLiteral(resourceName: "yellowsquare")
            return .yellowSquare
        }
        
        guard !yellowRectagle(shape) else {
            imageView.image = #imageLiteral(resourceName: "yellowrectangle")
            return .yellowRectagle
        }
        
        return result
    }
    
    private func selectedColor() -> Color {
        guard let indexes = colorCollectionView.indexPathsForSelectedItems, let selected = indexes.first?.row else {
            return .none
        }
        return Color.allCases[selected]
    }
    
    private func selectedShape() -> ShapeType {
        guard let indexes = shapeCollectionViewCell.indexPathsForSelectedItems, let selected = indexes.first?.row else {
            return .none
        }
        return ShapeType.allCases[selected]
    }
    
    private func greenCircle(_ shape: ShapeType) -> Bool {
        shape == .rectangle
    }

    private func yellowSquare(_ shape: ShapeType) -> Bool {
        shape == .circle
    }

    private func yellowRectagle(_ shape: ShapeType) -> Bool {
        shape == .triangle
    }
}

//
//  FoodCell.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 07/06/21.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        foodImage.layer.cornerRadius = 20
    }
    
    func configureCell(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        foodImage.loadImage(withUrl: url)
    }
}

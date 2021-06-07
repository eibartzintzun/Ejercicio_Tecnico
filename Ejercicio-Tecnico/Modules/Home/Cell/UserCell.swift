//
//  UserCell.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = 20
    }
    
    func configureCell(imageUrl: String, name: Name, email: String) {
        guard let url = URL(string: imageUrl) else { return }
        let fullName = name.title + " " + name.first + " " + name.last
        
        userImage.loadImage(withUrl: url)
        userName.text = fullName
        userEmail.text = email
    }
}

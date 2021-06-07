//
//  Extensions.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(messageToShow: String) {
        let alert = UIAlertController(title: "Error", message: messageToShow, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIImageView {
    
    func loadImage(withUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

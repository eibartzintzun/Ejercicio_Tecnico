//
//  DetailsView.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import UIKit

class DetailsView: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userCellphone: UILabel!
    @IBOutlet weak var userAge: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var exitButton: UIButton!
    
    lazy var viewModel = DetailsViewModel(apiService: APIService())
    var foodList = [Food]()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        
        viewModel.attachView(view: self)
        viewModel.getFoodList()
    }
    
    func configureViews() {
        foodCollectionView.register(UINib(nibName: "FoodCell", bundle: nil), forCellWithReuseIdentifier: "foodCell")
        
        detailsView.layer.cornerRadius = 20
        scrollView.layer.cornerRadius = 20
        userImage.layer.cornerRadius = 20
        exitButton.layer.cornerRadius = 25
        
        guard let currentUser = user, let url = URL(string: currentUser.picture.large) else { return }
        
        userName.text = currentUser.name.title + " " + currentUser.name.first + " " + currentUser.name.last
        userImage.loadImage(withUrl: url)
        userEmail.text = currentUser.email
        userCellphone.text = currentUser.cell
        userAge.text = "\(currentUser.dob.age)"
        userAddress.text = currentUser.location.street.name + " " + "\(currentUser.location.street.number)" + ", " + currentUser.location.city + ", " + currentUser.location.state
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - CollectionView Delegate & Datasource Methods

extension DetailsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as? FoodCell {
            cell.configureCell(imageUrl: foodList[indexPath.row].image)
            
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - DetailsViewModel Delegate Methods

extension DetailsView: DetailsViewModelDelegate {
    
    func didGetFoodList(foodList: [Food]) {
        self.foodList = foodList
        self.foodCollectionView.reloadData()
    }
    
    func failedGettingUsers(error: String) {
        showErrorAlert(messageToShow: error)
    }
}

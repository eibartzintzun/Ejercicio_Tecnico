//
//  HomeView.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import UIKit

class HomeView: UITableViewController {
    
    lazy var viewModel = HomeViewModel(apiService: APIService())
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.attachView(view: self)
        viewModel.getUsers()
    }
}

// MARK: - TableView Delegate & Datasource Methods

extension HomeView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell {
            cell.configureCell(imageUrl: users[indexPath.row].picture.large, name: users[indexPath.row].name, email: users[indexPath.row].email)
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = DetailsView()
        
        detailsView.modalTransitionStyle = .crossDissolve
        detailsView.modalPresentationStyle = .overCurrentContext
        
        detailsView.user = users[indexPath.row]
        
        self.present(detailsView, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - HomeViewModel Delegate Methods

extension HomeView: HomeViewModelDelegate {
    
    func didGetUsers(users: [User]) {
        self.users = users
        self.tableView.reloadData()
    }
    
    func failedGettingUsers(error: String) {
        showErrorAlert(messageToShow: error)
    }
}

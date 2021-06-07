//
//  HomeViewModel.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didGetUsers(users: [User])
    func failedGettingUsers(error: String)
}

class HomeViewModel {
    weak var homeViewModelDelegate: HomeViewModelDelegate?
    let apiService: APIService?
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func attachView(view: HomeViewModelDelegate) {
        self.homeViewModelDelegate = view
    }
    
    func getUsers() {
        DispatchQueue.main.async {
            self.apiService?.getUsers(completion: { user in
                if let user = user {
                    self.homeViewModelDelegate?.didGetUsers(users: user.results)
                } else {
                    self.homeViewModelDelegate?.failedGettingUsers(error: "Ocurrió un error al consultar el servicio.")
                }
            })
        }
    }
}

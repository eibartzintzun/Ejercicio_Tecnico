//
//  DetailsViewModel.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 07/06/21.
//

import Foundation

protocol DetailsViewModelDelegate: AnyObject {
    func didGetFoodList(foodList: [Food])
    func failedGettingUsers(error: String)
}

class DetailsViewModel {
    weak var detailsViewModelDelegate: DetailsViewModelDelegate?
    let apiService: APIService?
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func attachView(view: DetailsViewModelDelegate) {
        self.detailsViewModelDelegate = view
    }
    
    func getFoodList() {
        DispatchQueue.main.async {
            self.apiService?.getRandomImagesOfFood(completion: { foodList in
                if let foodList = foodList {
                    self.detailsViewModelDelegate?.didGetFoodList(foodList: foodList)
                } else {
                    self.detailsViewModelDelegate?.failedGettingUsers(error: "Ocurrió un error al consultar el servicio.")
                }
            })
        }
    }
}

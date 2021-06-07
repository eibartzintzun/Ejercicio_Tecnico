//
//  APIService.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import Foundation
import Alamofire

class APIService {
    
    func getUsers(completion: @escaping (UserList?) -> ()) {
        let url = URL(string: "https://randomuser.me/api/?results=15")!
        
        AF.request(url).responseDecodable(of: UserList.self) { response in
            switch response.result {
            case .success(let userResponse):
                completion(userResponse)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func getRandomImagesOfFood(completion: @escaping ([Food]?) -> ()) {
        let url = URL(string: "https://foodish-api.herokuapp.com/api/")!
        
        var foodList = [Food]()
        
        for count in 1...8 {
            AF.request(url).responseDecodable(of: Food.self) { response in
                switch response.result {
                case .success(let foodResponse):
                    foodList.append(foodResponse)
                    
                    if count == 8 {
                        completion(foodList)
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
    }
}

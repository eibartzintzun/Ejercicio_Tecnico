//
//  User.swift
//  Ejercicio-Tecnico
//
//  Created by Eibar Tzintzun on 06/06/21.
//

import Foundation

struct UserList: Decodable {
    let results: [User]
}

struct User: Decodable {
    let name: Name
    let picture: Picture
    let email: String
    let cell: String
    let location: Location
    let dob: Birthday
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
}

struct Street: Decodable {
    let name: String
    let number: Int
}

struct Birthday: Decodable {
    let age: Int
}

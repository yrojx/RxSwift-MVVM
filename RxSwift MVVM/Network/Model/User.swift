//
//  User.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let company: Company
}

struct Company: Decodable {
    let name: String
}

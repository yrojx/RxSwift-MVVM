//
//  UserViewModel.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import Foundation

struct UserViewModel {
    private let user: User
    
    var displayText: String {
        return "\(user.name) - \(user.company.name)"
    }
    
    init(user: User) {
        self.user = user
    }
}

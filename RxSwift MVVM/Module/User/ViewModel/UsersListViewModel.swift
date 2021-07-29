//
//  HomeViewModel.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import Foundation
import RxSwift

final class UsersListViewModel {
    let title = "RxSwift MVVM"
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func fetchUserViewModels() -> Observable<[UserViewModel]> {
        userService.fetchUsers().map { $0.map { UserViewModel(user: $0) } }
    }
}

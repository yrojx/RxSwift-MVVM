//
//  AppCoordinator.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = HomeViewController.instantiate(viewModel: UsersListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

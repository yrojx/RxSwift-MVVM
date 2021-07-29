//
//  HomeViewController.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var viewModel: UsersListViewModel!
    
    static func instantiate(viewModel: UsersListViewModel) -> HomeViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        viewController.viewModel = viewModel
        
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "RxSwift"
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        viewModel.fetchUserViewModels().subscribe { event in
            switch event {
                case .next(let users):
                    print(users[0].displayText)
                case .error(let error):
                    print(error)
                case .completed:
                    print("completed")
            }
        }.disposed(by: disposeBag)
        
        viewModel.fetchUserViewModels().bind(to: tableView.rx.items(cellIdentifier: "UserCell", cellType: UserTableViewCell.self)) { row, viewModel, cell in
            cell.userLabel.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
        
    }


}

//
//  UserService.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 27/07/21.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUsers() -> Observable<[User]>
}

class UserService: UserServiceProtocol {
    func fetchUsers() -> Observable<[User]> {
        
        return Observable.create { observer -> Disposable in
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                
                return Disposables.create {
                    
                }
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let users = try decoder.decode([User].self, from: data)
                    observer.onNext(users)
                } catch {
                    observer.onError(error)
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

//
//  Presenter.swift
//  NotesApp
//
//  Created by Melania Dababi on 9/2/24.
//

import Foundation

protocol TaskPresenterInput: AnyObject {
    func viewDidLoad()
    func fetchData()
}

protocol TaskPresenterOutput: AnyObject {
    func updateView(with data: [String: Any])
}

class TaskPresenter: TaskPresenterInput {
    weak var view: TaskPresenterOutput?
    let interactor: TaskInteractorInput
    let router: TaskRouter
    
    
    func viewDidLoad() {
           fetchData()
       }

       func fetchData() {
           interactor.fetchData { [weak self] result in
               self?.fetchData(result: result)
           }
       }

    func fetchData() {
        interactor.getData { data in
            switch data {
            case .success(let todos):
                self.view?.showData(data: todos.todos)
            case .failure(let error):
                print("error fetchData \(error)")
            }
        }
    }
}

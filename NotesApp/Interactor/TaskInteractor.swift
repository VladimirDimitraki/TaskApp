//
//  Interactor.swift
//  NotesApp
//
//  Created by Melania Dababi on 9/2/24.
//

import Foundation

protocol TaskInteractorInput: AnyObject {
    func getData(completion: @escaping (Result<Todos, NetworkError>) -> ())
}

protocol TaskInteractorOutput: AnyObject {
    func didFetchData(result: Result<Todos, NetworkError>)
}

enum NetworkError: String, Error {
    case invalidRequest = "invalid request"
    case invalidUrl = "invalid url"
    case invalidResponse = "invalid response"
}

final class TaskInteractor: TaskInteractorInput {
    weak var output: TaskInteractorOutput?
    
    func getData(completion: @escaping (Result<Todos, NetworkError>) -> ()) {
        guard let url = URL(string: "https://dummyjson.com/todos") else {
            return completion(.failure(.invalidUrl))
        }
        
        var request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return completion(.failure(.invalidRequest))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(Todos.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            }
            catch {
                print("error decoded")
            }
        }
            .resume()
    }
}


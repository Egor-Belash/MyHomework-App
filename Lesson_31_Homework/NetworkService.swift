//
//  NetworkService.swift
//  My Homework App
//
//  Created by Egor on 13.04.2026.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case httpError(statusCode: Int)
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data"
        case .httpError(let statusCode):
            return "HTTP error \(statusCode)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

final class NetworkService {
    // MARK: – Singleton
    static let shared = NetworkService()
    
    // MARK: – Properties
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let session: URLSession
    
    // MARK: – INIT
    private init() {
        let configuration = URLSessionConfiguration.default
        
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        configuration.waitsForConnectivity = true
        
        session = URLSession(configuration: configuration)
    }
    
    // MARK: – GCD
    func fetchUsers(completion: @escaping (Result<[UserModel], NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let httpResponce = response as? HTTPURLResponse else {
                completion(.failure(.noData))
                return
            }
            
            guard (200...299).contains(httpResponce.statusCode) else {
                completion(.failure(.httpError(statusCode: httpResponce.statusCode)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([UserModel].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
        task.resume()
    }
}

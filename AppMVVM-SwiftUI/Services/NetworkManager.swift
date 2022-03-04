//
//  NetworkManager.swift
//  AppMVVM
//
//  Created by Igor on 22.02.2022.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let apiLink = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")!
    
    private init() {}
    
    func fetchCourses(completionHandler: @escaping (Result<[Course], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: apiLink) { data, _, error in
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let courses = try decoder.decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    completionHandler(.success(courses))
                }
                
            } catch {
                completionHandler(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func fetchImage(url: URL) throws -> Data {
        guard let imageData = try? Data(contentsOf: url) else { throw NetworkError.noData }
        return imageData
    }
}

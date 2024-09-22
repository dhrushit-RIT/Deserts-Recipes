//
//  NetworkManager.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 9/16/24.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://themealdb.com/"
    
    private init() {}
    
    func fetchDeserts(completion: @escaping (Result<[Meal], DashboardErrors>) -> Void) {
        let endpoint = baseURL + "api/json/v1/1/filter.php?c=Dessert"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailure))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let mealsResponse = try decoder.decode(MealsResponse.self, from: data)
                completion(.success(mealsResponse.meals.sorted(by: { $0.strMeal < $1.strMeal })))
                
            } catch {
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
}

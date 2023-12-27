//
//  NetworkManager.swift
//  EffectiveMobile-Test
//
//  Created by Александр Горелкин on 25.12.2023.
//

import UIKit


struct NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    
    func fetchHotel(completion: @escaping(Result<HotelModel, Error>) -> Void) {
        request(route: .fetchHotel, completion: completion)
    }
    func fetchNumber(completion: @escaping(Result<RoomsModel, Error>) -> Void) {
        request(route: .fetchNumbers, completion: completion)
    }
    func fetchBooking(completion: @escaping(Result<BookingModel, Error>) -> Void) {
        request(route: .fetchBooking, completion: completion)
    }
    
    private func request<T: Codable>(url: String? = nil, route: Route? = nil, completion: @escaping(Result<T, Error>) -> Void) {
        
        guard let request = createRequest(dataURL: url, route: route) else {
            completion(.failure("Something go wrong" as! Error))
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self.handleResponce(type: T.self, data: data, completion: completion)
                }
            }
        }.resume()
        
    }
    private func handleResponce<T: Codable>(type: T.Type, data: Data, completion: (Result<T, Error>) -> Void) {
        
        guard let response = try? JSONDecoder().decode(type, from: data) else {
            return
        }
        completion(.success(response))
        
        
    }
    private func createRequest(dataURL: String? = nil, route: Route? = nil) -> URLRequest? {
        
        let url = dataURL == nil ? (Route.baseUrl + route!.description) : dataURL
        guard let urlString = URL(string: url!) else { return nil }
        var urlRequest = URLRequest(url: urlString)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "GET"
        
        return urlRequest
    }
    
}

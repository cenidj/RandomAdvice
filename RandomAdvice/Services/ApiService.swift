//
//  ApiService.swift
//  RandomAdvice
//
//  Created by Cesario Nivar on 2/12/24.
//

import Foundation


final class APIService {
    var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func getJSON<T: Decodable>(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate) async throws -> T {
        guard let url = URL(string: self.urlString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, respose) = try await URLSession.shared.data(from: url)
            
            guard let respose = respose as? HTTPURLResponse, respose.statusCode == 200 else {
                throw APIError.badResponse
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = keyDecodingStrategy
            decoder.dateDecodingStrategy = dateDecodingStrategy
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch  {
                throw APIError.corruptData
            }
        } catch {
            throw APIError.dataTaskError
        }
    }
}


enum APIError: Error {
    case invalidURL
    case badResponse
    case corruptData
    case dataTaskError
}




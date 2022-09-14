//
//  APIManager.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import Foundation
import Combine

class APIManager<T> where T: Encodable, T: Decodable {
    let baseURL = URL(string: "https://reqres.in/api/users")!
   
    func post(_ item: T) -> AnyPublisher<T, Error> {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
           let jsonBody = try JSONEncoder().encode(item)
           request.httpBody = jsonBody
       } catch { }
        
       return URLSession.shared.dataTaskPublisher(for: request)
       .tryMap { output in
         guard let response = output.response as? HTTPURLResponse, response.statusCode == 201 else {
             throw APIError.apiError(reason: "File Photos might be large")
         }
         print(response.statusCode)
         return output.data
       }
       .decode(type: T.self, decoder: JSONDecoder())
       .eraseToAnyPublisher()
    }
}

//
//  DevStatus_DataSource.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/7/23.
//

import Foundation

class DevStatus_DataSource {
    
    func getGitHubUser(username: String) async throws -> UserResponse {
   
        
        var gitHubUrl = URL(string: "https://api.github.com/users/" + username)
        
        let request = URLRequest(url: gitHubUrl!)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let fetchedData = try JSONDecoder().decode(UserResponse.self, from: try mapResponse(response: (data,response)))
        
        return fetchedData

        
//        URLSession.shared.dataTask(with: gitHubUrl) { (data, response, error) in
//
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//
//            /// TLDR: ends function if response is nil.
//            /// [guard] allows you to check the condition early in the function's execution
//            /// it [return]s making the code execution to end immediately if condition is not met
//            /// in this case, if response is [nil]
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if (response.statusCode == 200) {
//                guard let data = data else { return }
//
//                DispatchQueue.main.async {
//                    do{
//                        let user = try JSONDecoder().decode(UserResponse.self, from: data)
//                        completion(user)
//                    } catch let error {
//                        print("Error decoding: ", error)
//
//                    }
//                }
//
//            }
//
//        }.resume()
    }
}

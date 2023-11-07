//
//  DevStatus_Repository.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/7/23.
//

import Foundation

class DevStatusRepository {
    
    func getGitHubUser(username: String) async -> Result<UserResponse>{
        do{
           let result = try await DevStatus_DataSource().getGitHubUser(username: username)
            return Result.success(result)
        } catch  {
            let errorMessage = error.localizedDescription
            print("Error: \(error)")
            return Result.failure(errorMessage, nil)
        }
    }
}

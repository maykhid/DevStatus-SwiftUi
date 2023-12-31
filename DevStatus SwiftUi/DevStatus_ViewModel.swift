//
//  DevStatus_ViewModel.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/7/23.
//
import SwiftUI

class DevStatusViewModel : ObservableObject {
    @Published var user: UserResponse?
    @Published var loadingState: Bool = false
    @Published var errorMessage: String?
    
    func clearState() {
        user = nil
        loadingState = false
        errorMessage = nil

        objectWillChange.send()
    }
    
    func getGitHubUser(username: String) async -> Void {
        
        loadingState = true
        
        let response =  await DevStatusRepository().getGitHubUser(username: username)
        
        loadingState = false
        
        if (response.isSuccess) {
            user = response.data
        } else {
            errorMessage = response.errorMessage!
        }
    }
}

//
//  UserResponse.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/7/23.
//

import Foundation

struct UserResponse: Codable, Identifiable {
    let id: Int
    let login: String
    let  node_id: String
    let  avatar_url: String
    let  name: String
    let  blog: String
    let  location: String
    let  bio: String
    let  public_repos: Int
    let  followers: Int
    let following: Int
    let  created_at: String
}

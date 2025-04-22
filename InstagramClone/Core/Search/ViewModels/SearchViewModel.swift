//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 22/04/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init (){
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUser()
    }
}

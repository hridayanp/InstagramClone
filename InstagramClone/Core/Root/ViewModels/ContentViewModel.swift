//
//  ContentViewModel.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 21/04/25.
//

import Foundation
import FirebaseAuth
import Combine


class ContentViewModel: ObservableObject {
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init () {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession
            .sink { [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables)
            
    }
    
}

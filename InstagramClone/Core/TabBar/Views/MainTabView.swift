//
//  MainTabView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            FeedView()
                .onAppear {
                    selectedTabIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .onAppear {
                    selectedTabIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            UploadPostView(tabIndex: $selectedTabIndex)
                .onAppear {
                    selectedTabIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            Text("Notifications")
                .onAppear {
                    selectedTabIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }
                .tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear {
                    selectedTabIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
        .accentColor(.black)
    }
}

struct MainTableView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user:  User.MOCK_USERS[0])
    }
}

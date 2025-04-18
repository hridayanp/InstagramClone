//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
   
    
     var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
    }
    

    
    var body: some View {
        ScrollView {
            //Header
            ProfileHeaderView(user: user)
            
            
            //Post grid view
            PostsGridView(posts: posts)
           
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {

        ProfileView(user: User.MOCK_USERS[0])
    }
}

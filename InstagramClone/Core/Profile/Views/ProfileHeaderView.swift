//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false
    
    var body: some View {
        
        VStack(spacing: 10){
            //stats & pic
            HStack {
                
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                
                HStack(spacing: 8) {
                    UserStackView(value: 3, label: "Posts")
                    UserStackView(value: 3, label: "Followers")
                    UserStackView(value: 3, label: "Following")
                }
                .padding(.horizontal)
            }
            
            //name & bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text(user.username)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //cta
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
                else {
                    print("SHOW FOLLOW")
                }
                
            } label: {
                Text(user.isCurrentUser ? "Edit Profile": "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 2)
                    }
            }
            
            
            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            Text("EDIT PROFILE VIEW")
        }
        
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}

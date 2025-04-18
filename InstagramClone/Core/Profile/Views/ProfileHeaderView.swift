//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    
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
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            //cta
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 2)
                    }
            }
            
            
            Divider()
            
        }
        
    }
}



struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}

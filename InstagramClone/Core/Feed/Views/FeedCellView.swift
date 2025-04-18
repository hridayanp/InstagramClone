//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct FeedCellView: View {
    
    let post: Post
    var body: some View {
        VStack {
            //img + username
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            //post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            
            //action btns
            HStack(spacing: 16){
                Button {
                    print("Like")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("Comment")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
                
            }
            .padding(.leading, 8)
            .foregroundColor(.black)
            
            //like labels
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.leading, 10)
                .padding(.top, 1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //caption labels
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption).foregroundColor(.secondary)
                Spacer()
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6H ago")
                .font(.footnote)
                .padding(.leading, 10)
                .padding(.top, 1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCellView(post: Post.MOCK_POSTS[0])
    }
}

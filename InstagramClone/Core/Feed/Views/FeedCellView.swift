//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct FeedCellView: View {
    var body: some View {
        VStack {
            //img + username
            HStack {
                Image("image-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                
                Text("TEXT")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 8)
            
            //post image
            Image("image-1")
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
            Text("23 Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.leading, 10)
                .padding(.top, 1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //caption labels
            HStack {
                Text("TEST").fontWeight(.semibold) +
                Text(" @test").foregroundColor(.secondary)
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

#Preview {
    FeedCellView()
}

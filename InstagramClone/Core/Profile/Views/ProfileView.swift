//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                //Header
                VStack(spacing: 10){
                    //stats & pic
                    HStack {
                        
                        Image("image-1")
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
                        Text("NAME")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        
                        Text("Bio")
                            .font(.footnote)
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
                
                
                //Post grid view
                LazyVGrid(columns: gridItems, spacing: 2) {
                    ForEach(0...5, id: \.self) { index in
                        Image("image-1")
                            .resizable()
                            .scaledToFit()
                    }
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
        }
    }
}

#Preview {
    ProfileView()
}

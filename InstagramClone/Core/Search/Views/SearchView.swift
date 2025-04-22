//
//  SearchView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//
import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 14) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                if let imageUrl = user.profileImageUrl, !imageUrl.isEmpty {
                                    AsyncImage(url: URL(string: imageUrl)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                } else {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.gray)
                                }
                                
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                    
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                    
                }
            }
            .padding(.top, 8)
            .searchable(text: $searchText, prompt: "Search..")
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
        }
       
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

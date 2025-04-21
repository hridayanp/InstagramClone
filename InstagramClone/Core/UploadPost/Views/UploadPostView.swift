//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 21/04/25.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var imagePickerPresented: Bool = false
    @StateObject var viewModel = UploadPostViewModel()
    
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            
            //action toolbar
            HStack {
                
                Button {
                    print("Cancel")
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()

                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                }

                
            }
            .padding(.horizontal)
            
            //post img & caption
            HStack(spacing: 8) {
                
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                    
                
                TextField("Caption...", text: $caption, axis: .vertical)
                
            }
            .padding()
            
            Spacer()
            
            
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}

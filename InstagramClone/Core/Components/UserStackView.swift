//
//  UserStackView.swift
//  InstagramClone
//
//  Created by Hridayan Phukan on 18/04/25.
//

import SwiftUI

struct UserStackView: View {
    
    let value: Int
    let label: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            
            Text(label)
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

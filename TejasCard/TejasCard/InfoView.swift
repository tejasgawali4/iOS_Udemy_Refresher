//
//  InfoView.swift
//  TejasCard
//
//  Created by Tejas Gawali on 10/03/21.
//

import SwiftUI

struct InfoView: View {
    
    let text : String
    let imageName : String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height:50)
            .overlay(HStack {
                Image(systemName: imageName ).foregroundColor(.green)
                Text(text)
            })
            .padding(.all)
    }
}

struct InfoView_Previews : PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill").previewLayout(.sizeThatFits)
    }
}

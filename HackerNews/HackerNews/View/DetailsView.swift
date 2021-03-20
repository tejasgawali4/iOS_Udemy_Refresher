//
//  DetailsView.swift
//  HackerNews
//
//  Created by Tejas Gawali on 11/03/21.
//

import SwiftUI

struct DetailsView : View {
     
    let url : String?
    
    var body : some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com/")
    }
}

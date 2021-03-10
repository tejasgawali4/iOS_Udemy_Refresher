//
//  ContentView.swift
//  DiceeSwiftUI
//
//  Created by Tejas Gawali on 10/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceeNo = 1
    @State var rightDiceeNo = 1
    
    var body: some View {
        ZStack {
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("DiceeLogo")
                HStack {
                    DiceView(n: leftDiceeNo)
                    DiceView(n: rightDiceeNo)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    
                    self.leftDiceeNo = Int.random(in: 1...6)
                    self.rightDiceeNo = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct DiceView: View {
    
    let n : Int
    
    var body: some View {
        Image("Dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



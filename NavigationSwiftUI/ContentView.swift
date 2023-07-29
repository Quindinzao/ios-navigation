//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by João Victor Fernandes on 28/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Screen(
//                title: "Home",
                text: "HOME SCREEN",
                imageName: "house",
                color: .orange)
        }
    }
}

struct Screen: View {
//    let title: String
    let text: String
    let imageName: String
    let color: Color

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64, alignment: .center)
                .padding(2)
            Text(text)
                .font(.system(size: 22, weight: .bold, design: .monospaced))
            NavigationLink {
                Screen(
//                    title: "Notification",
                    text: "NOTIFICATION SCREEN",
                    imageName: "bell",
                    color: .green)
            } label: {
                ContinueButton(color: color)
            }

        }
//        .navigationTitle(title)
    }
}

struct ContinueButton: View {
    let color: Color
    var body: some View {
        Text("Continue")
            .frame(maxWidth: .infinity - 24)
            .frame(height: 54, alignment: .center)
            .font(.system(size: 18, weight: .light, design: .monospaced))
            .foregroundColor(.black)
            .background(color)
            .cornerRadius(8)
            .padding(12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

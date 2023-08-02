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
                backgroundColorButton: .orange)
        }
    }
}

struct Screen: View {
//    let title: String
    let text: String
    let imageName: String
    let backgroundColorButton: Color
    
    @State var alertIsPresented: Bool = false
    @State var isChangeButtonColor: Bool = false

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: 64,
                    height: 64,
                    alignment: .center)
                .padding(2)
            Text(text)
                .font(
                    .system(
                        size: 22,
                        weight: .bold,
                        design: .monospaced))
            NavigationLink {
                Screen(
//                    title: "Notification",
                    text: "NOTIFICATION SCREEN",
                    imageName: "bell",
                    backgroundColorButton: .green)
            } label: {
                NextScreenButton(
                    textButton: "Next screen",
                    backgroundColor: backgroundColorButton,
                    foregroundColor: .black)
            }
            
            AlertButton(
                titleAlert: text,
                textAlert: "Choice button background color",
//                dismissAlert: "OK",
                isButtonPressed: $alertIsPresented,
                isChangeButtonColor: $isChangeButtonColor)
        }
//        .navigationBarBackButtonHidden(true)
//        .navigationTitle(title)
    }
}

struct NextScreenButton: View {
    let textButton: String
    let backgroundColor: Color
    let foregroundColor: Color

    var body: some View {
        Text(textButton)
            .frame(
                width: UIScreen.main.bounds.width * 0.95,
                height: 54,
                alignment: .center)
            .font(
                .system(
                    size: 18,
                    weight: .medium,
                    design: .monospaced))
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(8)
            .padding(2)
    }
}

struct AlertButton: View {
    let titleAlert: String
    let textAlert: String
//    let dismissAlert: String
    @Binding var isButtonPressed: Bool
    @Binding var isChangeButtonColor: Bool

    var body: some View {
        Button(action: {
            self.isButtonPressed.toggle()
        }, label: {
            Text("Show alert")
                .frame(width: UIScreen.main.bounds.width * 0.95)
        })
            .frame(
                width: UIScreen.main.bounds.width * 0.95,
                height: 54,
                alignment: .center)
            .font(
                .system(
                    size: 18,
                    weight: .medium,
                    design: .monospaced))
            .foregroundColor(.white)
            .background(isChangeButtonColor ? .brown : .purple)
            .cornerRadius(8)
            .padding(2)
            .alert(
                isPresented: $isButtonPressed,
                content: {
                    Alert(
                        title: Text(titleAlert),
                        message: Text(textAlert),
                        primaryButton: .default(Text("Purple"), action: {
                            self.isChangeButtonColor = false
                        }),
                        secondaryButton: .cancel(Text("Brown"), action: {
                            self.isChangeButtonColor = true
                        })
                    )
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

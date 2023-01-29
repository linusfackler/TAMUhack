//
//  PrimaryViews.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI

struct VitalsPromptView: View {
    @State var image: String
    @State var titleText: String
    @State var subText: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: Size.Spacing.Vertical.textSpace) {
                Spacer()
                
                Image(image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.49, height: UIScreen.main.bounds.width * 0.49)
                    .aspectRatio(contentMode: .fit)
                Text(titleText)
                    .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
                Text(subText)
                    .font(Font.custom("Gilroy-Regular", size: Size.Font.Button.subTitleSize))
                
                Spacer()
                
                VStack(spacing: Size.Spacing.Vertical.buttonSpace) {
                    NavigationLink {
                        VitalsTestView()
                    } label: {
                        ButtonView(type: .primaryStrong, text: "Start")
                    }

                    ButtonView(type: .secondaryWeak, text: "Cancel")
                        .onTapGesture {
                            print("Back to home screen")
                        }
                }
            }
        }
    }
}

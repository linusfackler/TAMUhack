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
                        DiagnosisView(diagnosis: "pos")
                    } label: {
                        ButtonView(type: .primaryStrong, text: "Start")
                    }

                    ButtonView(type: .secondaryWeak, text: "Skip")
                        .onTapGesture {
                            print("Back to home screen")
                        }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct CoughPromptView: View {
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
                        CoughTestView()
                    } label: {
                        ButtonView(type: .primaryStrong, text: "Start")
                    }

                    ButtonView(type: .secondaryWeak, text: "Cancel")
                        .onTapGesture {
                            print("Back to home screen")
                        }
                }
            }
        }.navigationBarHidden(true)
    }
}

struct TitleTextsView: View {
    @State var focusText: String
    @State var trailText: String
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Size.Spacing.Vertical.textSpace) {
                Text(focusText)
                    .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
                    .foregroundColor(.white)
                Text(trailText)
                    .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
                    .foregroundColor(.white.opacity(0.6))
            }
            Spacer()
        }
    }
}

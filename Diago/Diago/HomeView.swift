//
//  HomeView.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
//            HStack {
//                Image("LuraLogo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: UIScreen.main.bounds.width*0.24)
//                Spacer()
//            }.padding(.leading)
//            HStack {
//                VStack(alignment: .leading, spacing: Size.Spacing.Vertical.textSpace) {
//                    Text("Welcome back,")
//                        .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
//                        .foregroundColor(.black)
//                    Text("Cesar")
//                        .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
//                        .foregroundColor(.black.opacity(0.6))
//                }
//                Spacer()
//            }.padding(.leading)
//
//            ZStack {
//                Rectangle()
//                    .frame(width: UIScreen.main.bounds.width*0.92, height: UIScreen.main.bounds.width*0.3)
//                    .foregroundColor(Color.ui.primary)
//                    .cornerRadius(CornerRadius.Button.radius*1.6)
//                HStack {
//                    Spacer()
//                }
//            }
            
            Spacer()
            CoughPromptView(image: "VocalTest", titleText: "Respiratory Test", subText: "Record yourself coughing for a proper diagnosis.")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

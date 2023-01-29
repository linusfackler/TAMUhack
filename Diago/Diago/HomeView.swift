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
//            VitalsPromptView(image: "VitalTest", titleText: "Vital Signs Test", subText: "Sit tight and breathe normally for 15 seconds.")
//                .padding(.bottom, Size.Spacing.Vertical.textSpace)
            CoughTestView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    
}

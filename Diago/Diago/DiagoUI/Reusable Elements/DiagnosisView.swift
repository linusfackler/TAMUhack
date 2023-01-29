//
//  DiagnosisView.swift
//  Diago
//
//  Created by Cesar Gamez on 1/29/23.
//

import SwiftUI

struct DiagnosisView: View {
    @State var diagnosis: String
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            diagnosis == "pos" ?  Color.ui.positive : Color.ui.primary
            VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                    BackNavButton()
                        .padding(.top, UIScreen.main.bounds.width*0.15)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    TitleTextsView(focusText: "AI Diagnosis", trailText: "Finalized results")
                    Spacer()
                    TitleTextsView(focusText: "AI COVID Consultation", trailText: "Type")
                    Divider()
                    TitleTextsView(focusText: "\(Date.now.formatted(.dateTime))", trailText: "Date")
                    Divider()
                    TitleTextsView(focusText: diagnosis == "pos" ?  "Positive" : "Negative", trailText: "Result")
                }.padding()
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

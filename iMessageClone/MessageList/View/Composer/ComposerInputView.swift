//
//  ComposerInputView.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 31.10.2023.
//

import SwiftUI

struct ComposerInputView: View {
    
    @Binding var input:String
    var send:(String) -> Void
    
    @State private var showNotImplentedAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            TextField("iMessage",text: $input)
                .multilineTextAlignment(.leading)
                .lineLimit(0)
                .padding(.leading,12)
            
            if  !input.isEmpty{
                Button{
                    send(input)
                    
                    input = ""
                }label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.blue)
                        .font(.body.weight(.semibold))
                }
            } else{
                Button {
                    showNotImplentedAlert = true
                } label: {
                    Image(systemName: "waveform.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.secondary)
                }
                .alert("This is not implemented yer", isPresented: $showNotImplentedAlert){
                    Button("OK", role: .cancel){}
                }
            }
        }
        .padding( 4)
        .overlay(Capsule()
            .stroke(.tertiary,lineWidth: 1)
            .opacity(0.7)
        )
        .padding(.trailing,8)
    }
}

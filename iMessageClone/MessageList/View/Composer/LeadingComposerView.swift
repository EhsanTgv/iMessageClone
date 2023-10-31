//
//  LeadingComposerView.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 23.10.2023.
//

import SwiftUI
import StreamChatSwiftUI

struct LeadingComposerView: View {
    
    @Binding var pickerTypeState:PickerTypeState
    
    var body: some View {
        switch pickerTypeState {
        case .expanded(let attachmentPickerType):
            switch attachmentPickerType{
                case .none:
                HStack(spacing:16){
                    Button{
                        withAnimation{
                            pickerTypeState = .expanded(.media)
                        }
                    }label: {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height:22)
                            .foregroundColor(.gray)
                    }
                    
                    Button{
                        withAnimation{
                            pickerTypeState = .expanded(.none)
                        }
                    } label: {
                        Image("store")
                            .resizable()
                            .scaledToFit()
                            .frame(height:24)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal,8)
                .frame(maxHeight:32)
            case .media, .instantCommands, .custom:
                closeButton()
            }
        case .collapsed:
            closeButton()
        }
    }
    
    @ViewBuilder func closeButton() -> some View{
        VStack{
            Spacer()
            
            Button {
                withAnimation{
                    pickerTypeState = .expanded(.none)
                }
            }label: {
                Image(systemName: "mark.circle")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 20,height: 20,alignment: .center)
            }
            
            Spacer()
        }
        .frame()
    }
}

#Preview {
    LeadingComposerView(pickerTypeState: <#Binding<PickerTypeState>#>)
}

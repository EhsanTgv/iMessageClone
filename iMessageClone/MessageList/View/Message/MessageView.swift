//
//  MessageView.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 5.10.2023.
//

import SwiftUI

struct MessageView: View {
    var message:String
    var isCurrentUser:Bool
    var isFirst: Bool
    
    var body: some View {
        Text(message)
            .foregroundColor(isCurrentUser ? .white : .primary)
            .padding(.horizontal)
            .padding(.vertical,8)
            .background(isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground),
                        in: RoundedRectangle(cornerRadius: 20,style: .continuous))
            .background(
                alignment: isCurrentUser ? .bottomTrailing : .bottomLeading
            ){
                isFirst ? Image(isCurrentUser ? "outgoingTail" : "incomingTail")
                    .renderingMode(.template)
                    .foregroundStyle(isCurrentUser ? .blue : Color(uiColor: .secondarySystemBackground))
                : nil
            }
    }
}

#Preview {
    MessageView(message:"test",isCurrentUser:true,isFirst:true)
}

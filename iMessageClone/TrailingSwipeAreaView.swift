//
//  TrailingSwipeAreaView.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 8.05.2023.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct TrailingSwipeAreaView: View {
    
    var channel: ChatChannel
    var buttonWidth: CGFloat
    @Binding var swipedChannelId: String?
    var leftButtonTapped: (ChatChannel) -> Void
    var rightButtonTapped: (ChatChannel) -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            
            ActionItemButton(imageName: "bell.fill") {
                leftButtonTapped(channel)
            }
                .frame(width: buttonWidth)
                .foregroundColor(.white)
                .background(Color.indigo)
            
            ActionItemButton(imageName: "trash.fill") {
                rightButtonTapped(channel)
            }
                .frame(width: buttonWidth)
                .foregroundColor(.white)
                .background(Color.red)
        }
    }
}

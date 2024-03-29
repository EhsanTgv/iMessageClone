//
//  iMessageChannelListItem.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 5.05.2023.
//

import SwiftUI
import StreamChat
import StreamChatSwiftUI

struct iMessageChannelListItem: View {
    
    let channel: ChatChannel
    let channelName: String
    let avatar: UIImage
    let channelDestination: (ChannelSelectionInfo) -> ChatChannelView<iMessageViewFactory>
    @Binding var selectedChannel: ChannelSelectionInfo?
    let onItemTap: (ChatChannel) -> Void

    var body: some View {
        ZStack {
            iMessageChannelListItemView(
                channelName: channelName,
                avatar: avatar,
                lastMessageAt: channel.lastMessageAt ?? Date(),
                hasUnreadMessages: channel.unreadCount.messages > 0,
                lastMessage: channel.latestMessages.first?.text ?? "No messages",
                isMuted: channel.isMuted
            )
                .padding(.trailing)
                .onTapGesture {
                    onItemTap(channel)
                }
            
            NavigationLink(tag: channel.channelSelectionInfo, selection: $selectedChannel) {
                channelDestination(channel.channelSelectionInfo)
            } label: {
                EmptyView()
            }
        }
    }
}

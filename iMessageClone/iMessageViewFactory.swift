//
//  iMessageViewFactory.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 3.05.2023.
//

import Foundation
import SwiftUI
import StreamChatSwiftUI
import StreamChat

class iMessageViewFactory: ViewFactory {
    
    @Injected(\.chatClient) var chatClient: ChatClient
    
    func makeChannelListHeaderViewModifier(title: String) -> iMessageChannelListHeaderModifier {
        iMessageChannelListHeaderModifier(title: "Messages")
    }
    
    func makeChannelListItem(
        channel: ChatChannel,
        channelName: String,
        avatar: UIImage,
        onlineIndicatorShown: Bool,
        disabled: Bool,
        selectedChannel: Binding<ChannelSelectionInfo?>,
        swipedChannelId: Binding<String?>,
        channelDestination: @escaping (ChannelSelectionInfo) -> ChatChannelView<iMessageViewFactory>,
        onItemTap: @escaping (ChatChannel) -> Void,
        trailingSwipeRightButtonTapped: @escaping (ChatChannel) -> Void,
        trailingSwipeLeftButtonTapped: @escaping (ChatChannel) -> Void,
        leadingSwipeButtonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
       let listItem = iMessageChannelListItem(
            channel: channel,
            channelName: channelName,
            avatar: avatar,
            channelDestination: channelDestination,
            onItemTap: onItemTap,
            selectedChannel: selectedChannel
        )
        
        return ChatChannelSwipeableListItem<iMessageViewFactory,iMessageChannelListItem>(
            factory: self,
            channelListItem: listItem,
            swipedChannelId: swipedChannelId,
            channel: channel,
            trailingRightButtonTapped: trailingSwipeRightButtonTapped,
            trailingLeftButtonTapped: trailingSwipeLeftButtonTapped,
            leadingSwipeButtonTapped: leadingSwipeButtonTapped
        )
    }
    
    func makeLeadingSwipeActionsView(
        channel: ChatChannel,
        offsetX: CGFloat,
        buttonWidth: CGFloat,
        swipedChannelId: Binding<String?>,
        buttonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        LeadingSwipeAreaView(
            channel: channel,
            buttonWidth: buttonWidth,
            swipedChannelId: swipedChannelId,
            buttonTapped: buttonTapped
        )
    }
    
    func makeTrailingSwipeActionsView(
        channel: ChatChannel,
        offsetX: CGFloat,
        buttonWidth: CGFloat,
        swipedChannelId: Binding<String?>,
        leftButtonTapped: @escaping (ChatChannel) -> Void,
        rightButtonTapped: @escaping (ChatChannel) -> Void
    ) -> some View {
        TrailingSwipeAreaView(
            channel: channel,
            buttonWidth: buttonWidth,
            swipedChannelId: swipedChannelId,
            leftButtonTapped: leftButtonTapped,
            rightButtonTapped: rightButtonTapped
        )
    }
}

//
//  ContentView.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 2.05.2023.
//

import SwiftUI
import StreamChatSwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = iMessageChannelListViewModel()
    @StateObject var channelHeaderLeader = ChannelHeaderLoader()
    var viewFactory: iMessageViewFactory
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.pinnedChannels.count > 0 {
                    PinnedChannelsView(viewModel: viewModel, channelHeaderLoader: channelHeaderLeader, factory: viewFactory)
                }
                ChannelList(
                    factory: viewFactory,
                    channels: viewModel.channels,
                    selectedChannel: $viewModel.selectedChannel,
                    swipedChannelId: $viewModel.swipedChannelId,
                    scrollable: false,
                    onlineIndicatorShown: viewModel.onlineIndicatorShown(for:),
                    imageLoader: channelHeaderLeader.image(for:),
                    onItemTap: { channel in
                        viewModel.selectedChannel = channel.channelSelectionInfo
                    },
                    onItemAppear: viewModel.checkForChannels(index:),
                    channelNaming: viewModel.name(forChannel:),
                    channelDestination: viewFactory.makeChannelDestination(),
                    trailingSwipeRightButtonTapped: viewModel.onDeleteTapped(channel:),
                    trailingSwipeLeftButtonTapped: viewModel.muteTapped(_:),
                    leadingSwipeButtonTapped: viewModel.pinChannelTapped(_:)
                )
                .alert(isPresented: $viewModel.alertShown) {
                    switch viewModel.channelAlertType {
                    case let .deleteChannel(channel):
                        return Alert(
                            title: Text("Delete channel"),
                            message: Text("Are you sure you want to delete this channel?"),
                            primaryButton: .destructive(Text("Delete")) {
                                viewModel.delete(channel: channel)
                            },
                            secondaryButton: .cancel()
                        )
                    default:
                        return Alert.defaultErrorAlert
                    }
                }
                .navigationTitle("Message")
                .toolbar {
                    iMessageChannelListHeader()
                }
            }
        }
    }
}

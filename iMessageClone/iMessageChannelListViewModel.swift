//
//  iMessageChannelListViewModel.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 9.05.2023.
//

import Foundation
import StreamChat
import StreamChatSwiftUI

class iMessageChannelListViewModel: ChatChannelListViewModel {
    
    @Injected(\.chatClient) var chatClient
    
    func muteTapped(_ channel: ChatChannel) {
        let controller = chatClient.channelController(for: channel.cid)
        
        if channel.isMuted {
            controller.unmuteChannel { error in
                if let error = error {
                    print("Error occurred: \(error.localizedDescription)")
                } else {
                    print("Successfully unmuted channel")
                }
            }
        } else {
            controller.muteChannel { error in
                if let error = error {
                    print("Error occurred: \(error.localizedDescription)")
                } else {
                    print("Successfully muted channel")
                }
            }
        }
    }
}

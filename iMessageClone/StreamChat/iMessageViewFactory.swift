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
    
    var channelId: ChannelId?
}

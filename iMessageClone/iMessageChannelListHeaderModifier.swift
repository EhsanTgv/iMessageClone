//
//  iMessageChannelListHeaderModifier.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 5.05.2023.
//

import SwiftUI
import StreamChatSwiftUI

struct iMessageChannelListHeaderModifier: ChannelListHeaderViewModifier {
    
    var title: String
    
    func body(content: Content) -> some View {
        content.toolbar {
            iMessageChannelListHeader(title: title)
        }
    }
}

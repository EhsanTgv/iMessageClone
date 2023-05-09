//
//  iMessageCloneApp.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 2.05.2023.
//

import SwiftUI
import StreamChatSwiftUI

@main
struct iMessageCloneApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewFactory: iMessageViewFactory())
        }
    }
}

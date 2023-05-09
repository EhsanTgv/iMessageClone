//
//  iMessageChannelListHeader.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 5.05.2023.
//

import SwiftUI

struct iMessageChannelListHeader: ToolbarContent {
        
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading){
            Button {
                
            } label: {
                Text("Edit")
            }
        }
        
        ToolbarItem(placement: .navigationBarTrailing){
            Button{
                
            }label: {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}

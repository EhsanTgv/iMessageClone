//
//  iMessageChannelListHeader.swift
//  iMessageClone
//
//  Created by Ehsan Taghavi on 5.05.2023.
//

import SwiftUI

struct iMessageChannelListHeader: ToolbarContent {
    
    var title: String
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading){
            Button {
                
            } label: {
                Text("Edit")
            }
        }
        ToolbarItem(placement: .principal) {
            Text(title).bold()
        }
        ToolbarItem(placement: .navigationBarTrailing){
            Button{
                
            }label: {
                Image(systemName: "square.and.pencil")
            }
        }
    }
}

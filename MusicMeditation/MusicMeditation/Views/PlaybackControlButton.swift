//
//  PlaybackControlButton.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

struct PlaybackControlButton: View {
    //MARK: - Variables
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
     
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }

    }
}

struct PlaybackControllButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControlButton(action: { })
    }
}

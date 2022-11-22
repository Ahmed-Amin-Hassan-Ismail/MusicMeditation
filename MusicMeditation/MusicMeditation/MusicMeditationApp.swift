//
//  MusicMeditationApp.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

@main
struct MusicMeditationApp: App {
    @StateObject var audioManager = AudioManager()
    
    var body: some Scene {
        WindowGroup {
            MeditationView()
                .environmentObject(audioManager)
        }
    }
}

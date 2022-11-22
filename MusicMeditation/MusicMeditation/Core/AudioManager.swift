//
//  AudioManager.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    
    //MARK: - Variables
        
    private var player: AVAudioPlayer?
    
    //MARK: - Methods
    func startPlayer(trackName: String, withExtension: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: trackName, withExtension: withExtension) else {
            print("Resource not found", trackName)
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.player = try AVAudioPlayer(contentsOf: url)
            
            if isPreview {
                self.player?.prepareToPlay()
            } else {
                self.player?.play()
            }
            
        } catch {
            print("failed to initialize player", error)
        }
    }
    
    
}

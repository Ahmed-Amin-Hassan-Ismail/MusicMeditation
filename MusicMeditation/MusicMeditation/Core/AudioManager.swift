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
    @Published private(set) var player: AVAudioPlayer?
    @Published private(set) var isPlayer: Bool = false
    @Published private(set) var isLooping: Bool = false
    
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
                self.isPlayer = true
            }
            
        } catch {
            print("failed to initialize player", error)
        }
    }
    
    func playPause() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.pause()
            self.isPlayer = false
        } else {
            player.play()
            self.isPlayer = true
        }
    }
    
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlayer = false
        }
    }
    
    func forwardTenSeconds() {
        guard let player = player else { return }
        
        player.currentTime += 10
    }
    
    func backwardTenSeconds() {
        guard let player = player else { return }
        
        player.currentTime -= 10
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        
        player.numberOfLoops = (player.numberOfLoops == 0) ? -1 : 0
        isLooping = player.numberOfLoops != 0
    }
}

//
//  AudioManager.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import Foundation
import AVKit

final class AudioManager {
    
    //MARK: - Isnatance
    static let shared = AudioManager()
    private var player: AVAudioPlayer?
    
    //MARK: - Init
    private init() { }
    
    //MARK: - Methods
    func startPlayer(trackName: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: trackName, withExtension: withExtension) else {
            print("Resource not found", trackName)
            return
        }
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            
            self.player?.play()
            
        } catch {
            print("failed to initialize player", error)
        }
    }
    
    
}

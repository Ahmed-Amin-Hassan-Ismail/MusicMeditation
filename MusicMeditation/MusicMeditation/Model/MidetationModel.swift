//
//  MidetationModel.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import Foundation

struct Meditation: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "1 Minute Relaxing Meditation", description: "Clear your mind and slumber intonothingness. Allocate only a few moments for a quick breather.", duration: 70, track: "meditation1", image:"image-stones")
}

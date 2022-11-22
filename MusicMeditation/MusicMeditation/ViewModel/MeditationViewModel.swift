//
//  MeditationViewModel.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    @Published private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
    
}

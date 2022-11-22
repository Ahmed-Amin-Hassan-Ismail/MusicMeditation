//
//  PlayerView.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

struct PlayerView: View {
    //MARK: - Property Wrapper
    @EnvironmentObject var audioManager: AudioManager
    @State private var value: TimeInterval = 0.0
    @State private var isEditingSlider: Bool = false
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Variables
    var meditationViewModel: MeditationViewModel
    var isPreview: Bool = false
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            
            backgroundImageView
            
            blureView
            
            VStack(spacing: 32) {
                closeButton
                descriptionTitle
                
                Spacer()
                
                if let player = audioManager.player {
                    sliderWithTime
                    playBackButtons
                }
            }
            .padding(20)
            
        }
        .onAppear {
            audioManager.startPlayer(trackName: "MeditationTrack", withExtension: "wav", isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditingSlider else { return }
            value = player.currentTime
        }
        
    }
}

extension PlayerView {
    //MARK: - Background Image
    private var backgroundImageView: some View {
        Image("image-stones")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width)
            .ignoresSafeArea(.all)
    }
    
    //MARK: - Close Button
    private var closeButton: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                
            }
            Spacer()
        }
    }
    
    //MARK: - Blur View
    private var blureView: some View {
        Rectangle()
            .background(.thinMaterial)
            .opacity(0.2)
            .ignoresSafeArea(.all)
    }
    
    //MARK: - Munite of relaxing
    private var descriptionTitle: some View {
        Text(meditationViewModel.meditation.title)
            .font(.title)
            .foregroundColor(.white)
        
    }
    
    //MARK: - sliderWithTime
    private var sliderWithTime: some View {
        VStack(spacing: 5) {
            Slider(value: $value,
                   in: 0...audioManager.player!.duration,
                   onEditingChanged: { editing in
                isEditingSlider = editing
                
                if !editing {
                    audioManager.player!.currentTime = value
                }
            })
            .accentColor(.white)
            
            HStack {
                Text(DateComponentsFormatter.positional.string(from: audioManager.player!.currentTime) ?? "0:00")
                
                Spacer()
                
                Text(DateComponentsFormatter.positional.string(from: audioManager.player!.duration - audioManager.player!.currentTime) ?? "0:00")
            }
            .font(.caption)
            .foregroundColor(.white)
        }
    }
    
    //MARK: - Play Back Control Button
    private var playBackButtons: some View {
        HStack {
            PlaybackControlButton(systemName: "repeat") {
                
            }
            Spacer()
            
            PlaybackControlButton(systemName: "gobackward.10") {
                
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "play.circle.fill", fontSize: 44) {
                
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "goforward.10") {
                
            }
            
            Spacer()
            
            PlaybackControlButton(systemName: "stop.fill") {
                
            }
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationViewModel = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        PlayerView(meditationViewModel: meditationViewModel, isPreview: true)
            .environmentObject(AudioManager())
    }
}

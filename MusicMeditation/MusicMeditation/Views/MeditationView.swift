//
//  MeditationView.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

struct MeditationView: View {
    @StateObject var meditationViewModel = MeditationViewModel(meditation: Meditation.data)
    @State private var showPlayer: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Image(meditationViewModel.meditation.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                Color(.black)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                            Text("Music")
                            
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationViewModel.meditation.duration) ?? "")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text(meditationViewModel.meditation.title)
                        .font(.title)
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }

                    
                    Text(meditationViewModel.meditation.description)
                      
                    Spacer()
                }
                .foregroundColor(.white)
                .padding( 20)
                    
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
            
            
        }
        .ignoresSafeArea(.all)
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationViewModel: meditationViewModel)
        }
    }
}

struct MeditationView_Previews: PreviewProvider {
    static let meditationViewModel = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        MeditationView(meditationViewModel: meditationViewModel)
            .environmentObject(AudioManager())
    }
}

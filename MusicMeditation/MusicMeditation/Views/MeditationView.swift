//
//  MeditationView.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("image-stones")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 3)
            
            ZStack {
                Color(.black)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                            Text("Music")
                            
                        
                            Text("0S")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text("1 Munite Relaxing Maditation")
                        .font(.title)
                    
                    Button {
                        
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }

                    
                    Text("Clear your mind and slumber into nothingness. Allocate only a few moments for a quick better")
                      
                    Spacer()
                }
                .foregroundColor(.white)
                .padding( 20)
                    
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
            
            
        }
        .ignoresSafeArea(.all)
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}

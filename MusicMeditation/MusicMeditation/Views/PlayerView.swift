//
//  PlayerView.swift
//  MusicMeditation
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    
    var body: some View {
        ZStack {
            Image("image-stones")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 32) {
                closeButton
                descriptionTitle
                Spacer()
                sliderWithTime
            }
            .padding(20)
            
        }
       
    }
}

extension PlayerView {
    //MARK: - Close Button
    private var closeButton: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
                
            }
            Spacer()
        }
    }
    
    //MARK: - Munite of relaxing
    private var descriptionTitle: some View {
        Text("1 Minute Relaxing Maditation")
            .font(.title)
            .foregroundColor(.white)
        
    }
    
    //MARK: -
    private var sliderWithTime: some View {
        VStack(spacing: 5) {
            Slider(value: $value, in: 0...60)
                .accentColor(.white)
            
            HStack {
                Text("0:00")
                
                Spacer()
                
                Text("1:00")
            }
            .font(.caption)
            .foregroundColor(.white)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

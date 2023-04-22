//
//  PlaySound.swift
//  Trip
//
//  Created by Nileshkumar M. Prajapati on 2023/04/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func play(sound: String, type: String) {
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else { return }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    } catch {
        print("Couldn't play sound due to \(error.localizedDescription)")
    }
}

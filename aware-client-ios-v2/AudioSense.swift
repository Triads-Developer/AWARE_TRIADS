//
//  AudioSense.swift
//  aware-client-ios-v2
//
//  Created by JessieW on 1/27/23.
//  Copyright © 2023 Yuuki Nishiyama. All rights reserved.
//

import Foundation
import UIKit
import AWAREFramework

class NoiseMeasurementViewController: UIViewController {

    var sensor: AudioRecorder!
    var isRecording = false
    var timer: Timer?
    @IBOutlet weak var noiseLevelLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sensor = AudioRecorder()
    }

    @IBAction func startStopButtonTapped(_ sender: Any) {
        if !isRecording {
            startRecording()
        } else {
            stopRecording()
        }
    }

    func startRecording() {
        isRecording = true
        startStopButton.setTitle("Stop", for: .normal)
        sensor.startRecording()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] (timer) in
            guard let self = self else { return }
            self.updateNoiseLevel()
        })
    }
    
    func stopRecording() {
        isRecording = false
        startStopButton.setTitle("Start", for: .normal)
        sensor.stopRecording()
        timer?.invalidate()
    }
    
    func updateNoiseLevel() {
        // your custom code to calculate the noise level here
    }
}

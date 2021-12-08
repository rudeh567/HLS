//
//  ViewController.swift
//  HLS
//
//  Created by yeoboya on 2021/12/08.
//

import UIKit
import StreamingKet

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var grayView: UIView!
    
    
    private let videoPlayer = StreamingVideoPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPlayer()
        
        textField.text = "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8"
    }
    
    func setupVideoPlayer() {
        videoPlayer.add(to: grayView)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        guard let text = textField.text, let url = URL(string: text) else {
            print("ERRor parsing URL")
            return
        }
        
        print("영상이 재생됩니다.")
        videoPlayer.play(url: url)
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        videoPlayer.pause()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        textField.text = nil
        videoPlayer.pause()
    }
}

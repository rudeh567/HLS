//
//  VideoPlayer.swift
//  StreamingKet
//
//  Created by yeoboya on 2021/12/08.
//

//import UIKit
import AVFoundation
import AVKit

public class StreamingVideoPlayer {
        
    private let playerViewController = AVPlayerViewController()
    
    private let avPlayer = AVPlayer()
    
    private lazy var playerView: UIView = {
        let view = playerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init() {}
    
    //MARK: Public interface
    public func add(to view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    public func play(url: URL) {
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        avPlayer.replaceCurrentItem(with: playerItem)
        playerViewController.player = avPlayer
        playerViewController.player?.play()
    }
    
    public func pause() {
        avPlayer.pause()
    }
    
}

//
//  TerrierMusicPlayer.swift
//  Plugin
//
//  Created by Zan Pokerznik on 28/05/2020.
//  Copyright © 2020 Max Lynch. All rights reserved.
//

import Foundation
import MediaPlayer
import Capacitor

public class TerrierMusicPlayer : NSObject {
    private var player : MPMusicPlayerController
    private var queue: [String]
    
    required override init() {
        self.player = MPMusicPlayerController.applicationMusicPlayer
        self.queue = [String]()
        super.init()
    }
    
    private func getQueueDescriptor() -> MPMusicPlayerStoreQueueDescriptor {
        return MPMusicPlayerStoreQueueDescriptor(storeIDs: self.queue)
    }
    
    public func addToQueue(mediaId: String) {
        self.queue.append(mediaId)
        let descriptor = self.getQueueDescriptor()
        self.player.setQueue(with: descriptor)
    }
    
    public func play() {
        self.player.play()
    }
    
    public func pause() {
        self.player.pause()
    }
    
    public func stop() {
        self.player.stop()
    }
    
    public func rewind() {
        self.player.skipToPreviousItem()
    }
    
    public func forward() {
        self.player.skipToNextItem()
    }
    
    public func toFirst() {
        self.player.skipToBeginning()
    }
    
    public func getCurrentSong() -> TerrierMusicPlayerItem? {
        let playingItem = self.player.nowPlayingItem
        if(playingItem != nil)
        {
            let terrierItem = TerrierMusicPlayerItem(p_title: playingItem!.title!, p_artist: playingItem!.artist!, p_duration: playingItem!.playbackDuration)
            
            return terrierItem;
        }
        
        return nil
    }
}

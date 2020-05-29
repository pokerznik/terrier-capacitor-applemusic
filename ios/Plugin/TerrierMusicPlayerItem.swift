//
//  TerrierMusicPlayerItem.swift
//  Plugin
//
//  Created by Zan Pokerznik on 29/05/2020.
//  Copyright © 2020 Max Lynch. All rights reserved.
//

import Foundation

public class TerrierMusicPlayerItem : Codable {
    public var title: String
    public var artist: String
    public var duration : TimeInterval
    
    public init(p_title: String, p_artist: String, p_duration: TimeInterval)
    {
        self.title = p_title
        self.artist = p_artist
        self.duration = p_duration
    }
}

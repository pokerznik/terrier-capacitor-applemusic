import Foundation
import Capacitor
import MediaPlayer

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(TerrierMusicKit)
public class TerrierMusicKit: CAPPlugin {
    
    @objc public var musicPlayer : TerrierMusicPlayer = TerrierMusicPlayer()
    @objc public var user : TerrierKitUser = TerrierKitUser()
    
    
    // USER METHODS
    
    @objc func authorizeUser(_ call: CAPPluginCall) {
        let devToken = call.getString("devToken") ?? ""
        do {
            try self.user.authorize(devToken: devToken)
            call.resolve()
        }
        catch TerrierKitUserError.developerTokenIsNullOrEmpty {
            call.reject("Developer token is not valid.")
        }
        catch {
            call.reject("User does not allow access to music library or does not have Apple Music subscription.")
        }
    }
    
    @objc func isUserAuthorized(_ call: CAPPluginCall) {
        call.resolve([
            "authorized": self.user.isAuthorized()
        ])
    }
    
    @objc func getUserToken(_ call: CAPPluginCall) {
        call.resolve([
            "userToken": self.user.getUserToken()
        ]);
    }
    
    
    // MUSIC PLAYER METHODS
    
    @objc func addToPlayerQueue(_ call: CAPPluginCall) {
        let mediaId = call.getString("mediaId") ?? ""
        if(mediaId == "")
        {
            call.reject("Media ID is not valid.");
        }
        self.musicPlayer.addToQueue(mediaId: mediaId)
        call.resolve()
    }
    
    @objc func play(_ call: CAPPluginCall) {
        self.musicPlayer.play()
        call.resolve()
    }
    
    @objc func pause(_ call: CAPPluginCall) {
        self.musicPlayer.pause()
        call.resolve()
    }
    
    @objc func stop(_ call: CAPPluginCall)
    {
        self.musicPlayer.stop()
        call.resolve()
    }
    
    @objc func rewind(_ call: CAPPluginCall) {
        self.musicPlayer.rewind()
        call.resolve()
    }
    
    @objc func forward(_ call: CAPPluginCall) {
        self.musicPlayer.forward()
        call.resolve()
    }
    
    @objc func toFirstSong(_ call: CAPPluginCall) {
        self.musicPlayer.toFirst()
        call.resolve()
    }
    
    @objc func currentPlayingItem(_ call: CAPPluginCall) {
        let item = self.musicPlayer.getCurrentSong() ?? nil
        if(item != nil)
        {
            let encoder = JSONEncoder()
            do {
                let jsonItem = try encoder.encode(item)
                
                call.resolve([
                    "currentItem": String(data: jsonItem, encoding: .utf8) ?? ""
                ])
            } catch {
                call.reject("Cannot encode current playing item to JSON")
            }
        }
    }
}

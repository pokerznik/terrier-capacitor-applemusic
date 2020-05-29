#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.

 CAP_PLUGIN(TerrierMusicKit, "TerrierMusicKit",
           CAP_PLUGIN_METHOD(authorizeUser, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isUserAuthorized, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(getUserToken, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(addToPlayerQueue, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(play, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(pause, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(stop, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(rewind, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(forward, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(toFirstSong, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(currentPlayingItem, CAPPluginReturnPromise);
)

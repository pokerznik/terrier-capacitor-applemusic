# Capacitor Apple Music Kit plugin
## by Terrier&Terrier

Plugin is still under development, it was implemented because we needed Apple Music Kit integration in existing IONIC application. 

Every contribution and help is welcome. The plugin is under MIT licence, we do not take responsibility for any damage which could be caused with usage of our plugin.

We are aware that many things need to be implemented and the plugin is not finished yet. We have developed functions which were needed for our usage any upgrades are more than welcome.

If you have any questions, suggestions, ideas or messages, please contact me at: zanp@terrier-terrier.si. 🤘🏻

#### How to use it?
Plugin can be installed with npm: `npm i terrier-capacitor-musickit`

Currently, we have supported following methods:
  - `authorizeUser(options: {devToken: string}) : Promise<any>`
  - `isUserAuthorized() : Promise<boolean>`
  - `getUserToken(): Promise<string>`
  - `addToPlayerQueue(options: {mediaId: string}): Promise<any>`
  - `play(): Promise<any>`
  - `pause(): Promise<any>`
  - `stop(): Promise<any>`
  - `rewind(): Promise<any>`
  - `forward(): Promise<any>`
  - `toFirstSong(): Promise<any>`
  - `currentPlayingItem(): Promise<string>`

Expected usage flow is:
  1. calling `authorizeUser(options: {devToken: string})` method with your developer token as parameter. [How to obtain your developer token?](https://developer.apple.com/documentation/sign_in_with_apple/generate_and_validate_tokens) 
For testing purposes we suggest simply to use [Apple music token generator from here](https://github.com/pelauimagineering/apple-music-token-generator).
User will be prompted to allow access to their music library and if they approve, everything is fine. Otherwise, everything has gone to hell. 👿
  2. If you use any other external libraries to access Apple API and you would need to know unique user token, simply call `getUserToken()` method.
  3. Plugin also includes integrated MediaPlayer which means that music will be played directly inside system iOS music player. All song details will be available inside system music player as well.
  4. Now you need to add a song (or more) into player queue. This can be made by calling `addToPlayerQueue(options: {mediaId})` method. `mediaId` parameter is unique Id of song/playlist/video ... It is included in response of Apple catalog API request as `Id` parameter.
  5. Now you can integrate buttons of your in-app player with native methods: `play()`, `pause()`, `stop()`, `forward()`, `rewind()`, `toFirstSong()`.
  6. If you want to show current playing item, simply call `currentPlayingItem()` method. It will return response in the following format:
```
{
	"currentItem":"{\"title\":\"Minority\",\"duration\":354.66699999999997,\"artist\":\"Green Day\"}"
}
```
Note: for continue usage, `currentItem` property needs to be parsed and object will be returned.

#### One important thing before deploy
Before deploying to actual device, please keep in mind that you will need to add `Privacy - Media Library Usage Description` property into your `Info.plist` file. Value of the property describes why your app needs access to user Apple Music library. This info is shown on prompt. **The app will crash if that property will be missing. (Based on personal experiences 😂).**

#### Did we help you?
Great, we are really glad! [Check our Party Animal app in Apple store](https://apps.apple.com/us/app/party-animal-plan-your-party/id1510255834?ls=1), it will help you when you'll organise your party!
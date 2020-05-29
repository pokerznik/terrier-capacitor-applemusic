declare global {
  interface PluginRegistry {
    TerrierMusicKit? : TerrierMusicKit
  }
}

export interface TerrierMusicKit {
  authorizeUser(options: {devToken: string}) : Promise<any>;
  isUserAuthorized() : Promise<any>;
  getUserToken(): Promise<any>;
  addToPlayerQueue(options: {mediaId: string}): Promise<any>;
  play(): Promise<any>;
  pause(): Promise<any>;
  stop(): Promise<any>;
  rewind(): Promise<any>;
  forward(): Promise<any>;
  toFirstSong(): Promise<any>;
  currentPlayingItem(): Promise<{currentItem: string}>;
}
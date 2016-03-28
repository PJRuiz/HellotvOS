App.onLaunch = function(options) {
  console.log("Hello TVML!");
  var resourceLoader = new ResourceLoaderJS(NativeResourceLoader.create());
  var initialDoc = resourceLoader.getDocument("hello.tvml");
  navigationDocument.pushDocument(initialDoc);
  
  initialDoc.addEventListener("select",handleEvent);
  initialDoc.addEventListener("play",hadleEvent);

};

class ResourceLoaderJS {
  constructor(nativeResourceLoader) {
    this.nativeResourceLoader = nativeResourceLoader;
    this.domParser = new DOMParser();
  }
  
  getDocument(name) {
    var docString = this.nativeResourceLoader.loadBundleResource(name);
    return this.domParser.parseFromString(docString,"application/xml");
  }
}

function playVideo(title,url) {
  var player = new Player();
  var video = new MediaItem('video',url);
  video.title = title;
  
  player.playlist = new Playlist();
  player.playlist.push(video);
  
  player.play();
}

function handleEvent(event) {
  var buttonId = event.target.getAttribute("id");
  
  if (buttonId === "play") {
    playVideo("Hello TVML!", "https://s3.amazonaws.com/tvos-apprentice/helloTVML/hls_playlist.m3u8");
  }
}
App.onLaunch = function(options) {
  console.log("Hello TVML!");
};

class ResourceLoaderJS {
  contructor(nativeResourceLoader) {
    this.nativeResourceLoader = nativeResourceLoader;
    this.domParser = new DOMParser();
  }
  
  getDocument(name) {
    var docString = this.nativeResourceLoader.loadBundleResource(name);
    return this.domParser.parseFromString(docString,"application/xml");
  }
}
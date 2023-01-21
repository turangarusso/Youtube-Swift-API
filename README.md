<h1 align="center">
  <br>


     _______  _______ _________
    (  ___  )(  ____ )\__   __/
    | (   ) || (    )|   ) (   
    | (___) || (____)|   | |   
    |  ___  ||  _____)   | |   
    | (   ) || (         | |   
    | )   ( || )      ___) (___
    |/     \||/       \_______/


                           
  <br>
  YouTube-Swift-API
  <br>
</h1>

<h4 align="center">The youTube API in swift
.</h4>


<p align="center">
  <a href="#key-features">Key Features</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

![youtube-logo-1024x576 - dimensioni grandi](https://user-images.githubusercontent.com/113531412/213827429-b3ce6a86-2e90-4da8-b64e-1160c56cd3eb.jpg)

## Key Features

The YouTube Data API lets you incorporate functions normally executed on the YouTube website into your own website or application.
 The API also supports methods to insert, update, or delete many of these resources.

* Search video on youtube (All Free)
  - You need to create an accout on Google Developer and get an API key.
* Get links, thumbnails, title, description etc 
* Code adaptable to every need
* Integrated with swiftui


## How To Use

You can build the project using Xcode. To get the Api key go to your account on Google Cloud and copy the key.

Change the key value with your Youtube Api key

```swift
final class Network: ObservableObject {
    @Published var users: TranslationResponse
    @Published var key: String = "your api"
```

You can use easy manipulate the url link, in this example i will:

- Search for query: q=Highlights
- Set: relevanceLanguage=it *
- Filter for a specific channel Id: channelId=UCLzKhsxrExAC6yAdtZ-BOWw&  *
- Sort results for data: order=date *
- Format the response: fields=items(id(videoId),snippet(publishedAt,title,channelId,description)) *

* Optional parameters

You can easy make the request dynamic using variables as done with the key

```swift
    guard let url = URL(
    string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCLzKhsxrExAC6yAdtZ-BOWw&order=date
    &q=Highlights&relevanceLanguage=it&key="+key+"&fields=items(id(videoId),snippet(publishedAt,title,channelId,description))") 
    else { fatalError("Missing URL") }

```
Please read the official youTube API Documentation if you need more info !

In the view you can easy call the Api using:

```swift
  .onAppear {
            network.getUsers()
        }
```

To get translation result in the view, you can use:

```swift
Text(network.users.resultTextResponse)
```

The Struct must be declared with the same parameters of the API Response

If you change the Request parameters, the response will change, so you need to edit the struct!

```
struct TranslationResponse: Decodable {
  
  let items: [Response]
    var resultTextResponse: String {
      items.map(\.resultTextResponse2).joined(separator: "\n")
    }
}

extension TranslationResponse {
    struct Response: Decodable {        
      var id: Videos
      var snippet: Snippet
        var resultTextResponse2: String {
            snippet.title
        }
  }
}

extension TranslationResponse.Response {
  struct Videos: Decodable {
    let videoId: String
  }
}

extension TranslationResponse.Response {
  struct Snippet: Decodable {
      let publishedAt: String
      let channelId: String
      let title: String
      let description: String
      
  }
}

```

> **Note**

> You can found more information on: https://developers.google.com/youtube/v3/docs/search/list


## Credits

THIS IS NOT THE OFFICIAL API CODE

Russo Giovanni M.

youTube

For educational purposes

## License

MIT

---


//
//  Model.swift
//  youtube
//
//  Created by giovanni russo on 20/01/23.
//

import Foundation
import SwiftUI

final class Network: ObservableObject {
    @Published var users: TranslationResponse
   
    @Published var key: String = "your api"

    init(users: TranslationResponse){
        self.users = users
    }

    func getUsers() {
        guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=UCLzKhsxrExAC6yAdtZ-BOWw&order=date&q=Highlights&relevanceLanguage=it&key="+key+"&fields=items(id(videoId),snippet(publishedAt,title,channelId,description))") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(TranslationResponse.self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}

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

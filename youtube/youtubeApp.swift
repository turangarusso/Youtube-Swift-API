//
//  youtubeApp.swift
//  youtube
//
//  Created by giovanni russo on 20/01/23.
//

import SwiftUI

@main
struct youtubeApp: App {
    
    var contenitore: TranslationResponse = TranslationResponse( items: [TranslationResponse.Response(id: TranslationResponse.Response.Videos(videoId: "12121"), snippet: TranslationResponse.Response.Snippet(publishedAt: "date", channelId: "channelID", title: "video title", description: "video description"))])
    
    var body: some Scene {
        WindowGroup {
            ContentView(network: Network(users: contenitore))
        }
    }
}

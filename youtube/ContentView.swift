//
//  ContentView.swift
//  youtube
//
//  Created by giovanni russo on 20/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network: Network
    
    var contenitore: TranslationResponse = TranslationResponse( items: [TranslationResponse.Response(id: TranslationResponse.Response.Videos(videoId: "12121"), snippet: TranslationResponse.Response.Snippet(publishedAt: "date", channelId: "channelID", title: "video title", description: "video description"))])
    
    
    var body: some View {
        ScrollView {
            Text("All users")
                .font(.title)
                .bold()
            VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                          
                                Text(network.users.resultTextResponse)
                                    .bold()
                            
                    }
                    .padding()
            }//End VStack
        }//End ScrollView
        .padding(.vertical)
        .onAppear {
            network.getUsers()
        }
    }
}


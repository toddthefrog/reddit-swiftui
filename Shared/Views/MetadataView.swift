//
//  MetadataView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 7/29/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct MetadataView: View {
    let post: Post
    let spaced: Bool
    
    var stickied: some View {
        Group {
            // Pinned icon
            if post.stickied {
                Image(systemName: "pin.fill")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(Color("stickied"))
            }
            if spaced {
                Spacer()
            }
        }
    }
    
    var body: some View {
        HStack {
            if spaced {
                Spacer()
            }
            stickied
            ForEach([("arrow.up", "\(post.score)", Color.orange), ("text.bubble", "\(post.num_comments)", Color("text")), ("clock", "\(timeSince(post.created))", Color("text"))], id: \.0) { data in
                Group {
                    Image(systemName: data.0)
                    Text(data.1)
                    if self.spaced {
                        Spacer()
                    }
                }
                .foregroundColor(data.2)
            }
        }
    }
}

#if DEBUG
struct MetadataView_Previews: PreviewProvider {
    static var previews: some View {
        MetadataView(post: Post(title: "Hello World | This is secondary text", name: "hello-world", id: "hw", selftext: "This is some body content. Blah blah\nblah blah blah", selftext_html: nil, thumbnail: "blahblah", url: "", author: "me", subreddit: "swift", score: 1000, num_comments: 50, stickied: true, created: Date().timeIntervalSince1970, preview: nil, replies: nil), spaced: true)
        .font(.system(size: 10))
    }
}
#endif
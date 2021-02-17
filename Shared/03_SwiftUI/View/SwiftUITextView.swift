//
//  SwiftUITextView.swift
//  SuperSwiftUIDemoApp
//
//  Created by leng on 2021/02/11.
//

import SwiftUI

struct SwiftUITextView: View {
    
    
    var body: some View {
        List{
            Group{
                Text("largeTitle")
                    .font(.largeTitle)
            
                
                Text("title")
                    .font(.title)
                Text("title2")
                    .font(.title2)
                Text("title3")
                    .font(.title3)
            }
            
            Group{
                Text("headline").font(.headline)
                Text("subheadline").font(.subheadline)

                Text("caption").font(.caption)
                Text("caption2").font(.caption2)
            }
            
            Group{
                Text("body").font(.body)

                Text("footnote").font(.footnote)
                Text("callout").font(.callout)
            }
            
            Group{
                Text("StyleText").bold().italic().font(.body)
                    .baselineOffset(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .strikethrough()
                    .underline()
                
                Text("Hello, \(Image(systemName: "heart.fill"))")
            }
            
            Group{
                
                Text(Date().addingTimeInterval(600),style: .date) +
                Text(Date().addingTimeInterval(600),style: .time) +
                Text(Date().addingTimeInterval(600),style: .timer)

                Text("Hello, \(Text("sad").underline().bold())").strikethrough()
            }
            
            Group{
                Text(Date().addingTimeInterval(60),style: .timer)
                Text(Date().addingTimeInterval(60),style: .relative)
                Text(Date().addingTimeInterval(60),style: .offset)

                Text(Date().addingTimeInterval(60),style: .time)
                
                VStack(alignment: .leading) {
                         Text("ABCDEF").kerning(-3)
                         Text("ABCDEF")
                         Text("ABCDEF").kerning(3)
                }
                VStack(alignment: .leading) {
                         Text("ABCDEF").tracking(-3)
                         Text("ABCDEF")
                         Text("ABCDEF").tracking(3)
                     }
            }
        }.navigationTitle("Text")
    }
}

struct SwiftUITextView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextView()
    }
}

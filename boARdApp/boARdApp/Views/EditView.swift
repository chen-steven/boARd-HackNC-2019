//
//  EditView.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//
import SwiftUI

struct EditView: View {
    @ObservedObject var room: Room
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    print("button tapped")
                }) {
                    Text("Back")
                        .multilineTextAlignment(.leading)
                }
                Spacer()
                Text(String(room.roomNumber))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                Spacer()
            }.padding()
            TextView(text: $room.text).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
        
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(room: Room(text:"test"))
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator : NSObject, UITextViewDelegate {
    var parent: TextView
    init(_ uiTextView: TextView) {
        self.parent = uiTextView
    }
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text ?? "empty")
    }
    
}

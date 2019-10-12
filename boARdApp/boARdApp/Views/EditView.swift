//
//  EditView.swift
//  mainboARd
//
//  Created by Steven Chen on 10/12/19.
//  Copyright © 2019 backupMain Enterprises. All rights reserved.
//

import SwiftUI

struct EditView: View {
    //@ObservedObject var room: Room
    @State var text: String
    @State var roomNumber: Int
    var body: some View {
        
        TextView(text: $text).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(text:"asjdfklasjdkfalsdfasdasdfasdff", roomNumber: 11)
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

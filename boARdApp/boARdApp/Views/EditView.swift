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
            HStack(alignment: .center){
                
                Text(room.roomNumber)
                           .font(.largeTitle)
                           .fontWeight(.bold)
                    .foregroundColor(Color(red:77/255, green: 170/255, blue: 213/255))
                           .multilineTextAlignment(.center)
                Spacer()
                Button(action: {}) {
                    
                    Image(systemName:"square.and.arrow.up")
                        
                }
            }.padding(EdgeInsets(top:8, leading: 25, bottom: 2, trailing: 25)).onTapGesture {
                self.endEditing()
            }
           
            TextView(text: $room.text, room: room).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
    }
    
    
    func endEditing() {
        UIApplication.shared.endEditing()
    }
        
    
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(room: Room(text:"test"))
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    var room: Room

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
extension UITextView {
    func addDoneButton(title: String, target: Any, selector: Selector) {
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        toolBar.setItems([flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
    
}

class Coordinator : NSObject, UITextViewDelegate {
    var parent: TextView
    init(_ uiTextView: TextView) {
        self.parent = uiTextView
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text ?? "empty")
        parent.room.setText(text: textView.text)
    }
    
    
}

//
//  ContentView.swift
//  SampleApp
//
//  Created by Andres Kievsky on 4/9/2024.
//

import SwiftUI

struct SampleShortcutView: NSViewRepresentable {
    let placeholderString: String?
    func makeNSView(context: Context) -> KeyboardShortcutView {
        let keyboardShortcutView = KeyboardShortcutView()
        keyboardShortcutView.placeholderString = placeholderString
        return keyboardShortcutView
    }
    
    func updateNSView(_ ksv: KeyboardShortcutView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Enter your shortcut:")
            SampleShortcutView(placeholderString: "Shortcut")
                .frame(width: 100, height: 50)
                .padding(.all, 20)
        }
        .padding(.all, 20)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  SampleApp
//
//  Created by Andres Kievsky on 4/9/2024.
//

import SwiftUI

struct SampleShortcutView: NSViewRepresentable {
    let placeholderString: String?
    let delegate: KeyboardShortcutViewDelegate
    func makeNSView(context: Context) -> KeyboardShortcutView {
        let keyboardShortcutView = KeyboardShortcutView()
        keyboardShortcutView.placeholderString = placeholderString
        keyboardShortcutView.delegate = delegate
        return keyboardShortcutView
    }
    
    func updateNSView(_ ksv: KeyboardShortcutView, context: Context) {
    }
}

class DelegateExample: KeyboardShortcutViewDelegate {
    func keyboardShortcutViewShouldBeginRecording(_ keyboardShortcutView: KeyboardShortcutView) -> Bool {
        true
    }
    
    func keyboardShortcutView(_ keyboardShortcutView: KeyboardShortcutView, canRecordShortcut shortcut: KeyboardShortcutView.Pair) -> Bool {
        true
    }
    
    func keyboardShortcutViewDidEndRecording(_ keyboardShortcutView: KeyboardShortcutView) {
        let text = keyboardShortcutView.shortcut.flatMap {
            $0.modifierFlags.characters + $0.keyCode.characters
        } ?? "nil"
        print("Chosen shortcut was: \(text)")
    }
    
}

struct ContentView: View {
    let delegateExample = DelegateExample()
    var body: some View {
        VStack {
            Text("Enter your shortcut:")
            SampleShortcutView(placeholderString: "Shortcut", delegate: delegateExample)
                .frame(width: 100, height: 50)
                .padding(.all, 20)
        }
        .padding(.all, 20)
    }
}

#Preview {
    ContentView()
}

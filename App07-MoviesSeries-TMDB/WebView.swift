//
//  WebView.swift
//  App04-MoviesSeries
//
//  Created by Enrique Diaz de Leon Hicks on 06/03/21.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let html: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: html)!))
        uiView.allowsBackForwardNavigationGestures = false
    }
}


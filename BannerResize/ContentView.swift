//
//  ContentView.swift
//  BannerResize
//
//  Created by Marcel Klínek on 04/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageViewController()
            .frame(height: 350)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

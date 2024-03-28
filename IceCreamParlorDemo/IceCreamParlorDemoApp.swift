//
//  IceCreamParlorDemoApp.swift
//  IceCreamParlorDemo
//
//  Created by Justin Lowry on 3/28/24.
//

import SwiftUI

@main
struct ObservableBindingApp: App {
    @State var iceCreamParlor = IceCreamParlor()
    
    var body: some Scene {
        WindowGroup {
            ContentView(iceCreamParlor: iceCreamParlor)
        }
    }
}

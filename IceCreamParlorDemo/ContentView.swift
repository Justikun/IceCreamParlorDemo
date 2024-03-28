//
//  ContentView.swift
//  IceCreamParlorDemo
//
//  Created by Justin Lowry on 3/28/24.
//

import SwiftUI

/// Model
struct IceCream {
    private(set) var flavor: String
    
    mutating func setFlavor(_ flavor: String) {
        self.flavor = flavor
    }
    
    
    init(flavor: String) {
        self.flavor = flavor
    }
}

/// View Model
@Observable
class IceCreamParlor {
    var iceCream: IceCream?
    
    func setFlavor(_ flavor: String) {
        iceCream?.setFlavor(flavor)
    }
    
    init(iceCream: IceCream? = nil) {
        self.iceCream = iceCream
    }
}


/// View
struct ContentView: View {
    var iceCreamParlor: IceCreamParlor
    
    var body: some View {
        VStack {
            Text("Welcome")
            if let _ = iceCreamParlor.iceCream {
                IceCreamMakerView
            }
        }
    }
    
    private var IceCreamMakerView: some View {
        VStack {
            Button {
                let randomFlavor = ["chocolate", "vanilla", "strawberry", "mint", ].randomElement()!
                iceCreamParlor.setFlavor(randomFlavor)
            } label: {
                Text("Random Ice Cream")
            }
            .padding()
            Text("Flavor: \(iceCreamParlor.iceCream?.flavor ?? "None")")
        }
    }
}



#Preview {
//    ContentView(iceCreamParlor: IceCreamParlor())
    ContentView(iceCreamParlor: IceCreamParlor(iceCream: IceCream(flavor: "Vanilla")))
}

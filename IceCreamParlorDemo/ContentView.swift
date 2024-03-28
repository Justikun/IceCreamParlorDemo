//
//  ContentView.swift
//  IceCreamParlorDemo
//
//  Created by Justin Lowry on 3/28/24.
//

import SwiftUI

/// Model
struct IceCream {
    /// This is private because we don't want the flavor to be changed directly
    /// (set) is a way to make a variable read-only for the public, but read-write for the struct
    private(set) var flavor: String
    
    /// This is a mutating function because it changes the value of the struct
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
    
    /// func to reqeuest the IceCream model to change its flavor
    func setFlavor(_ flavor: String) {
        iceCream?.setFlavor(flavor)
    }
    
    init(iceCream: IceCream? = nil) {
        self.iceCream = iceCream
    }
}


/// View
struct ContentView: View {
    /// This is an instance of the IceCreamParlor class
    var iceCreamParlor: IceCreamParlor
    
    var body: some View {
        VStack {
            Text("Welcome")
            if let _ = iceCreamParlor.iceCream {
                IceCreamMakerView
            }
        }
    }
    
    /// This is a computed property that returns a view
    /// This computed property is inside of ContentView so it can access the iceCreamParlor intance
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

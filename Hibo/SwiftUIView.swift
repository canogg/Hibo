//
//  SwiftUIView.swift
//  Hibo
//
//  Created by Ana Caroline Sampaio Nogueira on 19/10/22.
//

import SwiftUI

struct SwiftUIView: View {

    @State var selection = 0

    var body: some View {
        Picker(selection: $selection) {
            ForEach(0..<10) { option in
                Text("Option \(option)")
            }
        } label: {
            EmptyView()
        }
        

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

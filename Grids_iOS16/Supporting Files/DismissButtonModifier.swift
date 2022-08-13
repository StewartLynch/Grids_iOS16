//
// Created for Grids_iOS16
// by Stewart Lynch on 2022-08-10
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI


struct DismissButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var withScroll: Bool
    func body(content: Content) -> some View {
        let view = ZStack {
            content
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .imageScale(.large)
                            .padding()
                    }
                }
                Spacer()
            }
        }
        if withScroll {
            ScrollView {
                view
            }
        } else {
            view
        }
    }
}
extension View {
    func withDismissButton(withScroll: Bool = false) -> some View {
        self.modifier(DismissButtonModifier(withScroll: withScroll))
    }
}

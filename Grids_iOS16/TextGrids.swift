//
//  Examples2.swift
//  Grids_iOS16
//
//  Created by Stewart Lynch on 2022-08-10.
//

import SwiftUI

struct Leader: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var country: String
    var population: Int
    
    static var samples: [Leader] {
        [
            .init(firstName: "Justin", lastName: "Trudeau", country: "Canada", population: 36991981),
            .init(firstName: "Joe", lastName: "Biden", country: "United States", population: 332268200),
            .init(firstName: "Volodymyr", lastName: "Zelenskyy", country: "Ukraine", population: 43189518),
            .init(firstName: "Olaf", lastName: "Scholtz", country: "Germany", population: 83190556),
            .init(firstName: "Vladimir", lastName: "Putin", country: "Russia", population: 146171015)
        ]
    }
}

struct TextGrids: View {
    @State private var sampleImage: SampleImage?
    var body: some View {
        NavigationStack {
            VStack {
                TitleRow(sampleImage: $sampleImage, title: "Text Grids", image:  .Ex3)
                Grid(alignment: .leading) {
                    GridRow {
                        Text("Country")
                        Text("Leader")
                            .gridCellColumns(2)
                            .gridCellAnchor(.center)
                    }
                    .bold()
                    Divider()
                        .gridCellUnsizedAxes([.horizontal])
                    ForEach(Leader.samples) { leader in
                        GridRow {
                            Text(leader.country)
                            Text(leader.firstName)
                                .gridColumnAlignment(.trailing)
                            Text(leader.lastName)
                        }
                        GridRow {
                            Text("Population:").bold()
                            Text("\(leader.population)")
                        }
                        Divider()
                            .gridCellUnsizedAxes([.horizontal])
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.teal
                        .gradient
                        .opacity(0.8)
                        .shadow(.drop(radius: 20))
                    )
                )
                Spacer()
            }
            .navigationTitle("Text Grids")
            .sheet(item: $sampleImage) { $0.withDismissButton().presentationDetents([.medium]) }
        }
    }
}

struct TextGrids_Previews: PreviewProvider {
    static var previews: some View {
        TextGrids()
    }
}



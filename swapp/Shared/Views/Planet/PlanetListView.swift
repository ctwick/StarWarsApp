//
//  PlanetListView.swift
//  swapp
//
//  Created by Chamini Wickramanayake on 2022-07-05.
//

import Foundation
import SwiftUI

struct PlanetRow: View {
    var planet: Planet
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://picsum.photos/100")) { image in
                image.resizable()
            } placeholder: {
                Color.clear
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            VStack(alignment: .leading) {
                Text("\(planet.name)")
                    .fontWeight(.bold)
                Text("\(planet.climate)")
            }
        }
//        Text("\(planet.name) - \(planet.climate)")
    }
}

struct PlanetListView: View {
    @StateObject private var planetViewModel = PlanetViewModel()
    
    var body: some View {
        NavigationView {
            return List(planetViewModel.planets) {planet in
                NavigationLink(destination: PlanetDetailView(planet: planet)) {
                    PlanetRow(planet: planet)
                }
            }
            .navigationTitle("Planet List")
            .onAppear(perform: planetViewModel.onAppear)
        }
        .navigationViewStyle(.stack)
    }
}

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}

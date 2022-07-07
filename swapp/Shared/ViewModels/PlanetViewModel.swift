//
//  PlanetViewModel.swift
//  swapp
//
//  Created by Chamini Wickramanayake on 2022-07-05.
//

import Foundation

final class PlanetViewModel: ObservableObject {
    @Published var planets: Array<Planet> = []
    
    private let planetRepository: PlanetRepositoryProtocol
    
    init(planetRepository: PlanetRepositoryProtocol = PlanetRepository()) {
        self.planetRepository = planetRepository
    }
    
    func onAppear() {
        self.planetRepository.fetchPlanets {planets in
            self.planets = planets
        }
    }
}

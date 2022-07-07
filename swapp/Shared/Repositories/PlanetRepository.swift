//
//  PlanetRepository.swift
//  swapp
//
//  Created by Chamini Wickramanayake on 2022-07-05.
//

import Foundation
import SwiftUI

protocol PlanetRepositoryProtocol {
    func fetchPlanets(completion: @escaping (Array<Planet>) -> Void)
}

final class PlanetRepository: PlanetRepositoryProtocol {
    private let planetApiService: PlanetApiServiceProtocol
    
    init(planetApiService: PlanetApiServiceProtocol = PlanetApiService()) {
        self.planetApiService = planetApiService
    }
    
    func fetchPlanets(completion: @escaping (Array<Planet>) -> Void) {
        self.planetApiService.fetchPlanets(completion: completion)
    }
}

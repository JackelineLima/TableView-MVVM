//
//  HomeViewModel.swift
//  TableView-MVVM
//
//  Created by Jackeline Pires De Lima on 10/11/22.
//

import Foundation

class HomeViewModel {
    
    let races: [Races] = [Races(name: "Akita"),
                          Races(name: "Basset hound"),
                          Races(name: "Beagle"),
                          Races(name: "Bichon frisé"),
                          Races(name: "Boiadeiro australiano"),
                          Races(name: "Border collie"),
                          Races(name: "Boston terrier"),
                          Races(name: "Doberman"),
                          Races(name: "Lhasa apso"),
                          Races(name: "Yorkshire")]
    
    
    func setupRaces() -> [Races] {
        return races.shuffled()
    }
}

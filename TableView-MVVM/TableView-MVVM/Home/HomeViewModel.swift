//
//  HomeViewModel.swift
//  TableView-MVVM
//
//  Created by Jackeline Pires De Lima on 10/11/22.
//

import Foundation

class HomeViewModel {
    
    let model: [Nameable] = [IMC(name:"IMC"),
                             Race(name: "Akita"),
                             Race(name: "Basset hound"),
                             Race(name: "Beagle"),
                             Race(name: "Bichon frisé"),
                             Race(name: "Boiadeiro australiano"),
                             Race(name: "Border collie"),
                             Race(name: "Boston terrier"),
                             Race(name: "Doberman"),
                             Race(name: "Lhasa apso"),
                             Race(name: "Yorkshire")]
    
    
    func setupModel() -> [Nameable] {
        return model.shuffled()
    }
}


//
//  Races.swift
//  TableView-MVVM
//
//  Created by Jackeline Pires De Lima on 10/11/22.
//

import Foundation

protocol Nameable {
   var name: String { get set }
}

struct Race: Nameable {
   var name: String
}

struct IMC: Nameable {
  var name: String
}

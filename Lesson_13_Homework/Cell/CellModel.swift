//
//  CellModel.swift
//  My Homework App
//
//  Created by Egor on 11.02.26.
//

import Foundation

struct CellModel {
    let countryName: String
    let countryCapital: String
    let flag: String
}

struct ContinentModel {
    let continentName: String
    let countries: [CellModel]
}

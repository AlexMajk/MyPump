//
//  SectionsType.swift
//  MyPump
//
//  Created by Александр Майко on 22.03.2021.
//

import Foundation

enum SectionType: Int {
    case photo
    case moreInformation
    case pumpsModelList
    case description
    case otherInformation
    case accessoriesPumps
}

enum ScreenType: Int {
    case pumpsScreen
    case other
    
    func getSection() -> [SectionType] {
        switch self {
        case .pumpsScreen:
            return [.photo, .moreInformation, .pumpsModelList, .accessoriesPumps]
        default:
            return [.pumpsModelList, .accessoriesPumps]
        }
    }
}

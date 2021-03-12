//
//  SectionType.swift
//  MyPump
//
//  Created by пользователь on 3/12/21.
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

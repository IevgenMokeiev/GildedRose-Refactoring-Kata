//
//  ItemUpdaterFactory.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class ItemUpdaterFactory {

    static func itemUpdater(for item: Item) -> ItemUpdater {
        let itemType = itemType(for: item)

        switch itemType {
        case .agedBrie:
            return BrieUpdater(item: item)
        case .sulfuras:
            return SulfurasUpdater(item: item)
        case .backstagePass:
            return BackstagePassUpdater(item: item)
        case .generic:
            return GenericUpdater(item: item)
        }
    }

    private static func itemType(for item: Item) -> ItemType {
        return ItemType(rawValue: item.name) ?? .generic
    }
}

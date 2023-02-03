//
//  ItemUpdaterFactory.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class ItemUpdaterFactory {

    static func itemUpdater(for item: Item) -> ItemUpdater {
        let type = type(for: item)
        return type.make(item: item)
    }

    static func type(for item: Item) -> ItemUpdater.Type {
        let itemType = itemType(for: item)

        switch itemType {
        case .agedBrie:
            return BrieUpdater.self
        case .sulfuras:
            return SulfurasUpdater.self
        case .backstagePass:
            return BackstagePassUpdater.self
        case .conjured:
            return ConjuredUpdater.self
        case .generic:
            return GenericUpdater.self
        }
    }

    private static func itemType(for item: Item) -> ItemType {
        return ItemType(rawValue: item.name) ?? .generic
    }
}

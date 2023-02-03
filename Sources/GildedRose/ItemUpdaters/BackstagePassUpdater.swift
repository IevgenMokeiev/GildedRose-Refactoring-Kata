//
//  BackstagePassUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class BackstagePassUpdater: ItemUpdater {

    static let firstQualityThreshold = 11
    static let secondQualityThreshold = 6

    let item: Item

    required init(item: Item) {
        self.item = item
    }

    static func make(item: Item) -> Self {
        return self.init(item: item)
    }

    func updateQuality() {
        switch item.sellIn {
        case 6..<11:
            upgradeQuality(amount: 2)
        case 0..<6:
            upgradeQuality(amount: 3)
        default:
            upgradeQuality()
        }
    }

    func updateSellIn() {
        decreaseSellIn()
    }

    func updateQualityExpired() {
        item.quality = 0
    }
}


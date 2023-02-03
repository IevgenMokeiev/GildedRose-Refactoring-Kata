//
//  BackstagePassUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class BackstagePassUpdater: ItemUpdater {

    let item: Item

    required init(item: Item) {
        self.item = item
    }

    static func make(item: Item) -> Self {
        return self.init(item: item)
    }

    func updateQuality() {
        upgradeQuality()

        if item.sellIn < 11 {
            upgradeQuality()
        }

        if item.sellIn < 6 {
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


//
//  BackstagePassUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class BackstagePassUpdater: ItemUpdater {

    let item: Item

    init(item: Item) {
        self.item = item
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


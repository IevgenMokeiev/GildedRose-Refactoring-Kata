//
//  BrieUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class BrieUpdater: ItemUpdater {

    let item: Item

    required init(item: Item) {
        self.item = item
    }

    static func make(item: Item) -> Self {
        return self.init(item: item)
    }

    func updateQuality() {
        upgradeQuality()
    }

    func updateSellIn() {
        decreaseSellIn()
    }

    func updateQualityExpired() {
        updateQuality()
    }
}

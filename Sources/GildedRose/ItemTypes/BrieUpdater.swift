//
//  BrieUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class BrieUpdater: ItemUpdater {

    let item: Item

    init(item: Item) {
        self.item = item
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

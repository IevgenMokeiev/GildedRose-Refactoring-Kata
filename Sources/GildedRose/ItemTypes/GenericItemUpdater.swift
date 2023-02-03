//
//  GenericItemUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

import Foundation

class GenericItemUpdater: ItemUpdater {

    let item: Item

    init(item: Item) {
        self.item = item
    }

    func updateQuality() {
        degradeQuality()
    }

    func updateSellIn() {
        decreaseSellIn()
    }

    func updateQualityExpired() {
        degradeQuality()
    }
}

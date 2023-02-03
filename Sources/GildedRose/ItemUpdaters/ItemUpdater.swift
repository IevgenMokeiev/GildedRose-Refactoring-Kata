//
//  ItemUpdater.swift
//  
//
//  Created by Yevhen Mokeiev on 03.02.2023.
//

protocol ItemUpdater {

    var item: Item { get }

    func updateQuality()
    func updateSellIn()
    func updateQualityExpired()
}

extension ItemUpdater {

    func degradeQuality(amount: Int = 1) {
        if item.quality > 0 {
            item.quality -= amount
        }
    }

    func decreaseSellIn() {
        item.sellIn -= 1
    }

    func upgradeQuality(amount: Int = 1) {
        if item.quality < 50 {
            item.quality += amount
        }
    }
}

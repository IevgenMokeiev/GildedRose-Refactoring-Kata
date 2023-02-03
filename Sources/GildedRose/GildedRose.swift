public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        items.forEach { item in
            updateQuality(for: item)
        }
    }

    // MARK :- Private

    private func updateQuality(for item: Item) {
        let itemType = Self.itemType(from: item)

        // Update quiality before sell in
        switch itemType {
        case .agedBrie:
            upgradeQuality(for: item)
        case .backstagePass:
            upgradeQuality(for: item)

            if item.sellIn < 11 {
                upgradeQuality(for: item)
            }

            if item.sellIn < 6 {
                upgradeQuality(for: item)
            }
        case .generic:
            degradeQuality(for: item)
        case .sulfuras:
            break
        }

        // Update sell in
        if itemType != .sulfuras {
            decreaseSellIn(for: item)
        }

        // Update quiality after sell in
        if item.sellIn < 0 {
            switch itemType {
            case .agedBrie:
                upgradeQuality(for: item)
            case .backstagePass:
                item.quality = 0
            case .generic:
                degradeQuality(for: item)
            case .sulfuras:
                break
            }
        }
    }

    // MARK :- Generic methods

    private func degradeQuality(for item: Item) {
        if item.quality > 0 {
            item.quality -= 1
        }
    }

    private func decreaseSellIn(for item: Item) {
        item.sellIn -= 1
    }

    private func upgradeQuality(for item: Item) {
        if item.quality < 50 {
            item.quality += 1
        }
    }

    // MARK :- Utility

    private static func itemType(from item: Item) -> ItemType {
        return ItemType(rawValue: item.name) ?? .generic
    }
}

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

        switch itemType {
        case .agedBrie, .backstagePass:
            if item.quality < 50 {
                item.quality = item.quality + 1

                if itemType == .backstagePass {
                    if item.sellIn < 11 {
                        upgradeQuality(for: item)
                    }

                    if item.sellIn < 6 {
                        upgradeQuality(for: item)
                    }
                }
            }
        case .generic:
            degradeQuality(for: item)
        case .sulfuras:
            break
        }

        if itemType != .sulfuras {
            decreaseSellIn(for: item)
        }

        if item.sellIn < 0 {
            if itemType != .agedBrie {
                if itemType != .backstagePass {
                    if item.quality > 0 {
                        if itemType != .sulfuras {
                            item.quality = item.quality - 1
                        }
                    }
                } else {
                    item.quality = item.quality - item.quality
                }
            } else {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
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

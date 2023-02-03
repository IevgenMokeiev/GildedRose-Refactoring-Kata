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

        if itemType != .agedBrie, itemType != .backstagePass {
            if item.quality > 0 {
                if itemType != .sulfuras {
                    item.quality = item.quality - 1
                }
            }
        } else {
            if item.quality < 50 {
                item.quality = item.quality + 1

                if itemType == .backstagePass {
                    if item.sellIn < 11 {
                        if item.quality < 50 {
                            item.quality = item.quality + 1
                        }
                    }

                    if item.sellIn < 6 {
                        if item.quality < 50 {
                            item.quality = item.quality + 1
                        }
                    }
                }
            }
        }

        if itemType != .sulfuras {
            item.sellIn = item.sellIn - 1
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

    private static func itemType(from item: Item) -> ItemType {
        return ItemType(rawValue: item.name) ?? .generic
    }
}

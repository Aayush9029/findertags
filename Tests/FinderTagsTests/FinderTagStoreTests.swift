import Testing
@testable import findertags

struct FinderTagStoreTests {
    @Test
    func mergedTagsPreservesOrderAndDeduplicates() {
        let existing = ["Red", "Blue"]
        let adding = ["Blue", "Green", "Orange", "Green"]

        let merged = FinderTagStore.mergedTags(existing: existing, adding: adding)

        #expect(merged == ["Red", "Blue", "Green", "Orange"])
    }

    @Test
    func removedTagsRemovesMatchesOnly() {
        let existing = ["Red", "Blue", "Green"]
        let removing = ["Blue", "Orange"]

        let updated = FinderTagStore.removedTags(existing: existing, removing: removing)

        #expect(updated == ["Red", "Green"])
    }
}

import Testing
@testable import findertags

struct ListCommandTests {
    @Test
    func sortingByCountThenName() {
        let unsorted: [TagFrequency] = [
            .init(tag: "beta", count: 2),
            .init(tag: "alpha", count: 2),
            .init(tag: "zeta", count: 1),
        ]

        let sorted = unsorted.sorted { lhs, rhs in
            if lhs.count == rhs.count {
                return lhs.tag.localizedCaseInsensitiveCompare(rhs.tag) == .orderedAscending
            }
            return lhs.count > rhs.count
        }

        #expect(sorted.map(\.tag) == ["alpha", "beta", "zeta"])
    }
}

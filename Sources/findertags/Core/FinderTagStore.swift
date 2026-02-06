import Foundation

struct FinderTagStore {
    func readTags(at rawPath: String) throws -> TagRecord {
        let path = normalizedPath(rawPath)
        let url = URL(fileURLWithPath: path)
        try validateExists(url)

        let values = try url.resourceValues(forKeys: [.tagNamesKey])
        return TagRecord(path: rawPath, tags: values.tagNames ?? [])
    }

    func writeTags(_ tags: [String], at rawPath: String) throws {
        let path = normalizedPath(rawPath)
        let url = URL(fileURLWithPath: path)
        try validateExists(url)

        // URLResourceValues.tagNames setter is macOS 26+ in current SDKs.
        // setResourceValue(_:forKey:) preserves older deployment targets.
        let mutableURL = url as NSURL
        try mutableURL.setResourceValue(tags, forKey: .tagNamesKey)
    }

    func addTags(_ tags: [String], at rawPath: String) throws -> [String] {
        let existing = try readTags(at: rawPath).tags
        let updated = Self.mergedTags(existing: existing, adding: tags)
        try writeTags(updated, at: rawPath)
        return updated
    }

    func removeTags(_ tags: [String], at rawPath: String) throws -> [String] {
        let existing = try readTags(at: rawPath).tags
        let updated = Self.removedTags(existing: existing, removing: tags)
        try writeTags(updated, at: rawPath)
        return updated
    }

    func clearTags(at rawPath: String) throws {
        try writeTags([], at: rawPath)
    }

    static func mergedTags(existing: [String], adding: [String]) -> [String] {
        var seen = Set(existing)
        var merged = existing

        for tag in adding where !seen.contains(tag) {
            merged.append(tag)
            seen.insert(tag)
        }

        return merged
    }

    static func removedTags(existing: [String], removing: [String]) -> [String] {
        let removalSet = Set(removing)
        return existing.filter { !removalSet.contains($0) }
    }

    private func normalizedPath(_ path: String) -> String {
        (path as NSString).expandingTildeInPath
    }

    private func validateExists(_ url: URL) throws {
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw CLIError(message: "Path does not exist: \(url.path)")
        }
    }
}

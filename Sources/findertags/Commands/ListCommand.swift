import ArgumentParser
import Foundation

struct ListCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "list",
        abstract: "List tag frequencies across paths."
    )

    @Flag(name: .long, help: "Include count of untagged paths as _untagged_.")
    var all = false

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Paths to inspect.")
    var paths: [String] = []

    func run() throws {
        let store = FinderTagStore()
        var counts: [String: Int] = [:]
        var untaggedPaths = 0

        for path in paths {
            let record = try store.readTags(at: path)
            if record.tags.isEmpty {
                untaggedPaths += 1
            }
            for tag in record.tags {
                counts[tag, default: 0] += 1
            }
        }

        var frequencies = counts
            .map { TagFrequency(tag: $0.key, count: $0.value) }
            .sorted { lhs, rhs in
                if lhs.count == rhs.count {
                    return lhs.tag.localizedCaseInsensitiveCompare(rhs.tag) == .orderedAscending
                }
                return lhs.count > rhs.count
            }

        if all, untaggedPaths > 0 {
            frequencies.append(TagFrequency(tag: "_untagged_", count: untaggedPaths))
        }

        let output = try OutputFormatter.renderFrequencies(frequencies, format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

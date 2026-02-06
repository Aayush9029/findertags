import ArgumentParser

struct ReadCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "read",
        abstract: "Read tags for one or more paths."
    )

    @Flag(name: [.short, .long], help: "Include paths with no tags.")
    var verbose = false

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Paths to inspect.")
    var paths: [String] = []

    func run() throws {
        let store = FinderTagStore()
        var records: [TagRecord] = []

        for path in paths {
            let record = try store.readTags(at: path)
            if verbose || !record.tags.isEmpty {
                records.append(record)
            }
        }

        let output = try OutputFormatter.renderRecords(records, format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

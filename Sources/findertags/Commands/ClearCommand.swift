import ArgumentParser

struct ClearCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "clear",
        abstract: "Remove all tags from a path."
    )

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Path to clear.")
    var path: String

    func run() throws {
        let store = FinderTagStore()
        try store.clearTags(at: path)

        let output = try OutputFormatter.renderRecords([TagRecord(path: path, tags: [])], format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

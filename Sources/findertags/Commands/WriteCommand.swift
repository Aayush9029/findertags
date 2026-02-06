import ArgumentParser

struct WriteCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "write",
        abstract: "Replace tags on a path."
    )

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Path to update.")
    var path: String

    @Argument(help: "Tags to set (omit to clear).")
    var tags: [String] = []

    func run() throws {
        let store = FinderTagStore()
        try store.writeTags(tags, at: path)

        let output = try OutputFormatter.renderRecords([TagRecord(path: path, tags: tags)], format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

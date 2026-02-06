import ArgumentParser

struct RemoveCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "remove",
        abstract: "Remove one or more tags from a path."
    )

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Path to update.")
    var path: String

    @Argument(help: "Tags to remove.")
    var tags: [String]

    func validate() throws {
        if tags.isEmpty {
            throw ValidationError("Provide at least one tag to remove.")
        }
    }

    func run() throws {
        let store = FinderTagStore()
        let updated = try store.removeTags(tags, at: path)

        let output = try OutputFormatter.renderRecords([TagRecord(path: path, tags: updated)], format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

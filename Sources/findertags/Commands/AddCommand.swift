import ArgumentParser

struct AddCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "add",
        abstract: "Add tags to a path without duplicating existing tags."
    )

    @Option(name: .long, help: "Output format: text or json.")
    var format: OutputFormat = .text

    @Argument(help: "Path to update.")
    var path: String

    @Argument(help: "Tags to add.")
    var tags: [String]

    func validate() throws {
        if tags.isEmpty {
            throw ValidationError("Provide at least one tag to add.")
        }
    }

    func run() throws {
        let store = FinderTagStore()
        let updated = try store.addTags(tags, at: path)

        let output = try OutputFormatter.renderRecords([TagRecord(path: path, tags: updated)], format: format)
        if !output.isEmpty {
            print(output)
        }
    }
}

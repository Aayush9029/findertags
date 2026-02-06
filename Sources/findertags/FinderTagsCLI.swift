import ArgumentParser
import Foundation

@main
struct FinderTagsCLI: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "findertags",
        abstract: "Read and modify Finder tags from the command line.",
        version: AppVersion.current,
        subcommands: [
            ReadCommand.self,
            WriteCommand.self,
            AddCommand.self,
            RemoveCommand.self,
            ClearCommand.self,
            ListCommand.self,
        ]
    )
}

import Foundation

enum OutputFormatter {
    static func renderRecords(_ records: [TagRecord], format: OutputFormat) throws -> String {
        switch format {
        case .text:
            return records
                .map { [$0.path] + $0.tags }
                .map { $0.joined(separator: "\t") }
                .joined(separator: "\n")
        case .json:
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(records)
            guard let output = String(data: data, encoding: .utf8) else {
                throw CLIError(message: "Failed to encode output as UTF-8")
            }
            return output
        }
    }

    static func renderFrequencies(_ frequencies: [TagFrequency], format: OutputFormat) throws -> String {
        switch format {
        case .text:
            return frequencies
                .map { "\($0.tag)\t\($0.count)" }
                .joined(separator: "\n")
        case .json:
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(frequencies)
            guard let output = String(data: data, encoding: .utf8) else {
                throw CLIError(message: "Failed to encode output as UTF-8")
            }
            return output
        }
    }
}

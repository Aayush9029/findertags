import Foundation

struct CLIError: LocalizedError {
    let message: String

    var errorDescription: String? { message }
}

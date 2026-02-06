import Testing
@testable import findertags

struct OutputFormatterTests {
    @Test
    func renderRecordsAsText() throws {
        let records = [
            TagRecord(path: "file1", tags: ["Red", "Green"]),
            TagRecord(path: "file2", tags: []),
        ]

        let output = try OutputFormatter.renderRecords(records, format: .text)

        #expect(output == "file1\tRed\tGreen\nfile2")
    }

    @Test
    func renderRecordsAsJSON() throws {
        let records = [TagRecord(path: "file1", tags: ["Red"])]

        let output = try OutputFormatter.renderRecords(records, format: .json)

        #expect(output.contains("\"path\" : \"file1\""))
        #expect(output.contains("\"tags\" : ["))
    }

    @Test
    func renderFrequenciesAsText() throws {
        let frequencies = [
            TagFrequency(tag: "Red", count: 3),
            TagFrequency(tag: "Blue", count: 1),
        ]

        let output = try OutputFormatter.renderFrequencies(frequencies, format: .text)

        #expect(output == "Red\t3\nBlue\t1")
    }
}

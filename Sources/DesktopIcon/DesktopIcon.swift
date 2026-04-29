import ArgumentParser
import Foundation

@main
struct DesktopIcon: ParsableCommand {
    /// Help descriptions (and VSCode debug example) was grabbed from the Arch Wiki
    /// https://wiki.archlinux.org/title/Desktop_entries
    @Option(name: .shortAndLong, help: "The version of the desktop entry specification to which this file conforms")
    var version: String = "1.0"

    @Option(name: .shortAndLong, help: "The name of the application")
    var name: String

    // @Option(name: .shortAndLong, help: "A comment which can/will be used as a tooltip")
    // var comment: String = ""

    @Option(name: .shortAndLong, help: "The path to the folder in which the executable is run")
    var path: String

    @Option(name: .shortAndLong, help: "The executable of the application, possibly with arguments.")
    var exec: String

    @Option(name: .shortAndLong, help: "The name of the icon that will be used to display this entry")
    var icon: String

    @Option(name: .shortAndLong, help: "Describes the categories in which this entry should be shown")
    var categories: String

    @Flag(name: .shortAndLong, help: "Describes whether this application needs to be run in a terminal or not")
    var terminal: Bool = false

    @Flag(name: .shortAndLong)
    var dryRun: Bool = false

    func printEntry(content: String, directory: String) {
        print(content)
        print(directory)
    }

    mutating func run() throws {
        let environment = ProcessInfo.processInfo.environment
        let loc = ".local//share//applications"
        let entry = """
        [Desktop Entry]
        Type=Application
        Version=\(version)
        Name=\(name)
        Path=\(path)
        Exec=\(exec)
        Icon=\(icon)
        Terminal=\(terminal)
        Categories=\(categories)
        """
        let file = "\(environment["HOME"]!)//\(loc)//\(name).desktop"

        #if os(Linux)
            if !dryRun {
                if environment["HOME"] != nil {
                    do {
                        try entry.write(
                            toFile: file,
                            atomically: true,
                            encoding: .utf8
                        )
                    } catch {
                        print("Error: \\(error)")
                    }
                }
            } else {
                printEntry(content: entry, directory: file)
            }
        #else
            printEntry(content: entry, directory: file)
        #endif
    }
}

import ArgumentParser
import Foundation

@main
struct DesktopIcon: ParsableCommand {
    @Option
    var version: String = "1.0"

    @Option
    var name: String

    @Option
    var comment: String = ""

    @Option
    var path: String

    @Option
    var exec: String

    @Option
    var icon: String

    @Option
    var categories: String = ""
    
    @Flag
    var dryRun: Bool = true // For debugging

    mutating func run() throws {
        let environment = ProcessInfo.processInfo.environment
        let entry = """
        [Desktop Entry]
        Type=Application
        Version=\(version)
        Name=\(name)
        Comment=\(comment)
        Path=\(path)
        Exec=\(exec)
        Icon=\(icon)
        Terminal=false
        Categories=\(categories)
        """
 
        if !dryRun
        {
            if environment["HOME"] != nil {
                 do {
                     try entry.write(
                        toFile: "\(environment["HOME"]!)//Desktop",
                        atomically: true,
                        encoding: .utf8
                     )
                 } catch {
                     print("Error: \\(error)")
                 }
             }
        } else {
            print(entry)
            print("\(environment["HOME"]!)//Desktop")
        }
    }
}

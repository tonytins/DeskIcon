# DeskIcon

DeskIcon is a simple CLI tool for Linux that streamlines the process of making desktop entries.

## Usage

```shell
$deskicon [--version <version>] --name <name> --path <path> --exec <exec> --icon <icon> --categories <categories> [--terminal] [--dry-run]
```

```
OPTIONS:
  -v, --version <version> The version of the desktop entry specification to which this file conforms (default: 1.0)
  -n, --name <name>       The name of the application
  -p, --path <path>       The path to the folder in which the executable is run
  -e, --exec <exec>       The executable of the application, possibly with arguments.
  -i, --icon <icon>       The name of the icon that will be used to display this entry
  -c, --categories <categories>
                          Describes the categories in which this entry should be shown
  -t, --terminal          Describes whether this application needs to be run in a terminal or not
  -d, --dry-run
```


## License

I license this project under the GPL-3.0 license - see [LICENSE](LICENSE) for details.
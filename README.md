# Package Repository for SpecFlow

Official package repository for [SpecFlow](https://github.com/maneeshchaturvedi/specflow) - supporting Homebrew (macOS/Linux) and Chocolatey (Windows).

## Installation

### macOS/Linux (Homebrew)

```bash
brew tap maneeshchaturvedi/specflow
brew install specflow
```

### Windows (Chocolatey)

Download the latest `.nupkg` file from [releases](https://github.com/maneeshchaturvedi/homebrew-specflow/releases) and install:

```powershell
# Navigate to the directory containing the .nupkg file
choco install specflow-cli -s . -y
```

Or using PowerShell to download and install:

```powershell
# Replace with the desired version
$version = "1.1.0-alpha"
$url = "https://github.com/maneeshchaturvedi/homebrew-specflow/releases/download/v$version/specflow-cli.$version.nupkg"
Invoke-WebRequest -Uri $url -OutFile "specflow-cli.$version.nupkg"
choco install specflow-cli -s . -y
```

## About SpecFlow

Add tests and documentation to legacy code automatically - as you work.

SpecFlow lets you safely use AI assistants on legacy codebases by automatically generating specifications and tests. No big-bang refactoring required.

### Features

- 🔄 **Cold-Start** - Auto-generate specs from existing legacy code
- 🧪 **Test Generation** - Comprehensive tests with property-based testing
- 📊 **80/20 Rule** - Cover the 20% of code that changes 80% of the time
- 📚 **Living Documentation** - Version history shows WHY decisions were made
- 🛡️ **Drift Detection** - Prevents AI from breaking existing requirements

## Links

- [Documentation](https://github.com/maneeshchaturvedi/specflow)
- [Issues](https://github.com/maneeshchaturvedi/specflow/issues)

## License

MIT

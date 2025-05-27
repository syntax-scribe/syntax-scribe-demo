# Syntax Scribe Demo - VueUse Documentation Generation

This demo showcases **Syntax Scribe** by automatically generating comprehensive documentation for the popular [VueUse](https://github.com/vueuse/vueuse) library. Watch as Syntax Scribe analyzes the entire codebase and creates beautiful, navigable documentation in minutes.

## What This Demo Does

The demo script will:
1. **Clone** the VueUse repository (a real-world Vue.js utility library)
2. **Analyze** the entire codebase using Syntax Scribe
3. **Generate** structured documentation with automatic navigation
4. **Serve** the documentation locally for immediate viewing
5. **Showcase** Syntax Scribe's ability to handle complex, production codebases

## Prerequisites

Before running the demo, ensure you have:

### Required Dependencies
- **Python 3.x** or **Python 2.x** (for documentation serving)
- **Git** (for cloning the repository)
- **Syntax Scribe CLI** (the star of the show!) - syntax scribe can be installed with `npm install -g syntax-scribe`

### Installation Check
The script will automatically verify these dependencies and provide helpful error messages if anything is missing.

### License Configuration ⚠️

**Important:** You must configure the license before running the demo.

**Option 1 - Set Environment Variable (Recommended):**
```bash
export LICENSE="your-license-key-here"
./demo-vueuse.sh
```

**Option 2 - Edit the Script:**
Open `demo-vueuse.sh` and update the `DEFAULT_LICENSE` value:
```bash
readonly DEFAULT_LICENSE="your-license-key-here"
```

*Replace `"your-license-key-here"` with your actual Syntax Scribe license key.*

## Quick Start

1. **Clone this demo repository:**
```bash
git clone <your-demo-repo-url>
cd syntax-scribe-demo
```

2. **Set your license** (see License Configuration above)

3. **Run the demo:**
```bash
chmod +x demo-vueuse.sh
./demo-vueuse.sh
```

4. **View the results:**
   - The script will automatically serve the documentation
   - Open your browser to `http://localhost:8000`
   - Explore the generated documentation structure

## What to Expect

### Runtime
- **Setup & Cloning:** ~30 seconds
- **Documentation Generation:** 2-5 minutes (depending on system)
- **Total Time:** ~5 minutes

### Generated Output
The demo creates documentation featuring:
- **Automatic API extraction** from TypeScript/JavaScript code
- **Structured navigation** organized by modules and functions
- **Code examples** and usage patterns
- **Cross-references** between related utilities
- **Search functionality** for quick discovery

### Directory Structure
```
~/syntax-scribe-demo/
├── vueuse/              # Cloned source code
└── vueuse-docs/         # Generated documentation
    ├── docs/            # Markdown documentation files
    ├── mkdocs.yml       # Documentation configuration
    └── site/            # Built static site (after serving)
```

## Troubleshooting

### Common Issues

**"Python is not installed"**
- Install Python 3: `brew install python3` (macOS) or `sudo apt install python3` (Ubuntu)

**"syntax-scribe command not found"**
- Ensure Syntax Scribe CLI is installed and in your PATH
- Verify installation: `syntax-scribe --version`
- syntax scribe can be installed with `npm install -g syntax-scribe`

**"License validation failed"**
- Double-check your license key
- Ensure no extra spaces or characters
- Contact support if issues persist

### Clean Restart
If something goes wrong, the script automatically cleans up. To manually reset:
```bash
rm -rf ~/syntax-scribe-demo
```

## Why VueUse?

We chose VueUse for this demo because it:
- **Real-world complexity:** 200+ utility functions across multiple modules
- **TypeScript heavy:** Showcases Syntax Scribe's TypeScript analysis
- **Well-documented source:** Highlights how Syntax Scribe enhances existing docs
- **Popular project:** Something developers recognize and can evaluate meaningfully

## Next Steps

After exploring the generated VueUse documentation:

1. **Try with your own codebase:** Use the same Syntax Scribe commands on your projects
2. **Customize the output:** Explore Syntax Scribe's configuration options
3. **Integrate into CI/CD:** Automate documentation generation in your workflow

## Questions or Feedback?

- **Documentation:** [Syntax Scribe docs](https://syntax-scribe.github.io/syntax-scribe-docs/)


---

*This demo generates documentation for VueUse to showcase Syntax Scribe's capabilities. VueUse is developed by Anthony Fu and contributors under the MIT license.*
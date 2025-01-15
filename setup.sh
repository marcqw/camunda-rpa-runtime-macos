#!/bin/bash

# Check if the system is macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "❌ This script is designed to run on macOS. Exiting..."
    exit 1
fi

# Minimum required versions
MIN_PYTHON_VERSION="3.7"
MIN_PYTHON3_VERSION="3.9"
MIN_HOMEBREW_VERSION="3.0.0"
MIN_RUST_VERSION="1.65.0"
MIN_NODEJS_VERSION="16.0.0"

echo "✨ Checking installed versions..."

# Check if Python is installed and its version
if command -v python3 &>/dev/null; then
    INSTALLED_PYTHON_VERSION=$(python3 --version | awk '{print $2}')
    echo "🐍 Python 3 is installed: $INSTALLED_PYTHON_VERSION"
    if [[ "$(echo -e "$MIN_PYTHON3_VERSION\n$INSTALLED_PYTHON_VERSION" | sort -V | head -n1)" != "$MIN_PYTHON3_VERSION" ]]; then
        echo "⚠️ Your Python version is lower than the required version $MIN_PYTHON3_VERSION. Updating..."
        brew install python3
    fi
else
    echo "❌ Python 3 is not installed. Installing..."
    brew install python3
fi

# Check if Homebrew is installed
if command -v brew &>/dev/null; then
    INSTALLED_HOMEBREW_VERSION=$(brew --version | head -n1 | awk '{print $2}')
    echo "🍺 Homebrew is installed: $INSTALLED_HOMEBREW_VERSION"
    if [[ "$(echo -e "$MIN_HOMEBREW_VERSION\n$INSTALLED_HOMEBREW_VERSION" | sort -V | head -n1)" != "$MIN_HOMEBREW_VERSION" ]]; then
        echo "⚠️ Your Homebrew version is lower than the required version $MIN_HOMEBREW_VERSION. Updating..."
        brew update
    fi
else
    echo "❌ Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if Rust is installed and its version
if command -v rustc &>/dev/null; then
    INSTALLED_RUST_VERSION=$(rustc --version | awk '{print $2}')
    echo "🦀 Rust is installed: $INSTALLED_RUST_VERSION"
    if [[ "$(echo -e "$MIN_RUST_VERSION\n$INSTALLED_RUST_VERSION" | sort -V | head -n1)" != "$MIN_RUST_VERSION" ]]; then
        echo "⚠️ Your Rust version is lower than the required version $MIN_RUST_VERSION. Updating..."
        brew install rust
    fi
else
    echo "❌ Rust is not installed. Installing..."
    brew install rust
fi

# Check if Node.js is installed and its version
if command -v node &>/dev/null; then
    INSTALLED_NODE_VERSION=$(node --version | sed 's/v//')
    echo "🚀 Node.js is installed: $INSTALLED_NODE_VERSION"
    if [[ "$(echo -e "$MIN_NODEJS_VERSION\n$INSTALLED_NODE_VERSION" | sort -V | head -n1)" != "$MIN_NODEJS_VERSION" ]]; then
        echo "⚠️ Your Node.js version is lower than the required version $MIN_NODEJS_VERSION. Updating..."
        brew install node
    fi
else
    echo "❌ Node.js is not installed. Installing..."
    brew install node
fi

# Check if npm is installed
if command -v npm &>/dev/null; then
    echo "📦 npm is installed"
else
    echo "❌ npm is not installed. Installing..."
    brew install npm
fi

# Check if pip is installed
if command -v pip &>/dev/null; then
    echo "📜 pip is installed"
else
    echo "❌ pip is not installed. Installing..."
    brew install python3
fi

# Create and activate virtual environment
echo "🛠 Creating virtual environment..."
python3 -m venv .venv
echo "🔑 Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
echo "📥 Installing dependencies from requirements.txt..."
pip install -r requirements.txt --no-deps

# Initialize rfbrowser
echo "🌐 Initializing rfbrowser..."
rfbrowser init

# Reminder to complete the dev.env file
echo "⚠️ Please complete the dev.env file before continuing."
echo "Press Enter once you have completed dev.env."
read -p "Press Enter to continue..."

# Copy dev.env to .env
echo "📂 Copying dev.env to .env..."
cp dev.env .env

# Final message
echo "🎉 XXX"

#!/bin/bash

# ─────────────────────────────────────────────────────────────────────────────
# Synup Notetaker — Setup Part 1 of 2
# Run this BEFORE restarting your Mac
# ─────────────────────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║      Synup Notetaker — Setup Part 1 of 2                ║${NC}"
echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# ── Step 1: Architecture check ────────────────────────────────────────────────
echo -e "${BOLD}[Step 1/4] Checking Mac compatibility...${NC}"

ARCH=$(uname -m)
if [ "$ARCH" != "arm64" ]; then
    echo ""
    echo -e "${RED}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║                ❌  INCOMPATIBLE MAC                     ║${NC}"
    echo -e "${RED}╠══════════════════════════════════════════════════════════╣${NC}"
    echo -e "${RED}║  Synup Notetaker only runs on Apple Silicon Macs.       ║${NC}"
    echo -e "${RED}║  Your Mac has an Intel chip and is not supported.       ║${NC}"
    echo -e "${RED}║  Please contact the Sales Ops team for help.            ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    exit 1
fi
echo -e "${GREEN}  ✅  Apple Silicon Mac detected.${NC}"
echo ""

# ── Step 2: Homebrew ──────────────────────────────────────────────────────────
echo -e "${BOLD}[Step 2/4] Checking for Homebrew...${NC}"

if command -v brew &>/dev/null; then
    echo -e "${GREEN}  ✅  Homebrew already installed. Skipping.${NC}"
else
    echo -e "${YELLOW}  ⚠️   Homebrew not found. Installing now...${NC}"
    echo ""
    echo -e "${BOLD}${YELLOW}╔══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${YELLOW}║                 🔐  PASSWORD REQUIRED                   ║${NC}"
    echo -e "${BOLD}${YELLOW}╠══════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BOLD}${YELLOW}║  Apple security requires your Mac password.             ║${NC}"
    echo -e "${BOLD}${YELLOW}║  When prompted by a 🔑 key icon:                        ║${NC}"
    echo -e "${BOLD}${YELLOW}║    1. Type your Mac login password                      ║${NC}"
    echo -e "${BOLD}${YELLOW}║    2. Press Enter                                       ║${NC}"
    echo -e "${BOLD}${YELLOW}║  NOTE: You will NOT see characters as you type.         ║${NC}"
    echo -e "${BOLD}${YELLOW}╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    if ! command -v brew &>/dev/null; then
        echo -e "${RED}  ❌  Homebrew installation failed. Visit https://brew.sh and try again.${NC}"
        exit 1
    fi
    echo -e "${GREEN}  ✅  Homebrew installed.${NC}"
fi
echo ""

# ── Step 3: Install audio drivers ────────────────────────────────────────────
echo -e "${BOLD}[Step 3/4] Installing audio drivers...${NC}"

echo -e "${CYAN}  Installing BlackHole 2ch...${NC}"
brew install --cask blackhole-2ch
if [ $? -ne 0 ]; then
    echo -e "${RED}  ❌  BlackHole installation failed. Please try again.${NC}"
    exit 1
fi
echo -e "${GREEN}  ✅  BlackHole 2ch installed.${NC}"

echo -e "${CYAN}  Installing SwitchAudioSource...${NC}"
brew install switchaudio-osx
if [ $? -ne 0 ]; then
    echo -e "${RED}  ❌  SwitchAudioSource installation failed. Please try again.${NC}"
    exit 1
fi
echo -e "${GREEN}  ✅  SwitchAudioSource installed.${NC}"
echo ""

# ── Step 4: Done — restart required ──────────────────────────────────────────
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${GREEN}║           ✅  PART 1 COMPLETE — RESTART REQUIRED            ║${NC}"
echo -e "${BOLD}${GREEN}╠══════════════════════════════════════════════════════════════╣${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  Audio drivers installed successfully.                      ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  YOU MUST RESTART YOUR MAC NOW.                             ║${NC}"
echo -e "${BOLD}${GREEN}║  BlackHole will not work until you restart.                 ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  After restarting, open Terminal and run Part 2:            ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  curl -fsSL https://raw.githubusercontent.com/synup/       ║${NC}"
echo -e "${BOLD}${GREEN}║  notetaker-setup/main/setup_part2.sh | bash                 ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

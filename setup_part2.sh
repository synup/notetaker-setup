#!/bin/bash

# ─────────────────────────────────────────────────────────────────────────────
# Synup Notetaker — Setup Part 2 of 2
# Run this AFTER restarting your Mac
# ─────────────────────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║      Synup Notetaker — Setup Part 2 of 2                ║${NC}"
echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""

# ── Step 1: Verify BlackHole is active after restart ─────────────────────────
echo -e "${BOLD}[Step 1/4] Verifying BlackHole is active...${NC}"

if system_profiler SPAudioDataType 2>/dev/null | grep -q "BlackHole"; then
    echo -e "${GREEN}  ✅  BlackHole 2ch is active.${NC}"
else
    echo -e "${YELLOW}  ⚠️   BlackHole not detected. Make sure you restarted your Mac after Part 1.${NC}"
    echo -e "${YELLOW}      If you did restart, try running Part 1 again: curl -fsSL https://raw.githubusercontent.com/synup/notetaker-setup/main/setup_part1.sh | bash${NC}"
fi
echo ""

# ── Step 2: Open Audio MIDI Setup ────────────────────────────────────────────
echo -e "${BOLD}[Step 2/4] Opening Audio MIDI Setup...${NC}"
open -a "Audio MIDI Setup"
sleep 2

echo ""
echo -e "${BOLD}${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${CYAN}║        🎧  MANUAL STEPS IN AUDIO MIDI SETUP                 ║${NC}"
echo -e "${BOLD}${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}║  Follow these steps in the Audio MIDI Setup window:         ║${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}║  1. Click [ + ] bottom left → Create Multi-Output Device    ║${NC}"
echo -e "${BOLD}${CYAN}║  2. Check: BlackHole 2ch                                    ║${NC}"
echo -e "${BOLD}${CYAN}║  3. Check: MacBook Air Speakers                             ║${NC}"
echo -e "${BOLD}${CYAN}║  4. Set BlackHole 2ch as Master Device (clock checkbox)     ║${NC}"
echo -e "${BOLD}${CYAN}║  5. Turn on Drift Correction for MacBook Air Speakers       ║${NC}"
echo -e "${BOLD}${CYAN}║  6. Rename the device EXACTLY to:                           ║${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}║              >>>  Synup Recording  <<<                      ║${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}║  7. Right-click it → Use This Device For Sound Output       ║${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}║  When done, come back here and press Enter to continue.     ║${NC}"
echo -e "${BOLD}${CYAN}║                                                              ║${NC}"
echo -e "${BOLD}${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
read -p "  Press Enter when Audio MIDI Setup is done..."
echo ""

# ── Step 3: Set system audio output ──────────────────────────────────────────
echo -e "${BOLD}[Step 3/4] Setting audio output to Synup Recording...${NC}"

if /usr/local/bin/SwitchAudioSource -s "Synup Recording" -t output 2>/dev/null; then
    echo -e "${GREEN}  ✅  Audio output set to Synup Recording automatically.${NC}"
else
    echo -e "${YELLOW}  ⚠️   Could not auto-set audio output. Please do it manually:${NC}"
    echo -e "${YELLOW}      System Settings → Sound → Output → Synup Recording${NC}"
fi
echo ""

# ── Step 4: Download and install the app ─────────────────────────────────────
echo -e "${BOLD}[Step 4/4] Downloading Synup Notetaker...${NC}"
echo -e "${CYAN}  Downloading SynupNotetaker.dmg...${NC}"

DMG_URL="https://drive.google.com/uc?export=download&id=1sMdTCaaqLItHK-STt3dZQCL_oZtFOTRe"
DMG_PATH="$HOME/Downloads/SynupNotetaker.dmg"

curl -L -o "$DMG_PATH" "$DMG_URL" 2>/dev/null

if [ -f "$DMG_PATH" ]; then
    echo -e "${GREEN}  ✅  Downloaded to ~/Downloads/SynupNotetaker.dmg${NC}"
    echo -e "${CYAN}  Opening installer...${NC}"
    open "$DMG_PATH"
else
    echo -e "${YELLOW}  ⚠️   Auto-download failed. Please download SynupNotetaker.dmg from the link your manager sent and open it manually.${NC}"
fi
echo ""

# ── Done ──────────────────────────────────────────────────────────────────────
echo -e "${BOLD}${GREEN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}${GREEN}║                  ✅  SETUP COMPLETE!                        ║${NC}"
echo -e "${BOLD}${GREEN}╠══════════════════════════════════════════════════════════════╣${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  Final steps:                                               ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  1. Open SynupNotetaker from the DMG                        ║${NC}"
echo -e "${BOLD}${GREEN}║  2. Drag it to Applications                                 ║${NC}"
echo -e "${BOLD}${GREEN}║  3. Open it → click Allow on mic permission popup           ║${NC}"
echo -e "${BOLD}${GREEN}║  4. Click ⚫ menu bar icon → Sign in with Google            ║${NC}"
echo -e "${BOLD}${GREEN}║  5. Sign in with your @synup.com account                    ║${NC}"
echo -e "${BOLD}${GREEN}║                                                              ║${NC}"
echo -e "${BOLD}${GREEN}║  You are all set! 🎉                                        ║${NC}"
echo -e "${BOLD}${GREEN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Synup Notetaker — Setup

Two-step setup for Synup sales reps. Run these commands in Terminal.

## Requirements
- Apple Silicon Mac (M1, M2, M3, or M4)
- macOS 12 or later
- Google Chrome

---

## Step 1 — Before restarting (run this first)

Open Terminal and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/synup/notetaker-setup/main/setup_part1.sh | bash
```

When it says **RESTART REQUIRED** → restart your Mac.

---

## Step 2 — After restarting (run this after restart)

Open Terminal and paste:

```bash
curl -fsSL https://raw.githubusercontent.com/synup/notetaker-setup/main/setup_part2.sh | bash
```

Follow the on-screen instructions to complete Audio MIDI Setup, then install the app.

---

## What these scripts do

**Part 1:**
- Checks your Mac is Apple Silicon
- Installs Homebrew (if needed)
- Installs BlackHole 2ch audio driver
- Installs SwitchAudioSource

**Part 2:**
- Verifies BlackHole is active
- Opens Audio MIDI Setup and guides you through creating "Synup Recording"
- Automatically sets your audio output to "Synup Recording"
- Downloads and opens SynupNotetaker.dmg

---

## Support

Post in #crm-updates on Slack or contact the Sales Ops team.

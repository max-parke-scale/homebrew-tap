# homebrew-tap

Homebrew tap for **ccfeed** — a live viewer for Claude Code session JSONL.

## Install

    export HOMEBREW_CASK_OPTS=--no-quarantine   # ccfeed is unsigned; add to your shell profile
    brew tap max-parke-scale/homebrew-tap
    brew install --cask ccfeed

## Updating

    brew upgrade --cask ccfeed

Background (scheduled) updates:

    brew tap homebrew/autoupdate
    brew autoupdate start 43200 --upgrade   # every 12h

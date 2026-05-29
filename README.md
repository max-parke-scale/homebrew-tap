# homebrew-tap

Private Homebrew tap for **ccfeed** (live Claude Code JSONL viewer).

## One-time setup
You need read access to this repo (ask max to add you) and a GitHub token.

    export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"   # or a PAT w/ repo scope; add to your shell profile
    export HOMEBREW_CASK_OPTS=--no-quarantine             # ccfeed is unsigned; add to your shell profile too
    brew tap max-parke-scale/homebrew-tap git@github.com:max-parke-scale/homebrew-tap.git
    brew install --cask ccfeed

## Updating
    brew upgrade --cask ccfeed

Background (scheduled) updates:

    brew tap homebrew/autoupdate
    brew autoupdate start 43200 --upgrade   # every 12h

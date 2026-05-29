cask "ccfeed" do
  version "0.1.1"
  sha256 "67395c84096fe31fe5c3436ada3c5fc8ec4ddd0b3412776bec95af2b4c92b348"

  url "https://github.com/max-parke-scale/homebrew-tap/releases/download/v#{version}/ccfeed-#{version}.zip"
  name "ccfeed"
  desc "Live JSONL feed viewer for Claude Code sessions"
  homepage "https://github.com/max-parke-scale/ccfeed"

  app "Ccfeed.app"

  zap trash: ["~/.config/ccfeed"]
end

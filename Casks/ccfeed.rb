cask "ccfeed" do
  version "0.1.0"
  sha256 "fed7134aa7bb0eb7c2f9c86d7146b7f85d6d03ea0cbeb86a8fe51fdfe292b733"

  url "https://github.com/max-parke-scale/homebrew-tap/releases/download/v#{version}/ccfeed-#{version}.zip"
  name "ccfeed"
  desc "Live JSONL feed viewer for Claude Code sessions"
  homepage "https://github.com/max-parke-scale/ccfeed"

  app "Ccfeed.app"

  zap trash: ["~/.config/ccfeed"]
end

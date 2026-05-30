cask "ccfeed" do
  version "0.1.2"
  sha256 "33cd8b9c4fd13ad8188df63b95a0b0cef011c9c40222291357b5d864f28b8a50"

  url "https://github.com/max-parke-scale/homebrew-tap/releases/download/v#{version}/ccfeed-#{version}.zip"
  name "ccfeed"
  desc "Live JSONL feed viewer for Claude Code sessions"
  homepage "https://github.com/max-parke-scale/ccfeed"

  app "Ccfeed.app"

  zap trash: ["~/.config/ccfeed"]
end

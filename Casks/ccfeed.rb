cask "ccfeed" do
  version "0.2.1"
  sha256 "035ffae73eb05c7d576ea9b61aa5ea67e4e0f611f9d948b6007c30f8c46ab143"

  url "https://github.com/max-parke-scale/homebrew-tap/releases/download/v#{version}/ccfeed-#{version}.zip"
  name "ccfeed"
  desc "Live JSONL feed viewer for Claude Code sessions"
  homepage "https://github.com/max-parke-scale/ccfeed"

  app "Ccfeed.app"

  # Unsigned app: strip macOS quarantine post-install so it isn't flagged "damaged".
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Ccfeed.app"]
  end

  zap trash: ["~/.config/ccfeed"]
end

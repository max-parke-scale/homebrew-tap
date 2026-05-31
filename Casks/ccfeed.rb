cask "ccfeed" do
  version "0.2.0"
  sha256 "e81dba039a361c519dd4ffe4623bffb10d0df387c9145f8018d96d0f2e88ff4d"

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

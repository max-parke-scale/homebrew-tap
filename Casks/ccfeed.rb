cask "ccfeed" do
  version "0.3.0"
  sha256 "7673351c6becdb1f21ff554b84b53bd96b0edc6093e2351c45975ff8dc1a3fa9"

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

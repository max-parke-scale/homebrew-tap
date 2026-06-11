cask "ccfeed" do
  version "0.3.1"
  sha256 "94d2838ef67341b7e38705ecfe5c1081047c7e2d3b7b7f9220316b0c07597798"

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

cask "ccfeed" do
  version "0.3.2"
  sha256 "c114e8ab7bc029f72624745fe35a8d7c6e297ec6a29a5029c955c0bc5b83ecd8"

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

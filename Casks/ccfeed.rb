require "download_strategy"

# Pulls a release asset from a PRIVATE GitHub repo via HOMEBREW_GITHUB_API_TOKEN.
class GitHubPrivateRepositoryReleaseDownloadStrategy < CurlDownloadStrategy
  require "utils/github"

  def initialize(url, name, version, **meta)
    super
    @github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"]
    raise CurlDownloadStrategyError, "Set HOMEBREW_GITHUB_API_TOKEN (e.g. export HOMEBREW_GITHUB_API_TOKEN=$(gh auth token))." if @github_token.to_s.empty?
    unless @url =~ %r{https://github.com/([^/]+)/([^/]+)/releases/download/([^/]+)/(\S+)}
      raise CurlDownloadStrategyError, "Invalid GitHub release URL: #{@url}"
    end
    @owner, @repo, @tag, @filename = Regexp.last_match.captures
  end

  def fetch(timeout: nil)
    rel = GitHub.open_api("https://api.github.com/repos/#{@owner}/#{@repo}/releases/tags/#{@tag}")
    asset = rel["assets"].find { |a| a["name"] == @filename }
    raise CurlDownloadStrategyError, "Asset #{@filename} not found in #{@tag}" unless asset
    @asset_url = "https://api.github.com/repos/#{@owner}/#{@repo}/releases/assets/#{asset["id"]}"
    super
  end

  private

  def _fetch(url:, resolved_url:, timeout:)
    curl_download(@asset_url,
                  "--header", "Accept: application/octet-stream",
                  "--header", "Authorization: token #{@github_token}",
                  to: temporary_path, timeout: timeout)
  end
end

cask "ccfeed" do
  version "0.1.0"
  sha256 "fed7134aa7bb0eb7c2f9c86d7146b7f85d6d03ea0cbeb86a8fe51fdfe292b733"

  url "https://github.com/max-parke-scale/homebrew-tap/releases/download/v#{version}/ccfeed-#{version}.zip",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  name "ccfeed"
  desc "Live JSONL feed viewer for Claude Code sessions"
  homepage "https://github.com/max-parke-scale/ccfeed"

  app "Ccfeed.app"

  zap trash: ["~/.config/ccfeed"]
end

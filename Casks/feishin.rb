cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "01d3fe12d52a6eb4908125954b4a0486770574b3b37984769982d53a70e8b126",
         intel: "d0894f0a0a91254cc6e4baaea51358948b73d17ff4ac547a8c5570f3100d9c3f"

  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Feishin.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/feishin",
    "#{Dir.home}/Library/Logs/feishin",
    "#{Dir.home}/Library/Preferences/org.jeffvli.feishin.plist",
    "#{Dir.home}/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end

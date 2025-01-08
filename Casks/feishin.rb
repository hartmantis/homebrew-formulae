cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.12.1"
  sha256 arm:   "5303e9724e157545b09e9d65fb4ebeec8b11f23a9e52d6c6fb79ff4134d07638",
         intel: "4fd31f96aa3cd160adeb134d54fb36056e204cc38cb278c9802a8c285a9ce43e"

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

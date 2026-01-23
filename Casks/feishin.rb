cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "008defb34cdcd0c19bed801bf7df2e9961a67ded656908608f8b7e918117117e",
         intel: "bc6e91db4639096ec02634ab93d6ae0f2f144f91af3594766c7b96ab133952ca"

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

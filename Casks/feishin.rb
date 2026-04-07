cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.11.0"
  sha256 arm:   "ab8ba2e13f33187e9df3f825e61e9c275cfd7b6f09d5ee5a9b4b476c37918b56",
         intel: "f1dd657dac2e17ca3498e758485477e8002ef75b5d24034760f67f1e9a447fb8"

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

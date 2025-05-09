cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.12.6"
  sha256 arm:   "9f3aba5bf08a4d88cbe2d06a5876376dc92750197b7df3a2b9c48b20af04ddb4",
         intel: "dab0c9c84471cfccd5fb7ba70e4ed8431c6c8e9ed94dc25ff48179ae962772bb"

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

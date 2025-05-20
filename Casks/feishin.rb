cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.12.7"
  sha256 arm:   "d7f9c8ab0c48f5b2c815c0f7496ecdb224c81902b46f464a5725b4a3e4c341e6",
         intel: "a969df804dad457c109ed3b2a6959516fdaaae688b16fdbaed4e260dea50f1da"

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

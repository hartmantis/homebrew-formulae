cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.22.0"
  sha256 arm:   "27eed524b7ab8d9c498d25e4bad3c94bd977db6dc33fa9612441365fbb96adb5",
         intel: "f49adc1204274db8f1f034cc42323c8c6ff53b594acc5da614812ebc0daaff60"

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

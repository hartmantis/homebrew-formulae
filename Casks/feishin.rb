cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "9442e7e280e3681a25d13a44aafa21c81bd4921270677459bcedf699c76c668c",
         intel: "d2ce2e738f9d18558056171a36107238927e05e288d00b009fad87ee756674e4"

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

cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "01bd2db2b0bad48ef7002396d71efd82c80cd5e2775a6d2015dc41408012c24c",
         intel: "cdc191eb7d935d4a5955749b0086bd73ac954ad96307ab5ad52e4c4bb57be7d1"

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

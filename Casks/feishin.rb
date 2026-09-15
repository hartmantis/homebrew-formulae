cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0"
  sha256 arm:   "48d3f97408b616ca6a4262371a7daefda2ea29d6922717dede40fbf91ffb31b8",
         intel: "f2bce58dcb3ef9e05c014f695862cd106181835b869db7634a68cd98cf959c67"

  url "https://github.com/jeffvli/feishin/releases/download/v#{version}/Feishin-#{version}-mac-#{arch}.dmg"
  name "Feishin"
  desc "Modern self-hosted music player"
  homepage "https://github.com/jeffvli/feishin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Feishin.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/feishin",
    "#{Dir.home}/Library/Logs/feishin",
    "#{Dir.home}/Library/Preferences/org.jeffvli.feishin.plist",
    "#{Dir.home}/Library/Saved Application State/org.jeffvli.feishin.savedState",
  ]
end

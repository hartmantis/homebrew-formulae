cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.12.2"
  sha256 arm:   "d73b51bb81e2b609cea2a0c1d702374defadf8a6ab3bb1142aa338773803888f",
         intel: "1d6cd6c0e54cd80b8ee2eb53714b29adb55faa863767e8ad4993c0983cff47dd"

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

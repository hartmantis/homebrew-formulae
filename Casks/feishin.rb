cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.18.0"
  sha256 arm:   "52827eb448603459d54d42cef6453a1f0398b0f8ad871d1fb9ce9c318519fecf",
         intel: "1e67b3b8a47c3804b920bec67ad825086869b2ffbf6f15fa502c1d4aa63825d7"

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

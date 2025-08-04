cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.19.0"
  sha256 arm:   "8e78cc711928376e00133f424e69ab1981ea0f114e5d0d9e5faafb3e49d27676",
         intel: "c945869c7c6f31439921660a8e3bd7bbc665f95f848e285ca53d8347b86ff231"

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

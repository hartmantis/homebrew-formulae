cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.4.2"
  sha256 arm:   "89a1384c572ed7dc4064c80cefcf9bb0a6c6f56e86f53f706e488b535dbb68af",
         intel: "d3f3989ed84915267d1c6ee1c711735e9a7e7b66bab155edd4458ab794683861"

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

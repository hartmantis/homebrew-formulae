cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "0.17.0"
  sha256 arm:   "eb1acc945e5a7f2465a830f694310cd0612712e51663b477e1e53e9a68c33440",
         intel: "661d81c83642cf301b325c05281be413a0c31120d0eb5188628f3c5a671a9ae1"

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

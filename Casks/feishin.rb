cask "feishin" do
  arch arm: "arm64", intel: "x64"

  version "1.12.1"
  sha256 arm:   "d8b7aa99aee82cccc8a8155ed600fcafdb53af4f2928b22a49e7d89401e918a5",
         intel: "9f0ebb8f97e2fab5d99c381410227b4b218d69f54f22a3b1595cf97986bdf0f0"

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

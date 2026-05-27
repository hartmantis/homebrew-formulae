cask "firebot" do
  arch arm: "arm64", intel: "x64"

  version "5.66.4"
  sha256 arm:   "997aa5a1f6e6a127678dfd0624f2d6c781da68a795900f57a2b0903721622085",
         intel: "886b0ed13b28a828b7c13b98c6fae4701882416a5f8734b58679625c926a85c2"

  url "https://github.com/crowbartools/Firebot/releases/download/v#{version}/firebot-v#{version}-macos-#{arch}.dmg",
      verified: "github.com/crowbartools/Firebot/"
  name "Firebot"
  desc "All-in-one bot for Twitch streamers"
  homepage "https://firebot.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Firebot.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Firebot",
    "#{Dir.home}/Library/Application Support/firebotv#{version.split(".").first}",
    "#{Dir.home}/Library/Preferences/com.electron.firebot.plist",
    "#{Dir.home}/Library/Saved Application State/com.electron.firebot.savedState",
  ]

  caveats do
    requires_rosetta
  end
end

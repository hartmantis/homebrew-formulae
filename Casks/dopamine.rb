cask "dopamine" do
  version "3.0.0-preview.39"
  sha256 "fb44c48fdfe2b6312a4cf30aa30d3e0f6bfcd19c592e6e5b2cca1a5b45190788"

  url "https://github.com/digimezzo/dopamine/releases/download/v#{version}/Dopamine-#{version}.dmg"
  name "Dopamine"
  desc "Elegant multi-platform audio player"
  homepage "https://github.com/digimezzo/dopamine"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dopamine.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Dopamine",
    "#{Dir.home}/Library/Preferences/com.digimezzo.dopamine.plist",
    "#{Dir.home}/Library/Saved Application State/com.digimezzo.dopamine.savedState",
  ]
end

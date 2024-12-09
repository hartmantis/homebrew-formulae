cask "dopamine" do
  version "3.0.0-preview.37"
  sha256 "6ef5975cb14badf17922d3e33d6bde80b094cdde2d617a90b3c3e5fd7bca46c6"

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

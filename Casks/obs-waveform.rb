cask "obs-waveform" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.0"

  name "OBS Waveform"
  desc "An audio spectral analysis plugin for OBS Studio"
  homepage "https://obsproject.com/forum/resources/waveform.1423"
  url "https://github.com/phandasm/waveform/releases/download/v#{version}/Waveform_v#{version}_MacOS_#{arch}.pkg"
  sha256 arm: "5904b7f7db83e92545ed768e7d737a38408d98b603ea0e69e74952eaf7e4f95a",
    intel: "bf8cfed3c9ac9d124258fe7f9a1ed9ebca70f8d35f2ae9d37d60d7c0df76bebd"

  depends_on cask: "obs"

  livecheck do
    url :url
    strategy :github_latest
  end

  # OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
  # can only put them in the root dir. This is admittedly hacky but feels
  # cleaner to me than the symlink approach in e.g. the obs-ndi cask.
  installer script: {
    executable: "/usr/sbin/installer",
    args: ["-pkg", "#{staged_path}/Waveform_v#{version}_MacOS_#{arch}.pkg", "-target", "CurrentUserHomeDirectory"]
  }

  uninstall script: {
    executable: "/usr/sbin/pkgutil",
    args: ["--forget", "com.github.phandasm.waveform.waveform", "--volume", Dir.home]
  },
  delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/waveform.plugin"
end

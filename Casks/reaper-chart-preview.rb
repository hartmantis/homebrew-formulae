cask "reaper-chart-preview" do
  version "0.5.0"
  sha256 "3b0cd531bd6f64932c396e39acbcf33a54f064e3c600a5c16775e3e47a2c70cd"

  url "https://github.com/noahbaxter/chart-preview/releases/download/#{version}/MacOS-ChartPreview.zip"
  name "Reaper Chart Preview"
  desc "Rhythm game chart authoriing preview VST for Reaper"
  homepage "https://github.com/noahbaxter/chart-preview"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "reaper"

  audio_unit_plugin "ChartPreview.component"
  vst3_plugin "ChartPreview.vst3"
end

class Sudsy < Formula
  desc "Formatter and linter for C#, JSON, YAML and more"
  homepage "https://github.com/bingsubandit/sudsy"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.2/sudsy-0.0.2-darwin-arm64.tar.gz"
      sha256 "e130d17d891898b8184489b760461b7b3ca5af308a8dd3d8e1d6b56dc6922eaa"
    end
    on_intel do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.2/sudsy-0.0.2-darwin-x64.tar.gz"
      sha256 "d0a138b5899a6467683259d55dbd158d1a159e72e0035ed975a41005b1d42163"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.2/sudsy-0.0.2-linux-arm64.tar.gz"
      sha256 "6777ae76d1f723f8af4d15d50505ac720d9097f962b6c71c7cb171c1446a9bbc"
    end
    on_intel do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.2/sudsy-0.0.2-linux-x64.tar.gz"
      sha256 "7abb20822424a44adbf509920c65648d34ae44ae6e6f513cdf3af0c2bb430184"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"sudsy").write_env_script libexec/"sudsy",
                                   SUDSY_CSHARP_WORKER: libexec/"csharp-worker/Sudsy.Worker.dll"
  end

  def caveats
    "Formatting C# needs the .NET 10 runtime (brew install dotnet)."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sudsy --version")
  end
end

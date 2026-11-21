class Sudsy < Formula
  desc "Formatter and linter for 27 languages in one binary and one config file"
  homepage "https://github.com/bingsubandit/sudsy"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.3/sudsy-0.0.3-darwin-arm64.tar.gz"
      sha256 "263827da7e0e2ddda6e27833adecd8afbbbd332afcab373606e3ae454c6f2614"
    end
    on_intel do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.3/sudsy-0.0.3-darwin-x64.tar.gz"
      sha256 "c3d8d1c4b6ab8fe0f68fabaa3d25e2cd6ef071b96f2f7bd729a4210613957b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.3/sudsy-0.0.3-linux-arm64.tar.gz"
      sha256 "3be405c1662ecd81d8041927bfb0c889666f00be73636b436a8c8b751b69de4d"
    end
    on_intel do
      url "https://github.com/bingsubandit/sudsy/releases/download/v0.0.3/sudsy-0.0.3-linux-x64.tar.gz"
      sha256 "eae6f6c909d9c56953869732cad0e8b9b379509710d29a34bd68928aefbdb076"
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

# This file was @generated by cargo2nix 0.9.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "loqc/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
}:
let
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
in let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.9.0";
  workspace = {
    loqc = rustPackages.unknown.loqc."0.1.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".ansi_term."0.11.0" = overridableMkRustCrate (profileName: rec {
    name = "ansi_term";
    version = "0.11.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ee49baf6cb617b853aa8d93bf420db2383fab46d314482ca2803b40d5fde979b"; };
    dependencies = {
      ${ if hostPlatform.parsed.kernel.name == "windows" then "winapi" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".assign."1.1.1" = overridableMkRustCrate (profileName: rec {
    name = "assign";
    version = "1.1.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5f093eed78becd229346bf859eec0aa4dd7ddde0757287b2b4107a1f09c80002"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".atty."0.2.14" = overridableMkRustCrate (profileName: rec {
    name = "atty";
    version = "0.2.14";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"; };
    dependencies = {
      ${ if hostPlatform.parsed.kernel.name == "hermit" then "hermit_abi" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".hermit-abi."0.1.19" { inherit profileName; };
      ${ if hostPlatform.isUnix then "libc" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.104" { inherit profileName; };
      ${ if hostPlatform.isWindows then "winapi" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".autocfg."1.0.1" = overridableMkRustCrate (profileName: rec {
    name = "autocfg";
    version = "1.0.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" = overridableMkRustCrate (profileName: rec {
    name = "bitflags";
    version = "1.3.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".bytes."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "bytes";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "c4872d67bab6358e59559027aa3b9157c53d9358c51423c17554809a8858e0f8"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" = overridableMkRustCrate (profileName: rec {
    name = "cfg-if";
    version = "1.0.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".clap."2.33.3" = overridableMkRustCrate (profileName: rec {
    name = "clap";
    version = "2.33.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002"; };
    features = builtins.concatLists [
      [ "ansi_term" ]
      [ "atty" ]
      [ "color" ]
      [ "default" ]
      [ "strsim" ]
      [ "suggestions" ]
      [ "vec_map" ]
    ];
    dependencies = {
      ${ if !hostPlatform.isWindows then "ansi_term" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ansi_term."0.11.0" { inherit profileName; };
      atty = rustPackages."registry+https://github.com/rust-lang/crates.io-index".atty."0.2.14" { inherit profileName; };
      bitflags = rustPackages."registry+https://github.com/rust-lang/crates.io-index".bitflags."1.3.2" { inherit profileName; };
      strsim = rustPackages."registry+https://github.com/rust-lang/crates.io-index".strsim."0.8.0" { inherit profileName; };
      textwrap = rustPackages."registry+https://github.com/rust-lang/crates.io-index".textwrap."0.11.0" { inherit profileName; };
      unicode_width = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-width."0.1.9" { inherit profileName; };
      vec_map = rustPackages."registry+https://github.com/rust-lang/crates.io-index".vec_map."0.8.2" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".form_urlencoded."1.0.1" = overridableMkRustCrate (profileName: rec {
    name = "form_urlencoded";
    version = "1.0.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5fc25a87fa4fd2094bffb06925852034d90a17f0d1e05197d4956d3555752191"; };
    dependencies = {
      matches = rustPackages."registry+https://github.com/rust-lang/crates.io-index".matches."0.1.9" { inherit profileName; };
      percent_encoding = rustPackages."registry+https://github.com/rust-lang/crates.io-index".percent-encoding."2.1.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.11.2" = overridableMkRustCrate (profileName: rec {
    name = "hashbrown";
    version = "0.11.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ab5ef0d4909ef3724cc8cce6ccc8572c5c817592e9285f5464f8e86f8bd3726e"; };
    features = builtins.concatLists [
      [ "raw" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".hermit-abi."0.1.19" = overridableMkRustCrate (profileName: rec {
    name = "hermit-abi";
    version = "0.1.19";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      libc = rustPackages."registry+https://github.com/rust-lang/crates.io-index".libc."0.2.104" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".indexmap."1.7.0" = overridableMkRustCrate (profileName: rec {
    name = "indexmap";
    version = "1.7.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bc633605454125dec4b66843673f01c7df2b89479b32e0ed634e43a91cff62a5"; };
    features = builtins.concatLists [
      [ "serde" ]
      [ "serde-1" ]
    ];
    dependencies = {
      hashbrown = rustPackages."registry+https://github.com/rust-lang/crates.io-index".hashbrown."0.11.2" { inherit profileName; };
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
    };
    buildDependencies = {
      autocfg = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".autocfg."1.0.1" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".itoa."0.4.8" = overridableMkRustCrate (profileName: rec {
    name = "itoa";
    version = "0.4.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b71991ff56294aa922b450139ee08b3bfc70982c6b2c7562771375cf73542dd4"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".js_int."0.2.1" = overridableMkRustCrate (profileName: rec {
    name = "js_int";
    version = "0.2.1";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "defaba9bcd19568a4b4b3736b23e368e5b75e3ea126fd4cb3e4ad2ea5af274fd"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "serde" ]
      [ "std" ]
    ];
    dependencies = {
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".lazy_static."1.4.0" = overridableMkRustCrate (profileName: rec {
    name = "lazy_static";
    version = "1.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".libc."0.2.104" = overridableMkRustCrate (profileName: rec {
    name = "libc";
    version = "0.2.104";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "7b2f96d100e1cf1929e7719b7edb3b90ab5298072638fccd77be9ce942ecdfce"; };
  });
  
  "unknown".loqc."0.1.0" = overridableMkRustCrate (profileName: rec {
    name = "loqc";
    version = "0.1.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      clap = rustPackages."registry+https://github.com/rust-lang/crates.io-index".clap."2.33.3" { inherit profileName; };
      ruma = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma."0.4.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".matches."0.1.9" = overridableMkRustCrate (profileName: rec {
    name = "matches";
    version = "0.1.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a3e378b66a060d48947b590737b30a1be76706c8dd7b8ba0f2fe3989c68a853f"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".paste."1.0.5" = overridableMkRustCrate (profileName: rec {
    name = "paste";
    version = "1.0.5";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "acbf547ad0c65e31259204bd90935776d1c693cec2f4ff7abb7a1bbbd40dfe58"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".percent-encoding."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "percent-encoding";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".pin-project-lite."0.2.7" = overridableMkRustCrate (profileName: rec {
    name = "pin-project-lite";
    version = "0.2.7";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8d31d11c69a6b52a174b42bdc0c30e5e11670f90788b2c471c31c1d17d449443"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro-crate."1.1.0" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro-crate";
    version = "1.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1ebace6889caf889b4d3f76becee12e90353f2b8c7d875534a71e5742f8f6f83"; };
    dependencies = {
      thiserror = rustPackages."registry+https://github.com/rust-lang/crates.io-index".thiserror."1.0.30" { inherit profileName; };
      toml = rustPackages."registry+https://github.com/rust-lang/crates.io-index".toml."0.5.8" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.30";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "edc3358ebc67bc8b7fa0c007f945b0b18226f78437d61bec735a9eb96b61ee70"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      unicode_xid = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-xid."0.2.2" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.10";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "38bc8cc6a5f2e3655e0899c1b848643b2562f853f114bfec7be120678e3ace05"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "668031e3108d6a2cfbe6eca271d8698f4593440e71a44afdadcf67ce3cb93c1f"; };
    dependencies = {
      assign = rustPackages."registry+https://github.com/rust-lang/crates.io-index".assign."1.1.1" { inherit profileName; };
      js_int = rustPackages."registry+https://github.com/rust-lang/crates.io-index".js_int."0.2.1" { inherit profileName; };
      ruma_common = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-common."0.6.0" { inherit profileName; };
      ruma_identifiers = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers."0.20.0" { inherit profileName; };
      ruma_serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-serde."0.5.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-common."0.6.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-common";
    version = "0.6.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "41d5b7605f58dc0d9cf1848cc7f1af2bae4e4bcd1d2b7a87bbb9864c8a785b91"; };
    dependencies = {
      indexmap = rustPackages."registry+https://github.com/rust-lang/crates.io-index".indexmap."1.7.0" { inherit profileName; };
      js_int = rustPackages."registry+https://github.com/rust-lang/crates.io-index".js_int."0.2.1" { inherit profileName; };
      ruma_identifiers = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers."0.20.0" { inherit profileName; };
      ruma_serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-serde."0.5.0" { inherit profileName; };
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
      serde_json = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.68" { inherit profileName; };
      tracing = rustPackages."registry+https://github.com/rust-lang/crates.io-index".tracing."0.1.29" { inherit profileName; };
      wildmatch = rustPackages."registry+https://github.com/rust-lang/crates.io-index".wildmatch."2.1.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers."0.20.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-identifiers";
    version = "0.20.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "cb417d091e8dd5a633e4e5998231a156049d7fcc221045cfdc0642eb72067732"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "ruma-serde" ]
      [ "serde" ]
      [ "serde1" ]
    ];
    dependencies = {
      paste = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".paste."1.0.5" { profileName = "__noProfile"; };
      ruma_identifiers_macros = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers-macros."0.20.0" { profileName = "__noProfile"; };
      ruma_identifiers_validation = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers-validation."0.5.0" { inherit profileName; };
      ruma_serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-serde."0.5.0" { inherit profileName; };
      ruma_serde_macros = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-serde-macros."0.5.0" { profileName = "__noProfile"; };
      serde1 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers-macros."0.20.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-identifiers-macros";
    version = "0.20.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "c708edad7f605638f26c951cbad7501fbf28ab01009e5ca65ea5a2db74a882b1"; };
    dependencies = {
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      ruma_identifiers_validation = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers-validation."0.5.0" { inherit profileName; };
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-identifiers-validation."0.5.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-identifiers-validation";
    version = "0.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "42285e7fb5d5f2d5268e45bb683e36d5c6fd9fc1e11a4559ba3c3521f3bbb2cb"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-serde."0.5.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-serde";
    version = "0.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8b2b22aae842e7ecda695e42b7b39d4558959d9d9a27acc2a16acf4f4f7f00c3"; };
    dependencies = {
      bytes = rustPackages."registry+https://github.com/rust-lang/crates.io-index".bytes."1.1.0" { inherit profileName; };
      form_urlencoded = rustPackages."registry+https://github.com/rust-lang/crates.io-index".form_urlencoded."1.0.1" { inherit profileName; };
      itoa = rustPackages."registry+https://github.com/rust-lang/crates.io-index".itoa."0.4.8" { inherit profileName; };
      js_int = rustPackages."registry+https://github.com/rust-lang/crates.io-index".js_int."0.2.1" { inherit profileName; };
      ruma_serde_macros = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".ruma-serde-macros."0.5.0" { profileName = "__noProfile"; };
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
      serde_json = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.68" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ruma-serde-macros."0.5.0" = overridableMkRustCrate (profileName: rec {
    name = "ruma-serde-macros";
    version = "0.5.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "243e9bef188b08f94c79bc2f8fd1eb307a9e636b2b8e4571acf8c7be16381d28"; };
    dependencies = {
      proc_macro_crate = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro-crate."1.1.0" { inherit profileName; };
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.5" = overridableMkRustCrate (profileName: rec {
    name = "ryu";
    version = "1.0.5";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" = overridableMkRustCrate (profileName: rec {
    name = "serde";
    version = "1.0.130";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f12d06de37cf59146fbdecab66aa99f9fe4f78722e3607577a5375d66bd0c913"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "derive" ]
      [ "serde_derive" ]
      [ "std" ]
    ];
    dependencies = {
      serde_derive = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.130" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.130" = overridableMkRustCrate (profileName: rec {
    name = "serde_derive";
    version = "1.0.130";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d7bc1a1ab1961464eae040d96713baa5a724a8152c1222492465b54322ec508b"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.68" = overridableMkRustCrate (profileName: rec {
    name = "serde_json";
    version = "1.0.68";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "0f690853975602e1bfe1ccbf50504d67174e3bcf340f23b5ea9992e0587a52d8"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "raw_value" ]
      [ "std" ]
    ];
    dependencies = {
      itoa = rustPackages."registry+https://github.com/rust-lang/crates.io-index".itoa."0.4.8" { inherit profileName; };
      ryu = rustPackages."registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.5" { inherit profileName; };
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".strsim."0.8.0" = overridableMkRustCrate (profileName: rec {
    name = "strsim";
    version = "0.8.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "1.0.80";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d010a1623fbd906d51d650a9916aaefc05ffa0e4053ff7fe601167f3e715d194"; };
    features = builtins.concatLists [
      [ "clone-impls" ]
      [ "default" ]
      [ "derive" ]
      [ "extra-traits" ]
      [ "full" ]
      [ "parsing" ]
      [ "printing" ]
      [ "proc-macro" ]
      [ "quote" ]
      [ "visit" ]
      [ "visit-mut" ]
    ];
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      unicode_xid = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-xid."0.2.2" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".textwrap."0.11.0" = overridableMkRustCrate (profileName: rec {
    name = "textwrap";
    version = "0.11.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060"; };
    dependencies = {
      unicode_width = rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-width."0.1.9" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".thiserror."1.0.30" = overridableMkRustCrate (profileName: rec {
    name = "thiserror";
    version = "1.0.30";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "854babe52e4df1653706b98fcfc05843010039b406875930a70e4d9644e5c417"; };
    dependencies = {
      thiserror_impl = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".thiserror-impl."1.0.30" { profileName = "__noProfile"; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".thiserror-impl."1.0.30" = overridableMkRustCrate (profileName: rec {
    name = "thiserror-impl";
    version = "1.0.30";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "aa32fd3f627f367fe16f893e2597ae3c05020f8bba2666a4e6ea73d377e5714b"; };
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".toml."0.5.8" = overridableMkRustCrate (profileName: rec {
    name = "toml";
    version = "0.5.8";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "a31142970826733df8241ef35dc040ef98c679ab14d7c3e54d827099b3acecaa"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      serde = rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.130" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".tracing."0.1.29" = overridableMkRustCrate (profileName: rec {
    name = "tracing";
    version = "0.1.29";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "375a639232caf30edfc78e8d89b2d4c375515393e7af7e16f01cd96917fb2105"; };
    features = builtins.concatLists [
      [ "attributes" ]
      [ "default" ]
      [ "std" ]
      [ "tracing-attributes" ]
    ];
    dependencies = {
      cfg_if = rustPackages."registry+https://github.com/rust-lang/crates.io-index".cfg-if."1.0.0" { inherit profileName; };
      pin_project_lite = rustPackages."registry+https://github.com/rust-lang/crates.io-index".pin-project-lite."0.2.7" { inherit profileName; };
      tracing_attributes = buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".tracing-attributes."0.1.18" { profileName = "__noProfile"; };
      tracing_core = rustPackages."registry+https://github.com/rust-lang/crates.io-index".tracing-core."0.1.21" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".tracing-attributes."0.1.18" = overridableMkRustCrate (profileName: rec {
    name = "tracing-attributes";
    version = "0.1.18";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f4f480b8f81512e825f337ad51e94c1eb5d3bbdf2b363dcd01e2b19a9ffe3f8e"; };
    dependencies = {
      proc_macro2 = rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.30" { inherit profileName; };
      quote = rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.10" { inherit profileName; };
      syn = rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."1.0.80" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".tracing-core."0.1.21" = overridableMkRustCrate (profileName: rec {
    name = "tracing-core";
    version = "0.1.21";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1f4ed65637b8390770814083d20756f87bfa2c21bf2f110babdc5438351746e4"; };
    features = builtins.concatLists [
      [ "lazy_static" ]
      [ "std" ]
    ];
    dependencies = {
      lazy_static = rustPackages."registry+https://github.com/rust-lang/crates.io-index".lazy_static."1.4.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-width."0.1.9" = overridableMkRustCrate (profileName: rec {
    name = "unicode-width";
    version = "0.1.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-xid."0.2.2" = overridableMkRustCrate (profileName: rec {
    name = "unicode-xid";
    version = "0.2.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "8ccb82d61f80a663efe1f787a51b16b5a51e3314d6ac365b08639f52387b33f3"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".vec_map."0.8.2" = overridableMkRustCrate (profileName: rec {
    name = "vec_map";
    version = "0.8.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".wildmatch."2.1.0" = overridableMkRustCrate (profileName: rec {
    name = "wildmatch";
    version = "2.1.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d6c48bd20df7e4ced539c12f570f937c6b4884928a87fee70a479d72f031d4e0"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi."0.3.9" = overridableMkRustCrate (profileName: rec {
    name = "winapi";
    version = "0.3.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"; };
    features = builtins.concatLists [
      [ "consoleapi" ]
      [ "errhandlingapi" ]
      [ "minwinbase" ]
      [ "minwindef" ]
      [ "processenv" ]
      [ "winbase" ]
    ];
    dependencies = {
      ${ if hostPlatform.config == "i686-pc-windows-gnu" then "winapi_i686_pc_windows_gnu" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" { inherit profileName; };
      ${ if hostPlatform.config == "x86_64-pc-windows-gnu" then "winapi_x86_64_pc_windows_gnu" else null } = rustPackages."registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" { inherit profileName; };
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-i686-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-i686-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".winapi-x86_64-pc-windows-gnu."0.4.0" = overridableMkRustCrate (profileName: rec {
    name = "winapi-x86_64-pc-windows-gnu";
    version = "0.4.0";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"; };
  });
  
}

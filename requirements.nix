# generated using pypi2nix tool (version: 2.0.0)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -E libffi -E openssl -r requirements.txt -s setuptools-scm -V python37
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python37;
  };

  commonBuildInputs = with pkgs; [ libffi openssl ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python37-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "certifi" = python.mkDerivation {
      name = "certifi-2019.9.11";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/62/85/7585750fd65599e88df0fed59c74f5075d4ea2fe611deceb95dd1c2fb25b/certifi-2019.9.11.tar.gz";
        sha256 = "e4f3620cfea4f83eedc95b24abd9cd56f3c4b146dd0177e83a21b4eb49e21e50";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://certifi.io/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "cffi" = python.mkDerivation {
      name = "cffi-1.13.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/2d/bf/960e5a422db3ac1a5e612cb35ca436c3fc985ed4b7ed13a1b4879006f450/cffi-1.13.2.tar.gz";
        sha256 = "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."pycparser"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz";
        sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "cryptography" = python.mkDerivation {
      name = "cryptography-2.8";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/be/60/da377e1bed002716fb2d5d1d1cab720f298cb33ecff7bf7adea72788e4e4/cryptography-2.8.tar.gz";
        sha256 = "3cda1f0ed8747339bbdf71b9f38ca74c7b592f24f65cdb3ab3765e4b02871651";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [
        self."cffi"
        self."setuptools"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."cffi"
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.asl20;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
      };
    };

    "github3-py" = python.mkDerivation {
      name = "github3-py-1.3.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/2c/78/b593098dc5a16c03a91ef2a2f6341d17943b5d5359c53335a7a04beced42/github3.py-1.3.0.tar.gz";
        sha256 = "15a115c18f7bfcf934dfef7ab103844eb9f620c586bad65967708926da47cbda";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."jwcrypto"
        self."python-dateutil"
        self."requests"
        self."uritemplate"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github3.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Python wrapper for the GitHub API(http://developer.github.com/v3)";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.8";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ad/13/eb56951b6f7950cadb579ca166e448ba77f9d24efc03edd7e55fa57d04b7/idna-2.8.tar.gz";
        sha256 = "c357b3f628cf53ae2c4c05627ecc484553142ca23264e593d327bcde5e9c3407";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "jwcrypto" = python.mkDerivation {
      name = "jwcrypto-0.6.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d5/27/4f121e9596826adf050fe255b5d27f6f97a421d1ec3943d8de566fdc62c0/jwcrypto-0.6.0.tar.gz";
        sha256 = "a87ac0922d09d9a65011f76d99849f1fbad3d95439c7452cebf4ab0871c2b665";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."cryptography"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/latchset/jwcrypto";
        license = licenses.lgpl3Plus;
        description = "Implementation of JOSE Web standards";
      };
    };

    "pycparser" = python.mkDerivation {
      name = "pycparser-2.19";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a/pycparser-2.19.tar.gz";
        sha256 = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.8.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0/python-dateutil-2.8.1.tar.gz";
        sha256 = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [
        self."setuptools"
        self."setuptools-scm"
        self."wheel"
      ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.22.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/01/62/ddcf76d1d19885e8579acb1b1df26a852b03472c0e46d2b959a714c90608/requests-2.22.0.tar.gz";
        sha256 = "11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."certifi"
        self."chardet"
        self."idna"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "setuptools" = python.mkDerivation {
      name = "setuptools-42.0.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ce/1d/96320b9784b04943c924a9f1c6fa49124a1542039ce098a5f9a369227bad/setuptools-42.0.1.zip";
        sha256 = "be5c1ea910cd1f37d1dd79b5f74b68b359348f558fbe4866b15f54a052d61ee1";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools";
        license = licenses.mit;
        description = "Easily download, build, install, upgrade, and uninstall Python packages";
      };
    };

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-3.3.3";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/83/44/53cad68ce686585d12222e6769682c4bdb9686808d2739671f9175e2938b/setuptools_scm-3.3.3.tar.gz";
        sha256 = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.13.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/94/3e/edcf6fef41d89187df7e38e868b2dd2182677922b600e880baad7749c865/six-1.13.0.tar.gz";
        sha256 = "30f610279e8b2578cab6db20741130331735c781b56053c59c4076da27f06b66";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "uritemplate" = python.mkDerivation {
      name = "uritemplate-3.0.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cd/db/f7b98cdc3f81513fb25d3cbe2501d621882ee81150b745cdd1363278c10a/uritemplate-3.0.0.tar.gz";
        sha256 = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://uritemplate.readthedocs.org";
        license = licenses.bsdOriginal;
        description = "URI templates";
      };
    };

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.25.7";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ad/fc/54d62fa4fc6e675678f9519e677dfc29b8964278d75333cf142892caf015/urllib3-1.25.7.tar.gz";
        sha256 = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e48b0745";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

    "wheel" = python.mkDerivation {
      name = "wheel-0.33.6";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/59/b0/11710a598e1e148fb7cbf9220fd2a0b82c98e94efbdecb299cb25e7f0b39/wheel-0.33.6.tar.gz";
        sha256 = "10c9da68765315ed98850f8e048347c3eb06dd81822dc2ab1d4fde9dc9702646";
};
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/wheel";
        license = licenses.mit;
        description = "A built-package format for Python.";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (let src = pkgs.fetchFromGitHub { owner = "nix-community"; repo = "pypi2nix-overrides"; rev = "db87933d87d9b3943cf636a49f16b76c9ea66db7"; sha256 = "1phiqh72dyg7qhkv15kdg4gjkx8rkywvs41j7liz5faj66ijlpv6"; } ; in import "${src}/overrides.nix" { inherit pkgs python; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )
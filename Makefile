pypi2nix:
	pypi2nix -E "libffi openssl" -V 2.7 -r requirements.txt -s setuptools-scm

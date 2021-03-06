{ stdenv, fetchurl, qmake, qtbase, qtwebkit, qtx11extras, lzo, libX11 }:

stdenv.mkDerivation rec {
  name = pname + "-" + version;
  pname = "cb2bib";
  version = "1.9.7";
  src = fetchurl {
    url = "https://www.molspaces.com/dl/progs/${name}.tar.gz";
    sha256 = "0gr8vmlz1ikw0jiwwac2ays20z26cdv3bjdx9m1nc450hl6m5s7s";
  };
  buildInputs = [ qtbase qtwebkit qtx11extras lzo libX11 ];
  nativeBuildInputs = [ qmake ];

  configurePhase = ''
    runHook preConfigure
    ./configure --prefix $out --qmakepath $QMAKE
    runHook postConfigure
  '';

  meta = with stdenv.lib; {
    description = "Rapidly extract unformatted, or unstandardized bibliographic references from email alerts, journal Web pages and PDF files";
    homepage = http://www.molspaces.com/d_cb2bib-overview.php;
    maintainers = with maintainers; [ edwtjo ];
    license = licenses.gpl3;
  };

}

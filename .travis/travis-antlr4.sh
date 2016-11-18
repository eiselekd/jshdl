#!/bin/bash
set -ex
if [ ! -e "$HOME/antlr4/bin/antlr4" ]; then
  mkdir -p "$HOME/antlr4/bin";
  curl http://www.antlr.org/download/antlr-4.5.2-complete.jar -o "$HOME/antlr4/antlr-4.5.2-complete.jar";
  cat <<'EOF' >"$HOME/antlr4/bin/antlr4"
#!/bin/bash
exec java  -jar "$HOME/antlr4/antlr-4.5.2-complete.jar" "$@"
EOF
  chmod +x "$HOME/antlr4/bin/antlr4";
else
  echo 'Using cached antlr4';
fi

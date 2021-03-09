
export GOVERSION="1.15.5"
export GOOS="linux"
export GOARCH="$(dpkg --print-architecture)"
export GOROOT="$HOME/dev/domains/golang"
export GOPATH="$HOME/dev/src/go"
export GO111MODULE=on
export GOPRIVATE="git.bananalias.xyz/*"

# private
export GOGENNYTYPES='string,int,float64,bool,Void,Bytes,Time,Duration'
export GOSRC="$GOPATH/src"
#alias gogen='go generate'



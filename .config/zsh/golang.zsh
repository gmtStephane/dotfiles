function playground() {
  if [ $# -eq 0 ]; then
    echo "Usage: create_go_playground <directory_name>"
    return 1
  fi

  local directory_name=$1
  local playground_dir="/tmp/playground"

  # Create directory
  mkdir -p "$playground_dir/$directory_name"
  cd "$playground_dir/$directory_name" || return 1

  # Initialize Go module
  go mod init "$directory_name"

  # Write basic main.go file
  echo 'package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}' > main.go

  # Open main.go in Vim
  vim main.go
}

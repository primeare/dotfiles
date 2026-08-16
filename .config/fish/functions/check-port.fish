# ex. (check-port 8080)
function check-port \
  --wraps=lsof \
  --description='Check if any process occupies the specified port number' \
  --argument-names port;

  sudo lsof -i :$port
end

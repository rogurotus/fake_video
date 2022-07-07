$env:RUST_BACKTRACE=1;
$env:RUST_LOG="warn";
$env:COMPOSE_MEDEA_IMAGE_NAME="hub.instrumentisto.com/streaming/medea"; 
$env:COMPOSE_MEDEA_IMAGE_VER="edge";
$env:COMPOSE_CONTROL_MOCK_IMAGE_VER="dev";
$env:COMPOSE_WEBDRIVER_IMAGE_NAME="selenoid/chrome";
$env:COMPOSE_WEBDRIVER_IMAGE_VER="102.0";
$env:COMPOSE_WEBDRIVER_ENTRYPOINT="/entrypoint.sh";

# docker-compose -f ./docker-compose.yml logs -f 
docker-compose -f ./docker-compose.yml up
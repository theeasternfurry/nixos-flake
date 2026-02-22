{
  sops.secrets."GITHUB_TOKEN" = {
    sopsFile = ../../../secrets/password.yaml; 
    owner = "theeasternfurry";
    group = "users";
  };
  sops.secrets."api-env" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."api-trading-env" = {
    sopsFile = ../../../secrets/config-trading-shop.yaml; 
  };
  sops.secrets."bot-trading-env" = {
    sopsFile = ../../../secrets/config-trading-shop.yaml; 
  };
  sops.secrets."web-trading-env" = {
    sopsFile = ../../../secrets/config-trading-shop.yaml; 
  };
  sops.age.keyFile = "/home/theeasternfurry/.config/sops/age/keys.txt";
}

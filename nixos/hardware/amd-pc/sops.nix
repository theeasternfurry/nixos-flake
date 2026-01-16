{
  sops.secrets."GITHUB_TOKEN" = {
    sopsFile = ../../../secrets/password.yaml; 
    owner = "theeasternfurry";
    group = "users";
  };
  sops.secrets."DATABASE_URL" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."JWT_LOGIN_SECRET" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."JWT_AUTH_SECRET" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."JWT_EXP" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."USERNAME" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."PASSWORD" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."PRODUCTION" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.secrets."OTP_SECRET" = {
    sopsFile = ../../../secrets/config-web-blog.yaml; 
  };
  sops.age.keyFile = "/home/theeasternfurry/.config/sops/age/keys.txt";
}

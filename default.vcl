vcl 4.1;

backend default {
    .host = "httpd";
    .port = "80";
}
include "datadome.vcl";
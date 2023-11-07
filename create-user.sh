#!/bin/bash
echo "##############################"
echo "#### Starting init script ####"
BASE_DIR=/opt/keycloak/bin/
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=password
REALM_NAME=akhilesh-realm
KC_SERVER_ADDRESS=http://localhost:8443

$BASE_DIR/kcadm.sh config credentials --server ${KC_SERVER_ADDRESS} --user ${KEYCLOAK_ADMIN} --password ${KEYCLOAK_ADMIN_PASSWORD} --realm master
$BASE_DIR/kcadm.sh create users -r $REALM_NAME -b '{
  "firstName": "Akhilesh",
  "lastName": "Singh",
  "email": "akhilesh.singh@gmail.com",
  "emailVerified": true,
  "groups": [
    "/admin"
  ],
  "enabled": "true",
  "credentials": [
    {
      "type": "password",
      "userLabel": "Admin Password",
      "value": "p@ssw0rd",
      "temporary": false
    }
  ]
}'

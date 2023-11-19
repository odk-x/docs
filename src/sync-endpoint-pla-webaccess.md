```{spelling}
    yml
    phpLDAPAdmin
    pla
    PLA
    env
    CVE
```
```{toctree}
  :maxdepth: 0
  :hidden:
```

# LDAP Web administration
The sync-endpoint default setup [(available at GitHub)](https://github.com/odk-x/sync-endpoint-default-setup) comes with a web based LDAP administration utility called phpLDAPAdmin. 
However, by default it is not exposed directly outside of the docker stack since it is not relevant in all installation scenarios.

-----------------------------------------------------------------
**Enabling web access to phpLDAPAdmin**
In some scenarios it can be helpful to add remote web access to the user administration interface (PhpLdapAdmin) in order to facilitate user creation etc. This section will guide you to enabling access to the web administration interface at the web address _https://\<your server\>/pla_

> __Warning:__ Remember to change the default password for phpLDAPAdmin _before_ enabling public access - this can preferably be changed as part of the setup wizard, or done manually  in the file ```ldap.env``` (remember to restart/clear caches after modifying manually)

_Note: While we consider PLA reasonably safe, exposing an extra public https endpoint always introduces security risks. Consider enabling the access only when it is needed and then leave it disabled the rest of the time (e.g. by #commenting the lines out in ```sync-endpoint-locations.conf```). Also make sure to stay up to date on relevant security updates on e.g. [CVE Details](https://www.cvedetails.com/vulnerability-list/vendor_id-20973/product_id-61907/Phpldapadmin-Project-Phpldapadmin.html) or the [phpLdapAdmin project site](https://phpldapadmin.sourceforge.net/wiki/index.php/Main_Page)_


-----------------------------------------------------------------
**Customized files**:
- __config/nginx/sync-endpoint-locations.conf__: This file controls what locations Nginx serves. To add access to https://_your server_/pla add a section like
    ```{code-block} nginx
    location ^~ /pla/ {
        proxy_pass https://phpldapadmin/;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Port $server_port;
        proxy_set_header Host $host:$server_port;

        proxy_redirect default;
    }   
    ```
- __docker-compose.yml__: The ```phpldapadmin``` container needs access to the sync-network, and let's give it a hostname while we're at it (the added lines are marked with '\<--- MODIFIED HERE' - the marker itself should not be included in the yml file):
    ```{code-block} yaml
    phpldapadmin:
        image: odk/phpldapadmin
        deploy:
        replicas: 1
        ports:
        - "${PHP_LDAPADMIN_PORT:-40000}:443"
        networks:
        - ldap-network
        - sync-network            <--- MODIFIED HERE
        hostname: phpldapadmin    <--- MODIFIED HERE
        env_file:
        - ldap.env    
    ```

-----------------------------------------------------------------
**Closing remarks**
When all is said and done, a ```git status``` on the odk-x folder should reveal the following file changes
- config/https.env: (updated by the python setup wizard) updated domain and e-mail address (used to create the lets-encrypt SSL certs)
- __config/nginx/sync-endpoint-locations.conf__: (see above)
- __docker-compose.yml__: (see above)
- __ldap.env__: This file contains the admin password for PLA (only modified if it was selected during the setup wizard)


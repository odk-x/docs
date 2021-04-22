.. spelling::
  phpLDAPadmin
  readonly
  ldapUrl
  ldap

.. _sync-endpoint-manual-setup:

Setup ODK-X Sync Endpoint Manually
==================================

Follow these setup instructions for manual or local setup of the sync
endpoint. If deploying to a cloud service, check out
:ref:`Cloud-based Setup <sync-endpoint-cloud-setup>`

Prerequisites
-------------

You must have :program:`Docker 18.09.2` or newer, and be running in *Swarm Mode*.
Follow these links for detailed instructions on installing :program:`Docker` and enabling Swarm Mode.

  - `Docker <https://docs.docker.com/install/>`_
  - `Swarm Mode <https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/>`_

If you wish to enable HTTPS, you also need to install `certbot <https://certbot.eff.org/>`_


.. _sync-endpoint-manual-setup-common:

ODK-X Sync Endpoint Setup
-------------------------

ODK-X Sync Endpoint requires a database and a *LDAP* directory, you could follow the instructions and deploy all three components together or supply your own database and/or *LDAP* directory.

.. note::

  All of the following commands should be run on your server.

  If you are using git on Windows, make sure git is configured with "core.autocrlf=false" - otherwise it will convert line endings with LF to CRLF, which will cause problems with the .sh-files when used in the Docker containers, thus preventing odk/sync-endpoint from starting and instead just returning with an ":invalid argument"-error. 

Setup instructions:

  1. Choose a directory to store you endpoint in. In that directory, run:

  .. code-block:: console

    $ git clone https://github.com/odk-x/sync-endpoint-default-setup
    
  2. Navigate into the the "sync-endpoint-default-setup" directory
  
  3. Checkout the sync-endpoint code by running:

  .. code-block:: console

    $ git clone https://github.com/odk-x/sync-endpoint
   
  3. Navigate into the sync-endpoint directory. Most likely

  .. code-block:: console

    $ cd sync-endpoint
	
  4. Build sync endpoint by running the following: (NOTE: you will need Apache Maven installed >= 3.3.3)
  
  .. code-block:: console

    $ mvn clean install
	
  5. Navigate back to the parent "sync-endpoint-default-setup" directory. 
  
  6. In the "sync-endpoint-default-setup" directory run:

  .. code-block:: console

    $ docker build --pull -t odk/sync-web-ui https://github.com/odk-x/sync-endpoint-web-ui.git

  7. In the "sync-endpoint-default-setup" cloned repository run:

  .. code-block:: console

    $ docker build --pull -t odk/db-bootstrap db-bootstrap

  8. In the "sync-endpoint-default-setup" cloned repository run:

  .. code-block:: console

    $ docker build --pull -t odk/openldap openldap

  9. In the "sync-endpoint-default-setup" cloned repository run:

  .. code-block:: console

    $ docker build --pull -t odk/phpldapadmin phpldapadmin

  10. Enter your hostname in the :code:`security.server.hostname` field in the :file:`security.properties` file (under the directory :file:`config/sync-endpoint`). You can also choose to enable :ref:`Anonymous access<sync-anonymous>` on your ODK-X Sync Endpoint by configuring the same :file:`security.properties` file.

  11. If you're not using the standard ports (80 for *HTTP* and 443 for *HTTPS*) enter the ports you're using in the :code:`security.server.port` and :code:`security.server.securePort` fields in the :file:`security.properties`. Then edit the **ports** section under the **sync** section in :file:`docker-compose.yml` to be :code:`YOUR_PORT:8080`.

    .. note::

      It is important that the right side of the colon stays as 8080. This is the internal port that the web server is looking for.

  12. If you're using your own *LDAP* directory or database, continue with the instructions:

    - :ref:`Custom database instructions <sync-endpoint-setup-database>`
    - :ref:`Custom LDAP instructions <sync-endpoint-setup-ldap>`

  .. _sync-endpoint-deploy:

  13. In the "sync-endpoint-default-setup" cloned repository run:

    - For HTTP:
	
    .. code-block:: console

      $ docker stack deploy -c docker-compose.yml syncldap

    - For HTTPS:
	
    .. code-block:: console

       $ docker stack deploy -c docker-compose.yml -c docker-compose-https.yml syncldap

  14. The server takes about 30s to start, then it will be running at http://127.0.0.1.
  15. See the :ref:`LDAP section <sync-endpoint-ldap>` for instructions on configuring users and groups.

.. _sync-endpoint-setup-database:

Custom database
-------------------------

  1. If you haven't followed the :ref:`common instructions <sync-endpoint-manual-setup-common>`, start with those.
  2. Remove the *db* and *db-bootstrap* sections in :file:`docker-compose.yml`.
  3. Modify :file:`jdbc.properties` to match your database. Supported database systems are :program:`PostgreSQL`, :program:`MySQL` and :program:`Microsoft SQL Server`. Sample config for each type of database can be found `on Github <https://github.com/odk-x/sync-endpoint-default-setup>`_.
  4. Modify :file:`sync.env` to match your database
  5. In the cloned repository,

  .. code-block:: console

    $ docker stack deploy -c docker-compose.yml syncldap

  6. The server takes about 30s to start, then it will be running at http://127.0.0.1.

.. _sync-endpoint-setup-ldap:

Custom LDAP directory
-------------------------

  1. If you haven't followed the :ref:`common instructions <sync-endpoint-manual-setup-common>`, start with those.
  2. OPTIONAL: If your LDAP directory uses a certificate that was signed by a self-signed CA,

    a. Make the public key of the CA available to ODK-X Sync Endpoint with this command.

    .. code-block:: console

      $ docker config create org.opendatakit.sync.ldapcert PATH_TO_CERT

    b. Uncomment the relevant lines in the *configs* section in :file:`docker-compose.yml` and the *configs* section under the *sync* section in :file:`docker-compose.yml`.
       
  3. Create a new directory in the sync-endpoint-default-setup directory and create a Docker file inside it.
  4. Copy the :file:`bootstrap.ldif` file from the OpenLDAP directory to the new directory. In the Docker file Add the image of the LDAP Directory to be used 
     and add the "COPY" command to copy the :file:`bootstrap.ldif` file to the right path in the container.
  5. Run the following command to build the Docker image :
    
    .. code-block:: console

      $ docker build -t odk/[LDAP_DIRECTORY_NAME] [ Folder conatining the Docker file ]

  6. Replace the ldap-service image from :file:`docker-compose.yml` with odk/[LDAP_DIRECTORY_NAME].
  7. In the sync-endpoint-default-setup directory navigate to config/sync-endpoint. Modify the :file:`security.properties` file to fill in the Settings for LDAP 
     server. Set security.server.ldapUrl in security.properties to the new server url. The name of the service in Swarm would be same ( ldap-service ). So just 
     change the port number. After this following settings need to be configured in the same file for the LDAP server:

       - :guilabel:`security.server.ldapBaseDn`
       - :guilabel:`security.server.ldapPooled`
       - :guilabel:`security.server.userSearchBase`
       - :guilabel:`security.server.groupSearchBase`
       - :guilabel:`security.server.groupRoleAttribute`
       - :guilabel:`security.server.userFullnameAttribute`
       - :guilabel:`security.server.usernameAttribute`
       - :guilabel:`security.server.userDnPattern`
       - :guilabel:`security.server.memberOfGroupSearchFilter`
       - :guilabel:`security.server.serverGroupSearchFilter`

    .. note::

      The LDAP Directory here is configured to run inside the Docker Swarm. If you are running the LDAP Directory outside the Docker Swarm and it is accessible 
      for the containers inside the Docker Swarm, you can directly follow step 7 to configure it.

    .. note::

      The default configuration does not use ldaps or StartTLS because the LDAP directory communicates with the ODK-X Sync Endpoint over a secure overlay network. 
      You should use ldaps or StartTLS to communicate with your LDAP directory.

  8. In the cloned repository:

  .. code-block:: console

    $ docker stack deploy -c docker-compose.yml syncldap

  9. The server takes about 30s to start, then it will be running at http://127.0.0.1.

.. _sync-endpoint-stopping:

Stopping ODK-X Sync Endpoint
----------------------------

  1. Run:

  .. code-block:: console

    $ docker stack rm syncldap

  2. OPTIONAL: If you want to remove the volumes as well,

    .. Warning:: Removing volumes will remove any provisioned TLS keys
                 if https is enabled. These keys can only be
                 provisioned at a rate of 50 valid keys/domain/week.

    - Linux/macOS:

    .. code-block:: console

      $ docker volume rm $(docker volume ls -f "label=com.docker.stack.namespace=syncldap" -q)

    - Windows:

    .. code-block:: console

      $ docker volume rm (docker volume ls -f "label=com.docker.stack.namespace=syncldap" -q)

.. _sync-anonymous:

Anonymous Access for ODK-X Sync Endpoint
-----------------------------------------

Checking for Anonymous User Access
  If you have already created the Docker Config and deployed the Docker Stack.
  Navigate to http://[IP_ADDRESS]/web-ui/admin/users
  or http://[IP_ADDRESS]/odktables/[APP_NAME]/usersInfo 
  
  .. list-table:: Users and Permissions
   :widths: 20 25 55
   :header-rows: 1

   * - User ID
     - Full Name
     - Membership Roles
   * - anonymous
     - Anonymous Access
     - ROLE_USER, ROLE_SYNCHRONIZE_TABLES

  If you find a user with attributes as shown above then your server has Anonymous User Access. If not then you can easily add Anonymous User Access
  by following :ref:`Enabling or Disabling Anonymous User Access <sync-modify-anonymous>`.

.. _sync-modify-anonymous:

Enabling or Disabling Anonymous User Access
  1. If you have deployed the Docker Stack then may want to :ref:`Stop the ODK-X Sync Endpoint Server <sync-endpoint-stopping>` before proceeding.
  
  2. Navigate to `security.properties <https://github.com/odk-x/sync-endpoint-default-setup/blob/master/config/sync-endpoint/security.properties>`_ file which can be found under :file:`sync-endpoint-default-setup/config/sync-endpoint/` directory.

    - To Enable Anonymous access set the following fields to *true*

      .. code-block::

        sync.preference.anonymousTablesSync=true
        sync.preference.anonymousAttachmentAccess=true

    - To Disable Anonymous access set the following fields to *false*

      .. code-block::

        sync.preference.anonymousTablesSync=false
        sync.preference.anonymousAttachmentAccess=false
        
  3. Update the Docker Config by either recreating it or redeploying the Docker Stack.
  You can redeploy the stack using the following command.

    .. code-block:: console

      $ docker stack deploy -c /root/sync-endpoint-default-setup/docker-compose.yml syncldap
    
Add SSL Certificate in an Existing Domain
-------------------------------------------

Certbot can obtain and install HTTPS/TLS/SSL certificates.  By default, it will attempt to use a webserver both for obtaining and installing the certificate.
Installing an SSL Certificate on NGINX ensures a safe connection between your web server and browser. It encrypts the data transmitted over the internet so that it is only visible to the intended recipient.

**Prerequisites:**
   obtain the SSL certificate from certbot in a HTTPS domain or NGINX server. To import the certificate the certbot functionality need to be disabled.

   - A server certificate issued by a Certificate Authority for your domain
   - Intermediate certificates
   - Your private key
   - NGINX installed on your system

**Step 1: Combine All Certificates into a Single File**
   You should have your SSL certificate in the form of a .zip file. Once you download and extract the file, you will see it consists of a server certificate, a root certificate, and an intermediate certificate. Combine all three files into one. 

   You can also do this via command-line. The command to merge the certificates into one file will depend on whether you have separate intermediate files or if these files are inside a single .ca-bundle file.

   - If all three certificates are listed separately, use the command:
    
    .. code-block::

      cat your_domain.crt intermediate.crt root.crt >> ssl-bundle.crt

   - If the intermediate certificates are in one bundle, run:

    .. code-block::
     
      cat your_domain.crt your_domain.ca-bundle >> ssl-bundle.crt

**Step 2: Edit NGINX Configuration File**
   Configure the NGINX server block (AKA virtual host file) for your server. If you don’t know the location of the file, run the command:

   .. code-block::

     sudo find nginx.conf

  Open the file to make the necessary modifications. The easiest way to set up the configuration is to copy the original server module, paste it below, and edit the content. 

    - Start by specifying the server should listen to port 443: `listen 443;`
    - Make sure the server block includes the line: `ssl on;`
    - Define the path of the SSL certificate: `ssl_certificate /etc/ssl/ssl-bundle.crt;`
    - Specify the directory where the SSL Certificate Key is located: `/path/to/your_private.key;`
  
  The configuration file should look similar to the one below:

   .. code-block::   

     server {
     listen 443;
     ssl on;
     ssl_certificate /etc/ssl/ssl-bundle.crt;
     ssl_certificate_key /path/to/your_private.key;
     root /path/to/webroot;
     server_name your_domain.com;
     }
     access_log /var/log/nginx/nginx.vhost.access.log;
     error_log /var/log/nginx/nginx.vhost.error.log;
     location / {
     root /var/www/;
     root  /home/www/public_html/your.domain.com/public/;
     index index.html;
     }
     }
  
  Save and exit the file.

**Step 3: Restart NGINX Server**
   For your configuration changes to take place, you need to restart your NGINX server. To do so, run the command:

   .. code-block::

     sudo systemctl restart nginx

**Step 4: Verify SSL Certificate**
   The best way to check you have successfully installed the SSL certificate on NGINX is to connect to your server via browser.
   Open a browser of your choice and navigate to your domain using the HTTPS protocol:

   .. code-block::

     https://your.domain.com
   

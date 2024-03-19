.. _ssh-tunneling:

SSH Tunneling for ODK-X Sync Endpoint
============================================

Secure Shell (SSH) tunneling provides a secure way to access services remotely. The following instructions explain how to set up an SSH tunnel to access the admin portal for the ODK-X Sync Endpoint deployed in a cloud environment.

1. Open your terminal or command prompt on your local machine and run te following command:

   .. code-block:: console

     $ ssh -L <local_port>:<server_ip>:40000 <user>@<ssh_server>

Replace the placeholders with your actual values.

.. image:: /img/ssh-tunneling/connect-to-server.png
    :width: 600

Once connected, you've created an SSH tunnel, allowing you to access the admin portal locally.

.. image:: /img/ssh-tunneling/local-access.png
    :width: 600

.. _ssh-tunnel-additional-resources:

Additional Resources
-----------------------
For more in-depth information on SSH tunneling, refer to the following resources:

- `How to Set Up SSH Tunnel with PuTTY <https://tecadmin.net/putty-ssh-tunnel-and-port-forwarding/>`_
- `Guide to Using SSH Port Forwarding (SSH Tunneling) <https://builtin.com/software-engineering-perspectives/ssh-port-forwarding>`_
- `SSH Tunneling: Examples, Command, Server Config <https://www.ssh.com/academy/ssh/tunneling-example>`_

Feel free to explore these resources for a deeper understanding of SSH tunneling concepts and usage.
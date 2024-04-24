# Evaluation Phase:

1. Take the Pre-Evaluation Survey (link to be provided)

2. Read the README.md file in the ztn/docs folder

3. Receive KUBECONFIG file from the proctor once EKS cluster is ready.

4. Save KUBECONFIG in folder on computer and run this command:
    ```bash
    export KUBECONFIG=/path/to/kubeconfig
    ```

    You can now run kubectl commands to interact with the EKS cluster.

5. Install Wireguard-tools on MacOS:
    ```bash
    brew install wireguard-tools
    ```

    OR

    Install Wireguard-tools on Linux:
    ```bash
    sudo apt-get install wireguard-tools
    ```

6. Generate a Wireguard key pair:
    ```bash
    wg genkey | tee privatekey | wg pubkey > publickey
    ```

7. Edit the deployment configuration file in kube/wireguard.yaml:
    wg0.key: <publickey>

8. Apply the deployment configuration file:
    ```bash
    kubectl apply -f kube/wireguard.yaml -n ztn
    ```

9. Get the Wireguard service IP address:
    ```bash
    kubectl get svc -n ztn
    ```

10. Ping the Wireguard external IP and NodePort:
    ```bash
    nc -uvz 1.2.3.4 31820

    Connection to 1.2.3.4 31820 port [udp/wireguard] succeeded!
    ```

11. Edit the client.conf file in the ztn folder:
    Change: DNS to relevant ClusterIP of EKS cluster
    Change: The private key of your client and the public key of the server

12. Run the Wireguard client:
    ```bash
    sudo wg-quick up client.conf
    ```

13. Verify IP address:
    ```bash
    curl ifconfig.me
    ```

14. Take the Post-Evaluation Survey (link to be provided)
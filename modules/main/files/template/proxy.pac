function FindProxyForURL(url, host) {
    const proxyHost = "${proxy_host}";
    const proxyPort = "8080";

    const useProxyHosts = [
        // For Debug
        "checkip.amazonaws.com"
    ];

    if (useProxyHosts.includes(host)) {
        return "PROXY " + proxyHost + ":" + proxyPort;
    }

    return "DIRECT";
}

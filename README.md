# MTU Optimizer 🚀

MTU Optimizer is a lightweight and interactive Bash tool for configuring and optimizing MTU values on Linux servers.

This tool is especially useful for tunnel-based connections such as V2Ray, Xray, WireGuard, GRE, and Reality, where incorrect MTU settings can cause file transfer issues.

---

## 📌 Problem This Tool Solves

Improper MTU configuration may cause:

- Text messages working but file uploads failing
- Telegram media not sending
- WhatsApp media stuck on sending
- Broken or slow connections
- Packet fragmentation
- Tunnel instability

Setting MTU to an optimized value like **1380** resolves these issues in most cases.

---

## ✨ Features

- Interactive interface selection
- Custom MTU input
- Default MTU value: **1380**
- Automatic MTU validation
- Optional persistent configuration
- Simple and lightweight
- Compatible with most Linux distributions

---

## 🖥 Supported Operating Systems

- Ubuntu
- Debian
- CentOS
- AlmaLinux
- VPS and Dedicated Servers

---

## ⚡ Quick Install (Recommended)

Run this command:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/Emmanuel-RCL/mtu-optimizer/main/set-mtu.sh)
```

## 📥 Manual Installation

Download the script:

```bash
wget https://raw.githubusercontent.com/Emmanuel-RCL/mtu-optimizer/main/set-mtu.sh
```

Make executable:

```bash
chmod +x set-mtu.sh
```

Run the script:

```bash
./set-mtu.sh
```

---

## ⚙ Default Settings

- Default Interface: `eth0`
- Default MTU: `1380`
- Persistent Mode: Enabled (optional)

---

## 🎯 Recommended MTU Values

| Network Type | Recommended MTU |
|--------------|------------------|
| V2Ray TCP    | 1380 |
| Reality      | 1380 |
| WireGuard    | 1360–1380 |
| GRE/IPIP     | 1300–1400 |

---

## 👨‍💻 Developer

**Seyyed Ali Habibpour**

- Website: https://reycloud.ir  
- GitHub: https://github.com/Emmanuel-RCL  

---

## 📜 License

This project is licensed under the MIT License.

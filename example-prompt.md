---

### **Organization Phase**:
- **Folder Structure**:
  - Create directories for each box inside `~/htb/machines`, organized into subfolders for:
    - `scans`
    - `notes`
    - `exploits`
- **Hosts File Update**:
  - Add entries like `[IP Address] machinename.htb` to `/etc/hosts` for easier resolution.
- **Purpose**:
  - Ensure clear organization and streamline progress tracking.

---

### **Enumeration Phase**:
Verify every command is running. Troubleshoot if not
#### **Port Enumeration**:
1. **RustScan**:
   - Rapid detection of open ports.
2. **Nmap**:
   - Detailed scanning to identify service versions and run scripts (e.g., `-sC`, `-sV` flags).
3. **Host Verification**:
   - If hosts appear offline, check VPN connectivity to ensure access.

#### **Web Enumeration**:
1. **Basic Enumeration**:
   - Use common directory and subdomain lists with **Gobuster** or **Nikto**.
2. **Advanced Enumeration**:
   - Expand with larger lists like `shubs-subdomains`. They will be in /usr/share/seclists
3. **Protocol Testing**:
   - Use both HTTP and HTTPS when testing services.

---

### **Research Phase**:
#### **Online Research Optimization**:
1. **Webpage Download**:
   - Use `wget` to download webpages related to writeups and hints for token efficiency.
2. **Incremental Reading**:
   - Review downloaded pages section by section, deciding whether to continue reading or stop.

#### **Feedback Loop**:
- Push findings from exploitation back to the Research Phase for refinement.
- Explore new exploit scripts, techniques, and review writeups iteratively.

---

### **Exploitation Phase**:
1. **Domain-Level Exploits**:
   - Use **Certipy** for Kerberos roasting, DNS attacks, or certificate abuse.
   - Focus on manipulating Active Directory for Windows boxes.
2. **Web Exploits**:
   - **SQLi**, **LFI**, **RCE** on web services discovered during enumeration.
   - Adapt according to writeups or observed vulnerabilities.
3. **Privilege Escalation**:
   - **LinPEAS/WinPEAS** for misconfigurations on Linux/Windows boxes.
   - Exploit writable files, cron jobs, or vulnerable services.

---

### **Dynamic Capture in Graph Memory**:
- **Entities**:
  - Techniques, tools, phases, decision trees saved as relations in graph memory.
- **Iterative Updates**:
  - Continuously refine methods and decision trees based on discoveries.
- **Visualization**:
  - The methodology is structured like a **random walk**, with decision paths and feedback loops.

---

### Core Tools:
- **Enumeration**:
  - RustScan, Nmap, Gobuster, Nikto, bloodhound, burp
- **Exploitation**:
  - Certipy, Impacket, Burp Suite, LinPEAS, bloodyad, nxc
- **Research**:
  - Google Search, GitHub Search, wget for writeup downloads.

---

### Strengths:
- Adaptability through iterative feedback between research and exploitation.
- Organized storage of files and findings for seamless progress tracking.
- Effective use of both semi-automated tools (e.g., RustScan, LinPEAS) and manual research.



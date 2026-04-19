# Wallet
Token Name: Efikcoin Eternal Symbol: ECE Network: BNB Smart Chain (BEP-20) Contract Address: 0x9F8C29E496ECB6C39c221458f211234DfCB233E0 Decimal: 18
# EfikCoin Eternal – Rename Guide (Mainnet Ready)

Use this checklist to ensure every component of the ecosystem has the correct, final name before going live.

---

## 1. GitHub Repository Names

| Current (example) | Final (production) |
|-------------------|---------------------|
| `Wallet` | `ece-wallet` |
| `Efikcoin-website` | `efikcoin-website` |
| `tg-miniapp` | `efikcoin-miniapp` |
| `Admin` | `efikcoin-admin` |

**Action:** Rename repositories in GitHub Settings → Repository name. Update all internal links accordingly.

---

## 2. Telegram Bot

| Current | Final |
|---------|-------|
| `@ECEwalletbot` | `@EfikCoinBot` (or keep as is) |
| Bot name | `EfikCoin Eternal` |

**Action:** Use `@BotFather` to update bot name, username, description, and menu button.

---

## 3. Smart Contract (ECE Token)

| Field | Value (already correct) |
|-------|-------------------------|
| Token name | `EfikCoin Eternal` |
| Symbol | `ECE` |
| Contract address | `0x9F8C29E496ECB6C39c221458f211234DfCB233E0` |
| Admin address | `0xC5AD5cfcF81AD63a94227334b898eafCe6B27cCA` |

**Action:** No changes needed. Verify on BscScan.

---

## 4. RPC Endpoints

| Network | RPC URL |
|---------|---------|
| BSC Mainnet | `https://bsc-mainnet.nodereal.io/v1/YOUR_API_KEY` |
| Ethereum Mainnet | `https://mainnet.infura.io/v3/YOUR_PROJECT_ID` |
| Polygon Mainnet | `https://polygon-rpc.com` |

**Action:** Replace placeholder API keys with your own if needed.

---

## 5. Website & Wallet URLs

| Component | Production URL |
|-----------|----------------|
| Main website | `https://sovereign-ece.github.io/efikcoin-website` |
| Wallet | `https://sovereign-ece.github.io/ece-wallet` |
| Telegram Mini App | `https://sovereign-ece.github.io/efikcoin-miniapp` |
| Admin dashboard | `https://sovereign-ece.github.io/efikcoin-admin` |

**Action:** Update all internal links in HTML files to point to these final URLs.

---

## 6. Environment Variables (if any backend is added)

```env
TOKEN_ADDRESS=0x9F8C29E496ECB6C39c221458f211234DfCB233E0
ADMIN_ADDRESS=0xC5AD5cfcF81AD63a94227334b898eafCe6B27cCA
BSC_RPC=https://bsc-mainnet.nodereal.io/v1/your-key

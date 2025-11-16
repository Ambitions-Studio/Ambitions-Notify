# 🤝 Contributing to Ambitions Notifications

Thank you for considering contributing to **Ambitions Notifications**!  
We welcome all contributions — whether it's bug fixes, improvements, new features, or documentation enhancements.

This document explains the contribution rules and workflow to ensure clean, consistent, and high-quality work across the Ambitions ecosystem.

---

## 📌 Code of Conduct

By participating in this project, you agree to follow the **Ambitions Community Code of Conduct**:

- Be respectful and constructive  
- Avoid personal attacks  
- Help maintain a positive development environment  
- Collaborate with transparency and honesty  

---

## 🛠️ How to Contribute

### 1️⃣ Fork the Repository

Click **Fork** at the top right of the GitHub page, then clone your fork locally:

~~~bash
git clone https://github.com/YOUR-USERNAME/Ambitions-Notifications.git
cd Ambitions-Notifications
~~~

---

### 2️⃣ Create a Feature Branch

All contributions must be made in a dedicated branch:

~~~bash
git checkout -b feature/my-new-feature
~~~

Use clear and descriptive branch names:
- `feature/custom-animation`
- `fix/warning-not-showing`
- `refactor/ui-transitions`

---

### 3️⃣ Write Clean, Consistent Code

Follow these guidelines:

#### 🧼 General Rules
- Write **clean, readable, and commented** code  
- Avoid unnecessary complexity  
- No large PRs — keep changes focused and isolated  
- Use meaningful variable and function names

#### 🧩 Lua Guidelines
- Follow Lua 5.4 conventions  
- Use `local` whenever possible  
- Keep functions small and modular  
- Avoid global variables (Ambitions architecture forbids them)

#### 🎨 UI Guidelines (HTML/CSS/JS)
- Keep CSS structured and easy to override  
- Avoid inline styles  
- Use modern, lightweight JS  
- Ensure compatibility with FiveM NUI Chromium

---

### 4️⃣ Test Your Changes

Before submitting a PR, make sure:
- Notifications display correctly  
- No console errors (client or server)  
- Performance is not impacted  
- UI responsiveness is preserved  
- All existing features still work

A contribution will not be merged if it breaks anything already implemented.

---

### 5️⃣ Submit a Pull Request

Go to your fork and click:

➡️ **New Pull Request**

Make sure to include:
- A clear title  
- A detailed description of what you changed  
- Screenshots or videos (for UI-related changes)  
- References to issues if applicable (e.g. `Closes #12`)

**PRs that follow the format are reviewed faster.**

---

## 🐛 Reporting Bugs

Before opening an issue:
1. Check if the bug is already reported  
2. Provide as much detail as possible

Include:
- Steps to reproduce  
- Expected vs actual behavior  
- Server artifacts version  
- Screenshots or console logs if available

Use the appropriate **Bug Report** issue template.

---

## 💡 Suggesting Features

We welcome ideas!

Submit a **Feature Request** issue and explain:
- The problem you want to solve  
- Why it's beneficial  
- How it integrates with the framework  
- Possible UI or API design ideas

---

## 📁 Project Structure

~~~
Ambitions-Notifications/
│
├── client/             # Client-side Lua logic
├── server/             # Server events & triggers
├── html/               # NUI (HTML/CSS/JS)
│   ├── css/
│   ├── js/
│   └── img/
├── config.lua          # Main configuration
└── fxmanifest.lua      # Resource declaration
~~~

Please respect this structure when adding files.

---

## 🔍 Code Review Process

All PRs are reviewed by maintainers.  
A PR may be:
- **Approved**
- **Requested Changes**
- **Rejected** (with explanation)

Code must meet quality, performance, and consistency standards before merging.

---

## 📜 License

By contributing, you agree that your work is submitted under the **LGPL 3.0 License** of the project.

---

## ❤️ Thank You

Your contributions help make the Ambitions ecosystem stronger, modern, and professional.

**Thank you for helping improve Ambitions Notifications!**

# MovieStarPlanet (All Versions) High CPU & Lag Fix for macOS

Fix the **90-100% CPU usage**, heavy lag, and overheating for **all MovieStarPlanet versions** (MSP Classic, MSP 1, MSP 2, etc.) on **macOS Monterey, Ventura, Sonoma, and Sequoia**.

> ⚠️ **Note:** This fix is only meaningful on Macs with a **Retina (high-resolution) display**. Non-Retina screens typically don't experience this issue.

---

## Why does this happen?

MovieStarPlanet runs on older engines (Adobe AIR / Flash or Web wrappers). On Retina displays, macOS forces the game to render at 4x pixel density (HiDPI) using heavy single-core CPU power. Since Apple removed the *"Open in Low Resolution"* checkbox in macOS Monterey, the CPU gets bottlenecked.

---

## How to Use (Easy Steps)

1. **Quit the game completely** (`Cmd + Q`).
2. **Download `fix-msp.sh`** from this page (green **Code** button → **Download ZIP**, or click the file and press **Download**).
3. **Open Terminal** (press `Cmd + Space`, type `Terminal`, press Enter).
4. **Drag and drop** the `fix-msp.sh` file into the Terminal window. A file path will appear automatically (it will look something like `/Users/.../Downloads/fix-msp.sh` — don't worry, yours will be different).
5. **Click at the very beginning of that line and type `bash ` (with a space).** The line should now start with `bash /Users/...`
6. **Press Enter.**

That's it! The script will find your MovieStarPlanet apps and fix them automatically.

7. **Launch the game.** You can now play smoothly on **Medium/High/Ultra** settings.

> 💡 **Tip:** Visual quality may look slightly blurry — this is expected in exchange for the performance gain.

---

## What does the script do?

| Action | Description |
|---|---|
| **Strictly Targets MSP Apps** | Only modifies genuine MovieStarPlanet bundles and completely ignores `/System`, `/Library`, and unrelated software. |
| **Disables Retina Scaling (`NSHighResolutionCapable false`)** | Cuts pixel-rendering CPU load by up to 75%. |
| **Removes App Quarantine (`xattr -cr`)** | Prevents macOS App Translocation limits if the app is in Downloads or Desktop. |
| **Refreshes macOS Cache (`touch`)** | Applies changes immediately without restarting. |

---

## How to Revert

Changed your mind? No problem.

1. **Download `revert-msp.sh`** from this page.
2. **Open Terminal** (`Cmd + Space`, type `Terminal`, press Enter).
3. **Drag and drop** the `revert-msp.sh` file into the Terminal window. A file path will appear automatically (something like `/Users/.../Downloads/revert-msp.sh`).
4. **Click at the very beginning of that line and type `bash ` (with a space).** The line should now start with `bash /Users/...`
5. **Press Enter.**

Done! Your game will go back to its original Retina quality.

---

## FAQ

<details>
<summary><b>Does this fix work on every Mac?</b></summary>

It only makes sense if MovieStarPlanet is installed and you're using a Mac with a Retina display. It works on both Intel and Apple Silicon (M-series) chips — the chip type doesn't matter.

</details>

<details>
<summary><b>I have a non-Retina screen — should I still apply it?</b></summary>

No. Non-Retina screens typically don't experience this issue, and applying the fix may unnecessarily reduce visual quality.

</details>

<details>
<summary><b>Why does the game look blurry now?</b></summary>

The game is no longer rendering at Retina density but at a lower resolution. This is the direct result of the CPU savings.

</details>

<details>
<summary><b>Is it safe?</b></summary>

Yes. The scripts only modify the `Info.plist` file inside the app bundle; they do not touch system files, the kernel, or drivers. Every change can be undone by running `revert-msp.sh`.

</details>

<details>
<summary><b>Which macOS versions does it support?</b></summary>

Tested on Monterey (12), Ventura (13), Sonoma (14), and Sequoia (15). On older versions, the "Open in Low Resolution" checkbox still exists, so this script isn't needed.

</details>

## Contributing

Bug reports and pull requests are welcome. If something doesn't work, please open an **Issue** on this page — I'll help you out.

 (cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF' 
diff --git a/theme.css b/theme.css
index 51f79adfdd6ec47a84be706106cc2409c8e1bb2e..2d239cb56584796736000243b7f7a2f71b2cdbce 100644
--- a/theme.css
+++ b/theme.css
@@ -1,229 +1,125 @@
 /**
- * @name Makima Dominance – Glass Cinematic
- * @version 1.0 Stable
- * @description Subtle cinematic red glass for Vencord
+ * @name Makima Dominance – Vencord Stable Glass
+ * @author s0uth09
+ * @version 1.4
+ * @description Vencord-tuned Makima glass: visible wallpaper, no blackout overlay, and safer selectors.
  */
 
-@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');
+@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
 
 :root {
-  --bg: url('https://raw.githubusercontent.com/s0uth09/Makima-Discord-Theme/main/wallpaper.jpg');
-
-  --glass-light: rgba(25, 8, 14, 0.45);
-  --glass-strong: rgba(15, 4, 8, 0.65);
+  --bg-remote: url('https://images.alphacoders.com/131/1316640.jpg');
+  --bg-local: url('wallpaper.jpg');
+  --bg-fallback: linear-gradient(155deg, #14060b 0%, #1a080f 50%, #0a0306 100%);
 
-  --accent-red: rgba(200, 35, 45, 0.45);
-  --accent-red-soft: rgba(200, 35, 45, 0.25);
+  --glass: rgba(20, 6, 10, 0.36);
+  --glass-dark: rgba(12, 4, 7, 0.54);
+  --glass-modal: rgba(16, 6, 10, 0.72);
 
-  --blur-main: blur(22px);
-  --blur-soft: blur(14px);
+  --red-soft: rgba(210, 35, 35, 0.22);
+  --red-glow: rgba(210, 35, 35, 0.30);
 
-  --radius: 16px;
+  --blur-main: 12px;
+  --blur-soft: 8px;
+  --radius: 14px;
 }
 
-/* ===== BACKGROUND LAYER ===== */
-
-.baseLayer,
+/* ===================== SAFE ROOT ===================== */
+html,
+body,
+#app-mount,
 [class*="app-"],
 [class*="layers-"] {
-  background: var(--bg) center/cover no-repeat fixed !important;
+  background: transparent !important;
 }
 
-/* Subtle cinematic dark gradient */
-.baseLayer::after {
+/* Dedicated wallpaper layer (no heavy global dark overlay) */
+body::before {
   content: "";
   position: fixed;
   inset: 0;
-  background: linear-gradient(
-    to bottom,
-    rgba(10, 2, 6, 0.75),
-    rgba(25, 5, 10, 0.65),
-    rgba(10, 2, 6, 0.75)
-  );
+  background-image: var(--bg-local), var(--bg-remote), var(--bg-fallback);
+  background-size: cover;
+  background-position: center;
+  background-repeat: no-repeat;
+  background-attachment: fixed;
+  z-index: -2;
   pointer-events: none;
 }
 
-/* ===== GLASS PANELS ===== */
-
-[class*="chat"],
-[class*="messagesWrapper"],
-[class*="privateChannels"],
-[class*="members"],
-[class*="sidebar"],
-[class*="container"] {
-  background: var(--glass-strong) !important;
-  backdrop-filter: var(--blur-main) !important;
-  border-radius: var(--radius);
-}
-
-/* Lighter glass for interactive items */
-
-[class*="wrapper__"],
-[class*="interactive__"],
-[class*="channel-"] {
-  background: var(--glass-light) !important;
-  backdrop-filter: var(--blur-soft) !important;
-  border-radius: 12px;
-  transition: background 0.25s ease, box-shadow 0.25s ease;
-}
-
-/* ===== HOVER EFFECT ===== */
-
-[class*="wrapper__"]:hover,
-[class*="interactive__"]:hover {
-  background: var(--accent-red-soft) !important;
-  box-shadow: 0 0 18px var(--accent-red);
-}
-
-/* ===== INPUT / HEADER ===== */
-
-[class*="channelTextArea"],
-[class*="toolbar"],
-[class*="title"] {
-  background: var(--glass-light) !important;
-  backdrop-filter: var(--blur-soft) !important;
-  border-radius: var(--radius);
-}
-
-/* ===== MODALS ===== */
-
-[class*="modal"],
-[class*="layerContainer"],
-[class*="popout"] {
-  background: rgba(20, 5, 10, 0.75) !important;
-  backdrop-filter: blur(28px) !important;
-  border-radius: var(--radius);
-}
-
-/* ===== TEXT POLISH ===== */
-
-body {
-  font-family: 'Inter', sans-serif !important;
-}
-
-[class*="heading-"] {
-  letter-spacing: 0.5px;
-}/**
- * @name Makima Dominance
- * @author s0uth09 
- * @version beta 4 (Vencord Stable)
- * @description Makima red glass theme – fixed blur
- */
-
-@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
-
-/* ====================== ROOT ====================== */
-:root {
-  --bg: url('https://raw.githubusercontent.com/s0uth09/Makima-Discord-Theme/main/wallpaper.jpg') center/cover no-repeat fixed;
-
-  --glass: rgba(22, 7, 11, 0.45);
-  --glass-strong: rgba(12, 4, 7, 0.65);
-  --red-glow: rgba(180, 25, 25, 0.35);
-  --red-glow-hover: rgba(210, 35, 35, 0.55);
-
-  --blur: blur(18px);
-  --blur-light: blur(12px);
-  --radius: 14px;
-}
-
-/* ====================== TRUE TRANSPARENT BASE ====================== */
-html,
-body,
-#app-mount,
-[class*="app-"],
-[class*="layers-"],
-[class*="baseLayer"] {
-  background: transparent !important;
-}
-
-/* Wallpaper layer */
-#app-mount::before {
+/* Light readability tint only */
+body::after {
   content: "";
   position: fixed;
   inset: 0;
-  background: var(--bg);
+  background: linear-gradient(to bottom, rgba(8, 2, 4, 0.20), rgba(8, 2, 4, 0.12), rgba(8, 2, 4, 0.20));
   z-index: -1;
+  pointer-events: none;
 }
 
-/* ====================== SIDEBAR / DM LIST ====================== */
+/* Only neutralize truly background helper layers */
+[class*="bg-"],
+[class*="backdrop-"] {
+  background-color: transparent !important;
+}
+
+/* ===================== GLASS PANELS ===================== */
 [class*="privateChannels"],
-.sidebar_ded4b2 {
-  background: var(--glass-strong) !important;
-  backdrop-filter: var(--blur) !important;
-  border-right: 1px solid rgba(180,25,25,0.25);
+[class*="sidebar"],
+.sidebar_ded4b2,
+[class*="chat-"],
+[class*="messagesWrapper"],
+[class*="members-"],
+[class*="membersWrap"],
+[class*="contentRegion"] {
+  background: var(--glass-dark) !important;
+  backdrop-filter: blur(var(--blur-main)) saturate(115%) !important;
+  -webkit-backdrop-filter: blur(var(--blur-main)) saturate(115%) !important;
+  border-radius: var(--radius);
 }
 
+/* Interactive items */
 [class*="wrapper__"],
-[class*="interactive__"],
 [class*="containerDefault__"],
+[class*="interactive__"],
 [class*="channel-"] {
   background: var(--glass) !important;
-  backdrop-filter: var(--blur-light) !important;
-  border-radius: var(--radius);
-  margin: 3px 6px;
+  backdrop-filter: blur(var(--blur-soft)) !important;
+  -webkit-backdrop-filter: blur(var(--blur-soft)) !important;
+  border-radius: 12px;
+  transition: background-color 0.2s ease, box-shadow 0.2s ease;
 }
 
 [class*="wrapper__"]:hover,
-[class*="selected"] [class*="wrapper__"] {
-  background: var(--red-glow-hover) !important;
-  backdrop-filter: blur(20px);
-}
-
-/* ====================== CHAT AREA ====================== */
-[class*="chat-"],
-[class*="messagesWrapper"],
-[class*="scrollerContent__"] {
-  background: var(--glass-strong) !important;
-  backdrop-filter: var(--blur-light) !important;
+[class*="selected"] [class*="wrapper__"],
+[class*="interactive__"]:hover {
+  background: var(--red-soft) !important;
+  box-shadow: 0 0 12px var(--red-glow);
 }
 
-/* ====================== HEADER / INPUT ====================== */
+/* Header / composer */
 [class*="toolbar-"],
-[class*="title-"],
-[class*="form-"],
-[class*="channelTextArea"] {
+[class*="channelTextArea"],
+[class*="form-"] {
   background: var(--glass) !important;
-  backdrop-filter: var(--blur) !important;
-}
-
-/* ====================== MEMBERS PANEL ====================== */
-[class*="members-"] {
-  background: var(--glass-strong) !important;
-  backdrop-filter: var(--blur-light) !important;
+  backdrop-filter: blur(var(--blur-main)) !important;
+  -webkit-backdrop-filter: blur(var(--blur-main)) !important;
+  border-radius: var(--radius);
 }
 
-/* ====================== PROFILE PANEL ====================== */
+/* Popouts / profiles / modals */
 [class*="userPopout"],
-[class*="root_"],
 [class*="topSection"],
-[class*="body__"],
-[class*="profileInfo"],
-[class*="section"],
-[class*="bio"] {
-  background: var(--glass) !important;
-  backdrop-filter: var(--blur) !important;
-  border-radius: var(--radius);
-}
-
-/* ====================== MODALS ====================== */
+[class*="modal"],
 [class*="layerContainer"],
-[class*="popout"],
-[class*="modal"] {
-  background: rgba(10, 5, 8, 0.75) !important;
-  backdrop-filter: blur(22px) !important;
+[class*="popout"] {
+  background: var(--glass-modal) !important;
+  backdrop-filter: blur(16px) !important;
+  -webkit-backdrop-filter: blur(16px) !important;
   border-radius: var(--radius);
 }
 
-/* ====================== CLEAN TRANSITIONS ====================== */
-button,
-[class*="wrapper__"],
-[class*="interactive__"] {
-  transition: background 0.22s ease, backdrop-filter 0.22s ease;
-}
-
-/* ====================== REMOVE RANDOM DARK PATCHES ====================== */
-[class*="container__"],
-[class*="contentRegion"],
-[class*="standardSidebarView"] {
-  background: transparent !important;
+/* Typography */
+body {
+  font-family: 'Inter', sans-serif !important;
 }
 
EOF
)
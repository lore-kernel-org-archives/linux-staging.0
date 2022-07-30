Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA791FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:34:14 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id e8-20020a17090a280800b001f2fef7886eso6881495pjd.3
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=qfp9FIRO2MT4/LBeOtSTUDAhXRBeZOjBM35FZKBzNM8=;
        b=CxzJxM0SOi9lCYU129tpm0k5nmueVKzspaLrLmYUNwc1QlCzdoPhkyCIo5csqtHFAm
         bs68KlpFH5N9lT6o7v4tQ49Xv6uEP/8ZjmbamdCrUf+RBro6i2f+sF4y9fnSqSE4m1rS
         25rN8dKpJEyKrzCcz9G8ui3WBOpBI9dRhEftlS/ZFT6jgu1/ZjjZdwkpHAiVhyjUGfPZ
         fsWsaj9qJ6ezxoav+NDFpz0NS/TLbu4wTR34DupwvCdbFRUJDq65BOwfKCn8NWcwagUw
         BNVVqkGtJz/AMWVkXjF/v3LCDBvo96kb0tl9Hz337eWC51mmxZ1kQsSY6siXypaLC1JF
         U8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=qfp9FIRO2MT4/LBeOtSTUDAhXRBeZOjBM35FZKBzNM8=;
        b=wGz00VwDcH6fhky5qgEzsGLYIu18zd2+8Xiu1n1AI5eTveIkNnvbeC80Wn2vv1zunH
         P7+hGIXFnmrtXhWLN4pl0NpB2Wqvp3zebnpafdrgeopKKyHLblURYIufsQ5Jr/LauqBq
         3MbteTs4WEViJ7Wp9BhQJiWAfYMund/hBB+qZ8qv9Hz/6sN+MWAQNk0VPpxB/uFRjez9
         lJleqfAD0ByGgZqN83Pn43oGpBHjsdeixVj5wfVR/dRn7H8IVy1lWG+ysSbXGMXh1Khr
         OMAHHHYe1WDub6+SAzY/G/DrJb4TF/Y+yMhkq+rqxtjCsJi8DvFT3eCoihCimFCfvdV0
         B0jQ==
X-Gm-Message-State: ACgBeo1GZM8/uSzctj9G/DhFwFlEpNjGnVjTRxhfdFKJNLq2ziTuHWw7
	Tlwlo4VML3PcEXpjWpXtoTE/cAWIWOD+vw==
X-Google-Smtp-Source: AA6agR5HspSEAcTvYhJn2VU8byqHAvXQX3aXUFwlQvRswXzR7+3Mf1DaAg1Hn4AzsqJywfVLvCY6Ug==
X-Received: by 2002:a17:90b:4d88:b0:1f3:34aa:9167 with SMTP id oj8-20020a17090b4d8800b001f334aa9167mr6447950pjb.133.1659152053308;
        Fri, 29 Jul 2022 20:34:13 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:f0d:9a23:40c8:9423])
        by smtp.googlemail.com with ESMTPSA id h3-20020a170902f54300b0016a3248376esm4441555plf.181.2022.07.29.20.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 20:34:13 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Colin Ian King <colin.king@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 1/4] staging: rtl8192u: move debug stuff to its own file
Date: Fri, 29 Jul 2022 20:33:21 -0700
Message-Id: <20220730033335.74153-2-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YuOLybUZ8cBWntY/@kroah.com>
References: <YuOLybUZ8cBWntY/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is to prepare for moving them to debugfs and fix rmmod warn issue
when wlan0 is renamed to something else.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/Makefile        |   1 +
 drivers/staging/rtl8192u/r8192U.h        |   4 +
 drivers/staging/rtl8192u/r8192U_core.c   | 173 ----------------------
 drivers/staging/rtl8192u/r8192U_procfs.c | 175 +++++++++++++++++++++++
 4 files changed, 180 insertions(+), 173 deletions(-)
 create mode 100644 drivers/staging/rtl8192u/r8192U_procfs.c

diff --git a/drivers/staging/rtl8192u/Makefile b/drivers/staging/rtl8192u/Makefile
index 0be7426b6ebc..5aef46cc90ef 100644
--- a/drivers/staging/rtl8192u/Makefile
+++ b/drivers/staging/rtl8192u/Makefile
@@ -8,6 +8,7 @@ ccflags-y += -DTHOMAS_BEACON -DTHOMAS_TASKLET -DTHOMAS_SKB -DTHOMAS_TURBO
 r8192u_usb-y := r8192U_core.o r8180_93cx6.o r8192U_wx.o		\
 		  r8190_rtl8256.o r819xU_phy.o r819xU_firmware.o	\
 		  r819xU_cmdpkt.o r8192U_dm.o r819xU_firmware_img.o	\
+		  r8192U_procfs.o					\
 		  ieee80211/ieee80211_crypt.o				\
 		  ieee80211/ieee80211_crypt_tkip.o			\
 		  ieee80211/ieee80211_crypt_ccmp.o			\
diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index 14ca00a2789b..e8b6da2adc4d 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1117,4 +1117,8 @@ void EnableHWSecurityConfig8192(struct net_device *dev);
 void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 	    const u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
 
+void rtl8192_proc_module_init(void);
+void rtl8192_proc_init_one(struct net_device *dev);
+void rtl8192_proc_remove_one(struct net_device *dev);
+
 #endif
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 2ca925f35830..9e0861fdc64e 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -452,179 +452,6 @@ static struct net_device_stats *rtl8192_stats(struct net_device *dev);
 static void rtl8192_restart(struct work_struct *work);
 static void watch_dog_timer_callback(struct timer_list *t);
 
-/****************************************************************************
- *   -----------------------------PROCFS STUFF-------------------------
- ****************************************************************************/
-
-static struct proc_dir_entry *rtl8192_proc;
-
-static int __maybe_unused proc_get_stats_ap(struct seq_file *m, void *v)
-{
-	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
-	struct ieee80211_device *ieee = priv->ieee80211;
-	struct ieee80211_network *target;
-
-	list_for_each_entry(target, &ieee->network_list, list) {
-		const char *wpa = "non_WPA";
-
-		if (target->wpa_ie_len > 0 || target->rsn_ie_len > 0)
-			wpa = "WPA";
-
-		seq_printf(m, "%s %s\n", target->ssid, wpa);
-	}
-
-	return 0;
-}
-
-static int __maybe_unused proc_get_registers(struct seq_file *m, void *v)
-{
-	struct net_device *dev = m->private;
-	int i, n, max = 0xff;
-	u8 byte_rd;
-
-	seq_puts(m, "\n####################page 0##################\n ");
-
-	for (n = 0; n <= max;) {
-		seq_printf(m, "\nD:  %2x > ", n);
-
-		for (i = 0; i < 16 && n <= max; i++, n++) {
-			read_nic_byte(dev, 0x000 | n, &byte_rd);
-			seq_printf(m, "%2x ", byte_rd);
-		}
-	}
-
-	seq_puts(m, "\n####################page 1##################\n ");
-	for (n = 0; n <= max;) {
-		seq_printf(m, "\nD:  %2x > ", n);
-
-		for (i = 0; i < 16 && n <= max; i++, n++) {
-			read_nic_byte(dev, 0x100 | n, &byte_rd);
-			seq_printf(m, "%2x ", byte_rd);
-		}
-	}
-
-	seq_puts(m, "\n####################page 3##################\n ");
-	for (n = 0; n <= max;) {
-		seq_printf(m, "\nD:  %2x > ", n);
-
-		for (i = 0; i < 16 && n <= max; i++, n++) {
-			read_nic_byte(dev, 0x300 | n, &byte_rd);
-			seq_printf(m, "%2x ", byte_rd);
-		}
-	}
-
-	seq_putc(m, '\n');
-	return 0;
-}
-
-static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
-{
-	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
-
-	seq_printf(m,
-		   "TX VI priority ok int: %lu\n"
-		   "TX VI priority error int: %lu\n"
-		   "TX VO priority ok int: %lu\n"
-		   "TX VO priority error int: %lu\n"
-		   "TX BE priority ok int: %lu\n"
-		   "TX BE priority error int: %lu\n"
-		   "TX BK priority ok int: %lu\n"
-		   "TX BK priority error int: %lu\n"
-		   "TX MANAGE priority ok int: %lu\n"
-		   "TX MANAGE priority error int: %lu\n"
-		   "TX BEACON priority ok int: %lu\n"
-		   "TX BEACON priority error int: %lu\n"
-		   "TX queue resume: %lu\n"
-		   "TX queue stopped?: %d\n"
-		   "TX fifo overflow: %lu\n"
-		   "TX VI queue: %d\n"
-		   "TX VO queue: %d\n"
-		   "TX BE queue: %d\n"
-		   "TX BK queue: %d\n"
-		   "TX VI dropped: %lu\n"
-		   "TX VO dropped: %lu\n"
-		   "TX BE dropped: %lu\n"
-		   "TX BK dropped: %lu\n"
-		   "TX total data packets %lu\n",
-		   priv->stats.txviokint,
-		   priv->stats.txvierr,
-		   priv->stats.txvookint,
-		   priv->stats.txvoerr,
-		   priv->stats.txbeokint,
-		   priv->stats.txbeerr,
-		   priv->stats.txbkokint,
-		   priv->stats.txbkerr,
-		   priv->stats.txmanageokint,
-		   priv->stats.txmanageerr,
-		   priv->stats.txbeaconokint,
-		   priv->stats.txbeaconerr,
-		   priv->stats.txresumed,
-		   netif_queue_stopped(dev),
-		   priv->stats.txoverflow,
-		   atomic_read(&(priv->tx_pending[VI_PRIORITY])),
-		   atomic_read(&(priv->tx_pending[VO_PRIORITY])),
-		   atomic_read(&(priv->tx_pending[BE_PRIORITY])),
-		   atomic_read(&(priv->tx_pending[BK_PRIORITY])),
-		   priv->stats.txvidrop,
-		   priv->stats.txvodrop,
-		   priv->stats.txbedrop,
-		   priv->stats.txbkdrop,
-		   priv->stats.txdatapkt
-		);
-
-	return 0;
-}
-
-static int __maybe_unused proc_get_stats_rx(struct seq_file *m, void *v)
-{
-	struct net_device *dev = m->private;
-	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
-
-	seq_printf(m,
-		   "RX packets: %lu\n"
-		   "RX urb status error: %lu\n"
-		   "RX invalid urb error: %lu\n",
-		   priv->stats.rxoktotal,
-		   priv->stats.rxstaterr,
-		   priv->stats.rxurberr);
-
-	return 0;
-}
-
-static void rtl8192_proc_module_init(void)
-{
-	RT_TRACE(COMP_INIT, "Initializing proc filesystem");
-	rtl8192_proc = proc_mkdir(RTL819XU_MODULE_NAME, init_net.proc_net);
-}
-
-static void rtl8192_proc_init_one(struct net_device *dev)
-{
-	struct proc_dir_entry *dir;
-
-	if (!rtl8192_proc)
-		return;
-
-	dir = proc_mkdir_data(dev->name, 0, rtl8192_proc, dev);
-	if (!dir)
-		return;
-
-	proc_create_single("stats-rx", S_IFREG | 0444, dir,
-			   proc_get_stats_rx);
-	proc_create_single("stats-tx", S_IFREG | 0444, dir,
-			   proc_get_stats_tx);
-	proc_create_single("stats-ap", S_IFREG | 0444, dir,
-			   proc_get_stats_ap);
-	proc_create_single("registers", S_IFREG | 0444, dir,
-			   proc_get_registers);
-}
-
-static void rtl8192_proc_remove_one(struct net_device *dev)
-{
-	remove_proc_subtree(dev->name, rtl8192_proc);
-}
-
 /****************************************************************************
  *  -----------------------------MISC STUFF-------------------------
  *****************************************************************************/
diff --git a/drivers/staging/rtl8192u/r8192U_procfs.c b/drivers/staging/rtl8192u/r8192U_procfs.c
new file mode 100644
index 000000000000..69cbafceecfe
--- /dev/null
+++ b/drivers/staging/rtl8192u/r8192U_procfs.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+/****************************************************************************
+ *   -----------------------------PROCFS STUFF-------------------------
+ ****************************************************************************/
+#include <linux/proc_fs.h>
+#include <linux/seq_file.h>
+#include "r8192U.h"
+
+static struct proc_dir_entry *rtl8192_proc;
+static int __maybe_unused proc_get_stats_ap(struct seq_file *m, void *v)
+{
+	struct net_device *dev = m->private;
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+	struct ieee80211_device *ieee = priv->ieee80211;
+	struct ieee80211_network *target;
+
+	list_for_each_entry(target, &ieee->network_list, list) {
+		const char *wpa = "non_WPA";
+
+		if (target->wpa_ie_len > 0 || target->rsn_ie_len > 0)
+			wpa = "WPA";
+
+		seq_printf(m, "%s %s\n", target->ssid, wpa);
+	}
+
+	return 0;
+}
+
+static int __maybe_unused proc_get_registers(struct seq_file *m, void *v)
+{
+	struct net_device *dev = m->private;
+	int i, n, max = 0xff;
+	u8 byte_rd;
+
+	seq_puts(m, "\n####################page 0##################\n ");
+
+	for (n = 0; n <= max;) {
+		seq_printf(m, "\nD:  %2x > ", n);
+
+		for (i = 0; i < 16 && n <= max; i++, n++) {
+			read_nic_byte(dev, 0x000 | n, &byte_rd);
+			seq_printf(m, "%2x ", byte_rd);
+		}
+	}
+
+	seq_puts(m, "\n####################page 1##################\n ");
+	for (n = 0; n <= max;) {
+		seq_printf(m, "\nD:  %2x > ", n);
+
+		for (i = 0; i < 16 && n <= max; i++, n++) {
+			read_nic_byte(dev, 0x100 | n, &byte_rd);
+			seq_printf(m, "%2x ", byte_rd);
+		}
+	}
+
+	seq_puts(m, "\n####################page 3##################\n ");
+	for (n = 0; n <= max;) {
+		seq_printf(m, "\nD:  %2x > ", n);
+
+		for (i = 0; i < 16 && n <= max; i++, n++) {
+			read_nic_byte(dev, 0x300 | n, &byte_rd);
+			seq_printf(m, "%2x ", byte_rd);
+		}
+	}
+
+	seq_putc(m, '\n');
+	return 0;
+}
+
+static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
+{
+	struct net_device *dev = m->private;
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+
+	seq_printf(m,
+		   "TX VI priority ok int: %lu\n"
+		   "TX VI priority error int: %lu\n"
+		   "TX VO priority ok int: %lu\n"
+		   "TX VO priority error int: %lu\n"
+		   "TX BE priority ok int: %lu\n"
+		   "TX BE priority error int: %lu\n"
+		   "TX BK priority ok int: %lu\n"
+		   "TX BK priority error int: %lu\n"
+		   "TX MANAGE priority ok int: %lu\n"
+		   "TX MANAGE priority error int: %lu\n"
+		   "TX BEACON priority ok int: %lu\n"
+		   "TX BEACON priority error int: %lu\n"
+		   "TX queue resume: %lu\n"
+		   "TX queue stopped?: %d\n"
+		   "TX fifo overflow: %lu\n"
+		   "TX VI queue: %d\n"
+		   "TX VO queue: %d\n"
+		   "TX BE queue: %d\n"
+		   "TX BK queue: %d\n"
+		   "TX VI dropped: %lu\n"
+		   "TX VO dropped: %lu\n"
+		   "TX BE dropped: %lu\n"
+		   "TX BK dropped: %lu\n"
+		   "TX total data packets %lu\n",
+		   priv->stats.txviokint,
+		   priv->stats.txvierr,
+		   priv->stats.txvookint,
+		   priv->stats.txvoerr,
+		   priv->stats.txbeokint,
+		   priv->stats.txbeerr,
+		   priv->stats.txbkokint,
+		   priv->stats.txbkerr,
+		   priv->stats.txmanageokint,
+		   priv->stats.txmanageerr,
+		   priv->stats.txbeaconokint,
+		   priv->stats.txbeaconerr,
+		   priv->stats.txresumed,
+		   netif_queue_stopped(dev),
+		   priv->stats.txoverflow,
+		   atomic_read(&(priv->tx_pending[VI_PRIORITY])),
+		   atomic_read(&(priv->tx_pending[VO_PRIORITY])),
+		   atomic_read(&(priv->tx_pending[BE_PRIORITY])),
+		   atomic_read(&(priv->tx_pending[BK_PRIORITY])),
+		   priv->stats.txvidrop,
+		   priv->stats.txvodrop,
+		   priv->stats.txbedrop,
+		   priv->stats.txbkdrop,
+		   priv->stats.txdatapkt
+		);
+
+	return 0;
+}
+
+static int __maybe_unused proc_get_stats_rx(struct seq_file *m, void *v)
+{
+	struct net_device *dev = m->private;
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+
+	seq_printf(m,
+		   "RX packets: %lu\n"
+		   "RX urb status error: %lu\n"
+		   "RX invalid urb error: %lu\n",
+		   priv->stats.rxoktotal,
+		   priv->stats.rxstaterr,
+		   priv->stats.rxurberr);
+
+	return 0;
+}
+
+void rtl8192_proc_module_init(void)
+{
+	RT_TRACE(COMP_INIT, "Initializing proc filesystem");
+	rtl8192_proc = proc_mkdir(RTL819XU_MODULE_NAME, init_net.proc_net);
+}
+
+void rtl8192_proc_init_one(struct net_device *dev)
+{
+	struct proc_dir_entry *dir;
+
+	if (!rtl8192_proc)
+		return;
+
+	dir = proc_mkdir_data(dev->name, 0, rtl8192_proc, dev);
+	if (!dir)
+		return;
+
+	proc_create_single("stats-rx", S_IFREG | 0444, dir,
+			   proc_get_stats_rx);
+	proc_create_single("stats-tx", S_IFREG | 0444, dir,
+			   proc_get_stats_tx);
+	proc_create_single("stats-ap", S_IFREG | 0444, dir,
+			   proc_get_stats_ap);
+	proc_create_single("registers", S_IFREG | 0444, dir,
+			   proc_get_registers);
+}
+
+void rtl8192_proc_remove_one(struct net_device *dev)
+{
+	remove_proc_subtree(dev->name, rtl8192_proc);
+}
-- 
2.25.1


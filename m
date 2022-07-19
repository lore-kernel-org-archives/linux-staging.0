Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58DC10FA
	for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 05:52:19 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id k19so11012985pll.5
        for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 22:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gx9DmGCVJ2WCrrLLrsOZni6uthBM6UvR6F5tXvAtnzM=;
        b=atQdd6xR4UkemCd91In8x8j3utmlrhKYqZcLD/d/CMpAK+8q+XhQ6/kzxNIG7JdJfB
         GQMZCrq31wu3r6JuVz7qcSP7zHyZ7yCVR2lB8iomPDUrI9LVKnhdoMjVG0FiqD+QA7E9
         gtwOGC/u7hagbk+yeAOcL0Md2Q9c3ssk6wjr2Z8w3Qd0xvTDC94KLrBC9wXcy2Zc850G
         QxuUWxJ57qb5mBMXH+g76qQx8J43x+QIa1J7t1NapjE/khHGUPb5MOC3RggYFfMjWgYi
         cfiGy3PcKGFzMBVP5/r02PRC0/gvJR+sP8nnDIikB/zuUlRs+FfIUpUS3Z9HjGqK3k4V
         /1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gx9DmGCVJ2WCrrLLrsOZni6uthBM6UvR6F5tXvAtnzM=;
        b=U0DntLRu2HeP+IpLdK/cWCHaTD2UlvC5FtckIsJunlXP8hcUQs0jzKb+TsJHqeAvRv
         zNO2Ee165DGCqa0oH76sUpb8Tx0RUXbqbqgAQAWoRMe4Nsz7915/J+y02LXto02va8qV
         ePcAGcPtGjBY6GrI8x1XtrXyDFa/zhOVsLUa+4b1Nq3mmM4vMGgEFg9HxzPzQ1Fu5mT4
         +BlruVRS1+dx4OMe2GnNDBzDvb0n2vjHWvRXrMl8a7aJhV1xA3wX3c/njV7T1H725w1s
         qTwxm24Gauok8M7YomexWEDHiwT4O3kHdifXgKWBL34Meb0w6AO22Qk2il1/aBinDmVG
         ms1Q==
X-Gm-Message-State: AJIora++JnvVkPx7cFoRdrbSxLUxiF6DtxGBA7YuQ2Lkzxb+XCF5ujl3
	Zmy2bQ6hWpa0goxgkH6K0/E=
X-Google-Smtp-Source: AGRyM1upECKzpCH2PoiWQph0MApqwA73XXFYOnYhQ4aV1NRSV39kEw4krboMCXcSQm7YlD1bYi18YQ==
X-Received: by 2002:a17:90b:3706:b0:1f0:ee71:3d37 with SMTP id mg6-20020a17090b370600b001f0ee713d37mr27366800pjb.45.1658209939145;
        Mon, 18 Jul 2022 22:52:19 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:33db:e37c:7ee3:662b])
        by smtp.googlemail.com with ESMTPSA id a16-20020a170902ecd000b0016c20d40ee7sm10709338plh.174.2022.07.18.22.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:52:18 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.king@intel.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@oracle.com
Subject: [PATCH v2 2/3] staging: rtl8192u: move debug files to debugfs
Date: Mon, 18 Jul 2022 22:50:37 -0700
Message-Id: <20220719055047.322355-3-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718120149.GD2338@kadam>
References: <20220718120149.GD2338@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are 4 debug files created under /proc/net/[Devname]. Devname could
Due to this is purely for debuging as files are created read only,
move this to debugfs like other NIC drivers do instead of using procfs.
This is also to prepare for address rmmod warn issue.

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/Makefile             |  2 +-
 drivers/staging/rtl8192u/r8192U.h             |  9 +--
 drivers/staging/rtl8192u/r8192U_core.c        | 15 ++---
 .../{r8192U_procfs.c => r8192U_debugfs.c}     | 55 +++++++++----------
 4 files changed, 39 insertions(+), 42 deletions(-)
 rename drivers/staging/rtl8192u/{r8192U_procfs.c => r8192U_debugfs.c} (73%)

diff --git a/drivers/staging/rtl8192u/Makefile b/drivers/staging/rtl8192u/Makefile
index 5aef46cc90ef..d32dfd89a606 100644
--- a/drivers/staging/rtl8192u/Makefile
+++ b/drivers/staging/rtl8192u/Makefile
@@ -8,7 +8,7 @@ ccflags-y += -DTHOMAS_BEACON -DTHOMAS_TASKLET -DTHOMAS_SKB -DTHOMAS_TURBO
 r8192u_usb-y := r8192U_core.o r8180_93cx6.o r8192U_wx.o		\
 		  r8190_rtl8256.o r819xU_phy.o r819xU_firmware.o	\
 		  r819xU_cmdpkt.o r8192U_dm.o r819xU_firmware_img.o	\
-		  r8192U_procfs.o					\
+		  r8192U_debugfs.o					\
 		  ieee80211/ieee80211_crypt.o				\
 		  ieee80211/ieee80211_crypt_tkip.o			\
 		  ieee80211/ieee80211_crypt_ccmp.o			\
diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index e8b6da2adc4d..e8860bb2b607 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1061,6 +1061,9 @@ typedef struct r8192_priv {
 	struct delayed_work gpio_change_rf_wq;
 	struct delayed_work initialgain_operate_wq;
 	struct workqueue_struct *priv_wq;
+
+	/* debugfs */
+	struct dentry *debugfs_dir;
 } r8192_priv;
 
 /* For rtl8187B */
@@ -1117,8 +1120,6 @@ void EnableHWSecurityConfig8192(struct net_device *dev);
 void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 	    const u8 *MacAddr, u8 DefaultKey, u32 *KeyContent);
 
-void rtl8192_proc_module_init(void);
-void rtl8192_proc_init_one(struct net_device *dev);
-void rtl8192_proc_remove_one(struct net_device *dev);
-
+void rtl8192_debugfs_init(struct net_device *dev);
+void rtl8192_debugfs_exit(struct net_device *dev);
 #endif
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 9e0861fdc64e..ac3716550505 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -56,7 +56,6 @@ double __extendsfdf2(float a)
 #include "r8192U_dm.h"
 #include <linux/usb.h>
 #include <linux/slab.h>
-#include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 /* FIXME: check if 2.6.7 is ok */
 
@@ -4557,7 +4556,7 @@ static int rtl8192_usb_probe(struct usb_interface *intf,
 		goto fail2;
 
 	RT_TRACE(COMP_INIT, "dev name=======> %s\n", dev->name);
-	rtl8192_proc_init_one(dev);
+	rtl8192_debugfs_init(dev);
 
 	RT_TRACE(COMP_INIT, "Driver probe completed\n");
 	return 0;
@@ -4591,10 +4590,11 @@ static void rtl8192_usb_disconnect(struct usb_interface *intf)
 	struct net_device *dev = usb_get_intfdata(intf);
 	struct r8192_priv *priv = ieee80211_priv(dev);
 
-	unregister_netdev(dev);
 
 	RT_TRACE(COMP_DOWN, "=============>wlan driver to be removed\n");
-	rtl8192_proc_remove_one(dev);
+	rtl8192_debugfs_exit(dev);
+
+	unregister_netdev(dev);
 
 	rtl8192_down(dev);
 	kfree(priv->pFirmware);
@@ -4645,14 +4645,12 @@ static int __init rtl8192_usb_module_init(void)
 		goto crypto_ccmp_exit;
 	}
 
-	rtl8192_proc_module_init();
 	ret = usb_register(&rtl8192_usb_driver);
 	if (ret)
-		goto rtl8192_proc_module_exit;
+		goto crypto_wep_exit;
 	return ret;
 
-rtl8192_proc_module_exit:
-	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
+crypto_wep_exit:
 	ieee80211_crypto_wep_exit();
 crypto_ccmp_exit:
 	ieee80211_crypto_ccmp_exit();
@@ -4668,7 +4666,6 @@ static int __init rtl8192_usb_module_init(void)
 static void __exit rtl8192_usb_module_exit(void)
 {
 	usb_deregister(&rtl8192_usb_driver);
-	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
 	ieee80211_crypto_wep_exit();
 	ieee80211_crypto_ccmp_exit();
 	ieee80211_crypto_tkip_exit();
diff --git a/drivers/staging/rtl8192u/r8192U_procfs.c b/drivers/staging/rtl8192u/r8192U_debugfs.c
similarity index 73%
rename from drivers/staging/rtl8192u/r8192U_procfs.c
rename to drivers/staging/rtl8192u/r8192U_debugfs.c
index cc69d78d5152..5c9376e50889 100644
--- a/drivers/staging/rtl8192u/r8192U_procfs.c
+++ b/drivers/staging/rtl8192u/r8192U_debugfs.c
@@ -1,13 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /****************************************************************************
- *   -----------------------------PROCFS STUFF-------------------------
+ *   -----------------------------DEGUGFS STUFF-------------------------
  ****************************************************************************/
-#include <linux/proc_fs.h>
+#include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include "r8192U.h"
 
-static struct proc_dir_entry *rtl8192_proc;
-static int __maybe_unused proc_get_stats_ap(struct seq_file *m, void *v)
+static int rtl8192_usb_stats_ap_show(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
 	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
@@ -26,7 +25,7 @@ static int __maybe_unused proc_get_stats_ap(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int __maybe_unused proc_get_registers(struct seq_file *m, void *v)
+static int rtl8192_usb_registers_show(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
 	int i, n, max = 0xff;
@@ -67,7 +66,7 @@ static int __maybe_unused proc_get_registers(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
+static int rtl8192_usb_stats_tx_show(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
 	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
@@ -126,7 +125,7 @@ static int __maybe_unused proc_get_stats_tx(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int __maybe_unused proc_get_stats_rx(struct seq_file *m, void *v)
+static int rtl8192_usb_stats_rx_show(struct seq_file *m, void *v)
 {
 	struct net_device *dev = m->private;
 	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
@@ -142,35 +141,35 @@ static int __maybe_unused proc_get_stats_rx(struct seq_file *m, void *v)
 	return 0;
 }
 
-void rtl8192_proc_module_init(void)
-{
-	RT_TRACE(COMP_INIT, "Initializing proc filesystem");
-	rtl8192_proc = proc_mkdir(RTL819XU_MODULE_NAME, init_net.proc_net);
-}
+DEFINE_SHOW_ATTRIBUTE(rtl8192_usb_stats_rx);
+DEFINE_SHOW_ATTRIBUTE(rtl8192_usb_stats_tx);
+DEFINE_SHOW_ATTRIBUTE(rtl8192_usb_stats_ap);
+DEFINE_SHOW_ATTRIBUTE(rtl8192_usb_registers);
 
-void rtl8192_proc_init_one(struct net_device *dev)
+void rtl8192_debugfs_init(struct net_device *dev)
 {
-	struct proc_dir_entry *dir;
+	struct dentry *dir;
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
 
-	if (!rtl8192_proc)
+	dir = debugfs_create_dir(dev->name, NULL);
+	if (IS_ERR(dir))
 		return;
 
-	dir = proc_mkdir_data(dev->name, 0, rtl8192_proc, dev);
-	if (!dir)
-		return;
+	debugfs_create_file("stats-rx", 0444, dir, dev, &rtl8192_usb_stats_rx_fops);
+	debugfs_create_file("stats-tx", 0444, dir, dev, &rtl8192_usb_stats_tx_fops);
+	debugfs_create_file("stats-ap", 0444, dir, dev, &rtl8192_usb_stats_ap_fops);
+	debugfs_create_file("registers", 0444, dir, dev, &rtl8192_usb_registers_fops);
 
-	proc_create_single("stats-rx", S_IFREG | 0444, dir,
-			   proc_get_stats_rx);
-	proc_create_single("stats-tx", S_IFREG | 0444, dir,
-			   proc_get_stats_tx);
-	proc_create_single("stats-ap", S_IFREG | 0444, dir,
-			   proc_get_stats_ap);
-	proc_create_single("registers", S_IFREG | 0444, dir,
-			   proc_get_registers);
+	priv->debugfs_dir = dir;
 }
 
-void rtl8192_proc_remove_one(struct net_device *dev)
+void rtl8192_debugfs_exit(struct net_device *dev)
 {
-	remove_proc_subtree(dev->name, rtl8192_proc);
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+
+	if (!priv->debugfs_dir)
+		return;
+	debugfs_remove_recursive(priv->debugfs_dir);
+	priv->debugfs_dir = NULL;
 }
 
-- 
2.25.1


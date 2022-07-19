Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C710FA
	for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 05:52:30 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g4so12589887pgc.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 22:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZYMw3UQMSz3H3pEqKtwqntC2HWF3rF+h4WbG3jMpFW8=;
        b=Ha35QSpftuGLQEgXNNAQerfzHjm7SNUtqmiJlu+HQ4JKZOL078A8FiEHVY1wjQPomE
         Nap3STG9AOP31UUR26j8pED2v65uTxk3WkRxNTslHnzCcm8f+5bFjFD7rexkNI6VxwbW
         U8REa6SfrY4xTk9wEnQAHV32nW8xABWcKYJOAbAvDOwFfn1GGQhU0XsgMr2kyRbIMW/Y
         +kSmdki82dBxglNQv3RMKId4Ze2YW7atEFGB2wotwUbue6OrYwaTReuJ/fvVZtUosAuc
         gMkrh5gsiu8N99B4Rc+EAqupq4K+WDcWNSaNU8yWrxeFqkdQFZ64pWb6UXlS68JJuKhH
         l+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZYMw3UQMSz3H3pEqKtwqntC2HWF3rF+h4WbG3jMpFW8=;
        b=kEV1qO1J2xuFfE+DZA0nKSnCDl5OgOxHrTw/Q3mNAMsR1M627ZU6v4yHN1GHHfF3dD
         Q9BGYnmyiI3ycXYyvg0alQOfszLkTzVZXVkIzP/Mk+COD1u9auA5hKcs/wKGNwbzQnJJ
         unAcMsVghzCKswFgyreRV3I2Otws6xNy1pikx8zPGkfzo/kh3VcJo0JCX4pFpvVkOTEP
         SltqAYwWMebtbY5Y5tzkWSb8EmswABvMXHDNR6TCxQvXDLjWy9RvmBDq82j2fN49BR9T
         +AyipIgaIx3Gc6eN+k7OC4TbdHsxEHsRsN2nqM4KuxgfxamPPT/5UTEtiXako7KqFKxu
         P8cg==
X-Gm-Message-State: AJIora+8bwRZa1X1EcUqd8ZXuSVli3Sy58da9b77fWb0QZBYm0S5+qYN
	dOjghp09EsyTMfk9Gc3eZk4=
X-Google-Smtp-Source: AGRyM1soukGXPltJ6ev+v2A3YybFvRSG3OnYXbvRS5nKZu3xhTcAgOOhJXtvZpPqKNtMxQ4hMjDMSQ==
X-Received: by 2002:a62:4e89:0:b0:52b:6c56:7aea with SMTP id c131-20020a624e89000000b0052b6c567aeamr9640831pfb.19.1658209950463;
        Mon, 18 Jul 2022 22:52:30 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:33db:e37c:7ee3:662b])
        by smtp.googlemail.com with ESMTPSA id a16-20020a170902ecd000b0016c20d40ee7sm10709338plh.174.2022.07.18.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 22:52:30 -0700 (PDT)
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
Cc: dan.carpenter@oracle.com,
	Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v2 3/3] staging: rtl8192u: fix rmmod warn when wlan0 is renamed
Date: Mon, 18 Jul 2022 22:50:38 -0700
Message-Id: <20220719055047.322355-4-ztong0001@gmail.com>
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

This driver creates 4 debug files under [devname] folder. The devname
could be wlan0 initially, however it could be renamed later to e.g.
enx00e04c00000. This will cause problem during debug file teardown since
it uses  netdev->name which is no longer wlan0. To solve this problem,
add a notifier to handle device renaming.

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Tested-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/r8192U.h         |  1 +
 drivers/staging/rtl8192u/r8192U_core.c    | 35 ++++++++++++++++++++++-
 drivers/staging/rtl8192u/r8192U_debugfs.c | 13 +++++++++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index e8860bb2b607..ccce37b7e2ae 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1122,4 +1122,5 @@ void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 
 void rtl8192_debugfs_init(struct net_device *dev);
 void rtl8192_debugfs_exit(struct net_device *dev);
+void rtl8192_debugfs_rename(struct net_device *dev);
 #endif
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index ac3716550505..5cc78c5bd706 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4606,6 +4606,30 @@ static void rtl8192_usb_disconnect(struct usb_interface *intf)
 	RT_TRACE(COMP_DOWN, "wlan driver removed\n");
 }
 
+static int rtl8192_usb_netdev_event(struct notifier_block *nb, unsigned long event,
+				    void *data)
+{
+	struct net_device *netdev = netdev_notifier_info_to_dev(data);
+
+	if (netdev->netdev_ops != &rtl8192_netdev_ops)
+		goto out;
+
+	switch (event) {
+	case NETDEV_CHANGENAME:
+		rtl8192_debugfs_rename(netdev);
+		break;
+	default:
+		break;
+	}
+
+out:
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block rtl8192_usb_netdev_notifier = {
+	.notifier_call = rtl8192_usb_netdev_event,
+};
+
 static int __init rtl8192_usb_module_init(void)
 {
 	int ret;
@@ -4615,10 +4639,16 @@ static int __init rtl8192_usb_module_init(void)
 	RT_TRACE(COMP_INIT, "Initializing module");
 	RT_TRACE(COMP_INIT, "Wireless extensions version %d", WIRELESS_EXT);
 
+	ret = register_netdevice_notifier(&rtl8192_usb_netdev_notifier);
+	if (ret) {
+		pr_err("register_netdevice_notifier failed %d\n", ret);
+		return ret;
+	}
+
 	ret = ieee80211_debug_init();
 	if (ret) {
 		pr_err("ieee80211_debug_init() failed %d\n", ret);
-		return ret;
+		goto unregister_notifier;
 	}
 
 	ret = ieee80211_crypto_init();
@@ -4660,6 +4690,8 @@ static int __init rtl8192_usb_module_init(void)
 	ieee80211_crypto_deinit();
 debug_exit:
 	ieee80211_debug_exit();
+unregister_notifier:
+	unregister_netdevice_notifier(&rtl8192_usb_netdev_notifier);
 	return ret;
 }
 
@@ -4671,6 +4703,7 @@ static void __exit rtl8192_usb_module_exit(void)
 	ieee80211_crypto_tkip_exit();
 	ieee80211_crypto_deinit();
 	ieee80211_debug_exit();
+	unregister_netdevice_notifier(&rtl8192_usb_netdev_notifier);
 	RT_TRACE(COMP_DOWN, "Exiting");
 }
 
diff --git a/drivers/staging/rtl8192u/r8192U_debugfs.c b/drivers/staging/rtl8192u/r8192U_debugfs.c
index 5c9376e50889..c94f5dfac96b 100644
--- a/drivers/staging/rtl8192u/r8192U_debugfs.c
+++ b/drivers/staging/rtl8192u/r8192U_debugfs.c
@@ -173,3 +173,16 @@ void rtl8192_debugfs_exit(struct net_device *dev)
 	priv->debugfs_dir = NULL;
 }
 
+void rtl8192_debugfs_rename(struct net_device *dev)
+{
+	struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
+
+	if (!priv->debugfs_dir)
+		return;
+
+	if (!strcmp(priv->debugfs_dir->d_name.name, dev->name))
+		return;
+
+	debugfs_rename(priv->debugfs_dir->d_parent, priv->debugfs_dir,
+		       priv->debugfs_dir->d_parent, dev->name);
+}
-- 
2.25.1


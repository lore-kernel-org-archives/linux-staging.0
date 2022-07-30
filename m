Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485881FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:34:47 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso10057207pjo.1
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=F39FaWBJWE0fi5jqGRfU1GqfOtK0kP4inIpNw2SjR3Y=;
        b=SJcJYf92oEJsAL0bPB7SolR+ToKa9Qz8iiVmJ0XentFL6hPJsm8tcisd6HuGNOfFtX
         eVQvfLqdDNV+Rza2fGLvKjZxyBsa/bxTfDXLgTnCNJywbQePjDUoc7JdwtCLWdeueuIa
         ccX3cpgXhdtVo67yJplhJ4E/Q0fqlni4FZ1dHeczDZ00CFT/yd5772IfZ/uTTdhpgyHJ
         iBgXGEPukC8RF+Yz9G5/IsvMjsH+C0QgOftbxKzywWSzgpKbKFlB0cC2M9oHE7vUv1J6
         LXzZUd4vGwUOI9LnMSFNQA7C1Oa5Qkhwe7VAAc48PH5p9G3WJgHP31PRyISloGDIFMbA
         bCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=F39FaWBJWE0fi5jqGRfU1GqfOtK0kP4inIpNw2SjR3Y=;
        b=AMyKG7w/RhKFx1rSSwtpq6mW019pf7OVdBZWrix/7VL4LeUyHaXJWujLoteMOXcnVf
         9+suKUnzjWUhNT5ft8Ndt33qiXe0UOtDDZFRaEcVKAQQTVNSuHmYwMbYGN1ILqzBGHrF
         QfaCcoYzymZIkq+B9B5QSbaEzs+T3U2A/Q9TGJOSPoF6Ui2Nzr5aK7XZ90F0x+fcXM4P
         GYfvWhHoGn8hNTUgVnkpWm6plCzk87oCaChhFooc69Ok8xqTcOlbwIFZfCORUDkkWL1C
         jZmGTyWUCbO8OuW6Hfuo/mV6BgVjSss9T4O5ymOUfhFhpVQRO0GtNNrOqvhOVlX/6ZEw
         5NYA==
X-Gm-Message-State: ACgBeo1P+2CM7j4X4WT1Acuaa5spcHCAdKNkcqjdYZ3eMfKcNOO/wwjH
	QwPaieIyFwqFJiYAeA8dy9s=
X-Google-Smtp-Source: AA6agR4J97GI3V0+ADn9hII5cBWGzM9rJnnF8lWT62AbB8FwvGMFjIsy9hsI2NMtp90D1YsralL7kw==
X-Received: by 2002:a17:902:ab0f:b0:16d:b340:bf8f with SMTP id ik15-20020a170902ab0f00b0016db340bf8fmr6781184plb.140.1659152086708;
        Fri, 29 Jul 2022 20:34:46 -0700 (PDT)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:f0d:9a23:40c8:9423])
        by smtp.googlemail.com with ESMTPSA id h3-20020a170902f54300b0016a3248376esm4441555plf.181.2022.07.29.20.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 20:34:46 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Tong Zhang <ztong0001@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Colin Ian King <colin.king@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH v4 4/4] staging: rtl8192u: fix rmmod warn when device is renamed
Date: Fri, 29 Jul 2022 20:33:24 -0700
Message-Id: <20220730033335.74153-5-ztong0001@gmail.com>
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

This driver creates 4 debug files under [devname] folder. The devname
could be wlan0 initially, however it could be renamed later to e.g.
enx00e04c00000. This will cause problem during debug file teardown since
it uses netdev->name, which is no longer wlan0. To solve this problem,
add a notifier to handle device renaming. Also note that we cannot
simply do debugfs_lookup to find out old dentry since by the time the
notifier is called, netdev->name is already changed to new name.

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Tested-by: Zheyu Ma <zheyuma97@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/r8192U.h         |  1 +
 drivers/staging/rtl8192u/r8192U_core.c    | 32 +++++++++++++++++++++++
 drivers/staging/rtl8192u/r8192U_debugfs.c |  8 ++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index 920a6a154860..420ab696fc3e 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -1122,6 +1122,7 @@ void setKey(struct net_device *dev, u8 EntryNo, u8 KeyIndex, u16 KeyType,
 
 void rtl8192_debugfs_init_one(struct net_device *dev);
 void rtl8192_debugfs_exit_one(struct net_device *dev);
+void rtl8192_debugfs_rename_one(struct net_device *dev);
 void rtl8192_debugfs_init(void);
 void rtl8192_debugfs_exit(void);
 
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 865bc0dc7c71..0a60ef20107c 100644
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
+		rtl8192_debugfs_rename_one(netdev);
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
@@ -4615,6 +4639,12 @@ static int __init rtl8192_usb_module_init(void)
 	RT_TRACE(COMP_INIT, "Initializing module");
 	RT_TRACE(COMP_INIT, "Wireless extensions version %d", WIRELESS_EXT);
 
+	ret = register_netdevice_notifier(&rtl8192_usb_netdev_notifier);
+	if (ret) {
+		pr_err("register_netdevice_notifier failed %d\n", ret);
+		return ret;
+	}
+
 	rtl8192_debugfs_init();
 	ret = ieee80211_debug_init();
 	if (ret) {
@@ -4663,6 +4693,7 @@ static int __init rtl8192_usb_module_init(void)
 	ieee80211_debug_exit();
 debugfs_exit:
 	rtl8192_debugfs_exit();
+	unregister_netdevice_notifier(&rtl8192_usb_netdev_notifier);
 	return ret;
 }
 
@@ -4675,6 +4706,7 @@ static void __exit rtl8192_usb_module_exit(void)
 	ieee80211_crypto_deinit();
 	ieee80211_debug_exit();
 	rtl8192_debugfs_exit();
+	unregister_netdevice_notifier(&rtl8192_usb_netdev_notifier);
 	RT_TRACE(COMP_DOWN, "Exiting");
 }
 
diff --git a/drivers/staging/rtl8192u/r8192U_debugfs.c b/drivers/staging/rtl8192u/r8192U_debugfs.c
index c64504346657..fe8ef72506ee 100644
--- a/drivers/staging/rtl8192u/r8192U_debugfs.c
+++ b/drivers/staging/rtl8192u/r8192U_debugfs.c
@@ -169,6 +169,14 @@ void rtl8192_debugfs_exit_one(struct net_device *dev)
 	debugfs_remove_recursive(priv->debugfs_dir);
 }
 
+void rtl8192_debugfs_rename_one(struct net_device *dev)
+{
+	struct r8192_priv *priv = ieee80211_priv(dev);
+	struct dentry *parent_dir = debugfs_lookup(KBUILD_MODNAME, NULL);
+
+	debugfs_rename(parent_dir, priv->debugfs_dir, parent_dir, dev->name);
+}
+
 void rtl8192_debugfs_init(void)
 {
 	debugfs_create_dir(KBUILD_MODNAME, NULL);
-- 
2.25.1


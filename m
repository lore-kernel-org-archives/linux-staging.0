Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E571386
	for <linux-staging@lists.linux.dev>; Thu, 24 Feb 2022 06:41:12 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id ev16-20020a17090aead000b001bc3835fea8so1261783pjb.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 22:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2Yu6vn105/cZrtKT/D7SUb7oHxyN3TZXt+q1NqTNrw=;
        b=j5NxbfQvGYwJDYwnalaQOZdLuBJtbHYcL+EBMUujpQonlDIizgTV+6WTrh+3VEDKdP
         m+gjFxZYKHy+6f+mbcJ8b0rULw9JLPGDJMBUmnjUfhSPAz9zzG6F2z/cVx1o3r1EZ713
         Z97V9eJS7LG28GvUVvyuTEcIXN6UVhQTGcF3gMYJYlvLzuTbWpf7cN9dB3COw9AoImJU
         Bz9B6UbfS6C1OVMaUxjz205vOYH23bDUFXA9JLCQLe0B5dtFVoms2ELDlxGA2Xf7oNiv
         ma4M1PInIbOYH+1ZXRumCBLdyEmAi/wbFEl5H9d8SSlrdUlV38xKlc5GSyb0gJzoMxCX
         umMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2Yu6vn105/cZrtKT/D7SUb7oHxyN3TZXt+q1NqTNrw=;
        b=hsg+1HQThbaDkynmnDy57cRzvnvoTXhEAoB1TeZ/qNhKOgQAvL+4VlfJoZ1eQ26OIK
         YlSDucpx791r3WAKGb7roRcR1IzU2lEHDiGsoTgTiwopJIq5yqeEbVQqd1d1HstZKkhi
         xkzeVCeESgxi6SytusDwxp9nL5mn8L9z2nUE22pgGN9DCpATNm4dH1CabYvXXeURG0nq
         ywnSiigAJ8iaAqKMB1EIqJ0YgHmuo0U2m4PHR6RWnFU5y/tqOrKIFLQy3mVcCQNmFbLs
         bRNfB7ZgiwVKbgR2d0I3wA7nEF5MGgeB44omex5UB6ocmYdqFWF09B0pOVuatRtFiEld
         5/cA==
X-Gm-Message-State: AOAM530HRD+nmsxbQHuEdiKvsBG1nKlKm2/ktOyh0u5lQrNjLobzPbPD
	LgiPaWS7fr/k6L3acpfYjrw=
X-Google-Smtp-Source: ABdhPJyA3/t3qPmprv8ezeHIxaEssPdJyy8WAKv4Lo5qfmobI5QaTb/cLJoU7f2K3tf3qjxCfE5nbw==
X-Received: by 2002:a17:90a:4042:b0:1bc:c408:e7b4 with SMTP id k2-20020a17090a404200b001bcc408e7b4mr1326828pjg.169.1645684871868;
        Wed, 23 Feb 2022 22:41:11 -0800 (PST)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:47fe:f358:be6:4577])
        by smtp.googlemail.com with ESMTPSA id j12sm1729109pfu.79.2022.02.23.22.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 22:41:11 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Colin Ian King <colin.i.king@googlemail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Johan Hovold <johan@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@oracle.com
Subject: [PATCH v2 3/3] staging: rtl8192u: rework init and exit function
Date: Wed, 23 Feb 2022 22:40:31 -0800
Message-Id: <20220224064033.1530924-3-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YhPI5iDRUpzYWDyY@kroah.com>
References: <YhPI5iDRUpzYWDyY@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The init and exit functions are not releasing resource properly. An error
can be observed when we load/unload/load r8192u_usb module due to this
issue. This patch rework init and exit functions to do proper resource
release on init error and module unload.
The __exit attribute is stripped from some functions since they are now
being used by module init functions.

[  493.068012] proc_dir_entry 'net/ieee80211' already registered
[  493.271973]  proc_mkdir+0x18/0x20
[  493.272136]  ieee80211_debug_init+0x28/0xde8 [r8192u_usb]
[  493.272404]  rtl8192_usb_module_init+0x10/0x161 [r8192u_usb]

[   13.910616] proc_dir_entry 'net/rtl819xU' already registered
[   13.918931]  proc_mkdir+0x18/0x20
[   13.919098]  rtl8192_usb_module_init+0x142/0x16d [r8192u_usb]

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 .../rtl8192u/ieee80211/ieee80211_crypt.c      |  2 +-
 .../rtl8192u/ieee80211/ieee80211_crypt_ccmp.c |  2 +-
 .../rtl8192u/ieee80211/ieee80211_crypt_tkip.c |  2 +-
 .../rtl8192u/ieee80211/ieee80211_crypt_wep.c  |  2 +-
 .../rtl8192u/ieee80211/ieee80211_module.c     |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c        | 45 ++++++++++++++-----
 6 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt.c
index 01012dddcd73..840db6250b87 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt.c
@@ -214,7 +214,7 @@ int __init ieee80211_crypto_init(void)
 	return ret;
 }
 
-void __exit ieee80211_crypto_deinit(void)
+void ieee80211_crypto_deinit(void)
 {
 	struct list_head *ptr, *n;
 
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
index ccff385cf1f8..101c28265e91 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_ccmp.c
@@ -415,7 +415,7 @@ int __init ieee80211_crypto_ccmp_init(void)
 	return ieee80211_register_crypto_ops(&ieee80211_crypt_ccmp);
 }
 
-void __exit ieee80211_crypto_ccmp_exit(void)
+void ieee80211_crypto_ccmp_exit(void)
 {
 	ieee80211_unregister_crypto_ops(&ieee80211_crypt_ccmp);
 }
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
index e8fa1d385f24..689d8843f538 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_tkip.c
@@ -712,7 +712,7 @@ int __init ieee80211_crypto_tkip_init(void)
 	return ieee80211_register_crypto_ops(&ieee80211_crypt_tkip);
 }
 
-void __exit ieee80211_crypto_tkip_exit(void)
+void ieee80211_crypto_tkip_exit(void)
 {
 	ieee80211_unregister_crypto_ops(&ieee80211_crypt_tkip);
 }
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
index a41b6510481b..8a51ea1dd6e5 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_crypt_wep.c
@@ -240,7 +240,7 @@ int __init ieee80211_crypto_wep_init(void)
 	return ieee80211_register_crypto_ops(&ieee80211_crypt_wep);
 }
 
-void __exit ieee80211_crypto_wep_exit(void)
+void ieee80211_crypto_wep_exit(void)
 {
 	ieee80211_unregister_crypto_ops(&ieee80211_crypt_wep);
 }
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
index c52540b734fd..b94fe9b449b6 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_module.c
@@ -276,7 +276,7 @@ int __init ieee80211_debug_init(void)
 	return 0;
 }
 
-void __exit ieee80211_debug_exit(void)
+void ieee80211_debug_exit(void)
 {
 	if (ieee80211_proc) {
 		remove_proc_entry("debug_level", ieee80211_proc);
diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 364e1ca94f70..ce807c9d4219 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4783,49 +4783,70 @@ static int __init rtl8192_usb_module_init(void)
 {
 	int ret;
 
-#ifdef CONFIG_IEEE80211_DEBUG
+	pr_info("\nLinux kernel driver for RTL8192 based WLAN cards\n");
+	pr_info("Copyright (c) 2007-2008, Realsil Wlan\n");
+	RT_TRACE(COMP_INIT, "Initializing module");
+	RT_TRACE(COMP_INIT, "Wireless extensions version %d", WIRELESS_EXT);
+
 	ret = ieee80211_debug_init();
 	if (ret) {
 		pr_err("ieee80211_debug_init() failed %d\n", ret);
 		return ret;
 	}
-#endif
+
 	ret = ieee80211_crypto_init();
 	if (ret) {
 		pr_err("ieee80211_crypto_init() failed %d\n", ret);
-		return ret;
+		goto debug_exit;
 	}
 
 	ret = ieee80211_crypto_tkip_init();
 	if (ret) {
 		pr_err("ieee80211_crypto_tkip_init() failed %d\n", ret);
-		return ret;
+		goto crypto_exit;
 	}
 
 	ret = ieee80211_crypto_ccmp_init();
 	if (ret) {
 		pr_err("ieee80211_crypto_ccmp_init() failed %d\n", ret);
-		return ret;
+		goto crypto_tkip_exit;
 	}
 
 	ret = ieee80211_crypto_wep_init();
 	if (ret) {
 		pr_err("ieee80211_crypto_wep_init() failed %d\n", ret);
-		return ret;
+		goto crypto_ccmp_exit;
 	}
 
-	pr_info("\nLinux kernel driver for RTL8192 based WLAN cards\n");
-	pr_info("Copyright (c) 2007-2008, Realsil Wlan\n");
-	RT_TRACE(COMP_INIT, "Initializing module");
-	RT_TRACE(COMP_INIT, "Wireless extensions version %d", WIRELESS_EXT);
 	rtl8192_proc_module_init();
-	return usb_register(&rtl8192_usb_driver);
+	ret = usb_register(&rtl8192_usb_driver);
+	if (ret)
+		goto rtl8192_proc_module_exit;
+	return ret;
+
+rtl8192_proc_module_exit:
+	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
+	ieee80211_crypto_wep_exit();
+crypto_ccmp_exit:
+	ieee80211_crypto_ccmp_exit();
+crypto_tkip_exit:
+	ieee80211_crypto_tkip_exit();
+crypto_exit:
+	ieee80211_crypto_deinit();
+debug_exit:
+	ieee80211_debug_exit();
+	return ret;
 }
 
 static void __exit rtl8192_usb_module_exit(void)
 {
 	usb_deregister(&rtl8192_usb_driver);
-
+	remove_proc_entry(RTL819XU_MODULE_NAME, init_net.proc_net);
+	ieee80211_crypto_wep_exit();
+	ieee80211_crypto_ccmp_exit();
+	ieee80211_crypto_tkip_exit();
+	ieee80211_crypto_deinit();
+	ieee80211_debug_exit();
 	RT_TRACE(COMP_DOWN, "Exiting");
 }
 
-- 
2.25.1


Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272B72
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 13:27:29 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id h9so11582700ejs.4
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1XyyEYLOje8+rMvka9FNoicpg3HUjRni4R1G0+vh+4=;
        b=RaXKoLf97je3BYHTr6WL752pU+3dr3DId3m89eB0vFkbYb5ywkUZcBzm1c5QoZCUwb
         NhVFS659FYLCpZR9hS3iLmPVLZyzGyRvByjt6aQr/hpd4mIrUAxaHYEd7KBgU15qrMU4
         l+zUyAwEouR9DIeNxRSsEFMNl4R4nVOC2yeYSjKOchRYfjK6ornu+JLGEw3zqCwBaB/+
         wWkVpOG40kDAJplv8FP5SQlMHTsqBLAFAMnVQ+orFBuiyfXtnpR51nyEoA2ZK0bE7ua2
         NFN5xOIHjuvQbCEqsvszc06+ry7ES+Y3fWYua+M3tugqiTui95y/1kOWLvFsRdPI1TzJ
         muDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a1XyyEYLOje8+rMvka9FNoicpg3HUjRni4R1G0+vh+4=;
        b=NpqnHyiHnH/8eMDiEeqbgz5ANMq9Nc30lPUVmIiQcujpS/FpqBJXyQG/i+xKkRmpcg
         Qu+f6uLBauu58PY3isMPn7R2p+oU1PJKyUAebaTV/t/lVkfx2x5y0gImElMYJ5qZD9OY
         9fQ3NTbLJTYHyCGObVM4jz6RpYenj78c90NPNV1Wn9xX7eGOTbukQ4F4foBBcLjyoA2k
         kKkG4MNsY1tLi1xXTLSeGSDDGo0pE0Xt+sTKvLhMSWFYXOPVxtcfQNvSfbXjGFw9AMM0
         oehDMuRlfXatot/afz0mC1lC4X4FGBryqQJ9SyzdP+i8YyRLiG/csffa9v/T+wb+Fjst
         3Y+Q==
X-Gm-Message-State: AOAM5338/LacWrtBtY2FjT7U7r9ah3WjSTU/BBBGhEZS1X52WoZxi+8z
	tTXYjT+nEufe5mpdIr8E/RZ1htaGnJA=
X-Google-Smtp-Source: ABdhPJyULvIDilpcBpjZfeXM47eXHz0AftsFblB4I9GyYW8U8jQL7puMffzOwBSX4pyuVdzEPnvfLQ==
X-Received: by 2002:a17:907:35d0:: with SMTP id ap16mr3667669ejc.456.1628774847517;
        Thu, 12 Aug 2021 06:27:27 -0700 (PDT)
Received: from agape ([5.171.80.192])
        by smtp.gmail.com with ESMTPSA id p5sm809860ejl.73.2021.08.12.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 06:27:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove cfg80211 residuals
Date: Thu, 12 Aug 2021 15:27:25 +0200
Message-Id: <20210812132725.18404-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove cfg80211 implementation residuals:
an headeer file and build condition in Kconfig
file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
Dear Greg and Larry,
I thought that cfg80211 had been implemented.
Should we add a TODO file telling developers to
do it in the near future? Is that a condition
for mainlining r8188eu? If so please drop this
patch and sorry for noise.

 drivers/staging/r8188eu/Kconfig               |  2 +-
 .../staging/r8188eu/include/ioctl_cfg80211.h  | 91 -------------------
 drivers/staging/r8188eu/os_dep/rtw_android.c  |  1 -
 3 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/ioctl_cfg80211.h

diff --git a/drivers/staging/r8188eu/Kconfig b/drivers/staging/r8188eu/Kconfig
index dc1719d3f2e4..beb768416ab9 100644
--- a/drivers/staging/r8188eu/Kconfig
+++ b/drivers/staging/r8188eu/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config R8188EU
 	tristate "Realtek RTL8188EU Wireless LAN NIC driver"
-	depends on WLAN && USB && CFG80211
+	depends on WLAN && USB
 	depends on m
 	select WIRELESS_EXT
 	select WEXT_PRIV
diff --git a/drivers/staging/r8188eu/include/ioctl_cfg80211.h b/drivers/staging/r8188eu/include/ioctl_cfg80211.h
deleted file mode 100644
index e22481050ef8..000000000000
--- a/drivers/staging/r8188eu/include/ioctl_cfg80211.h
+++ /dev/null
@@ -1,91 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. i*/
-
-#ifndef __IOCTL_CFG80211_H__
-#define __IOCTL_CFG80211_H__
-
-struct rtw_wdev_invit_info {
-	u8 token;
-	u8 flags;
-	u8 status;
-	u8 req_op_ch;
-	u8 rsp_op_ch;
-};
-
-#define rtw_wdev_invit_info_init(invit_info) \
-	do { \
-		(invit_info)->token = 0; \
-		(invit_info)->flags = 0x00; \
-		(invit_info)->status = 0xff; \
-		(invit_info)->req_op_ch = 0; \
-		(invit_info)->rsp_op_ch = 0; \
-	} while (0)
-
-struct rtw_wdev_priv {
-	struct wireless_dev *rtw_wdev;
-
-	struct adapter *padapter;
-
-	struct cfg80211_scan_request *scan_request;
-	spinlock_t scan_req_lock;
-
-	struct net_device *pmon_ndev;/* for monitor interface */
-	char ifname_mon[IFNAMSIZ + 1]; /* name of monitor interface */
-
-	u8 p2p_enabled;
-
-	u8 provdisc_req_issued;
-
-	struct rtw_wdev_invit_info invit_info;
-
-	u8 bandroid_scan;
-	bool block;
-	bool power_mgmt;
-};
-
-#define wdev_to_priv(w) ((struct rtw_wdev_priv *)(wdev_priv(w)))
-
-#define wiphy_to_wdev(x)				\
-((struct wireless_dev *)(((struct rtw_wdev_priv *)wiphy_priv(x))->rtw_wdev))
-
-int rtw_wdev_alloc(struct adapter *padapter, struct device *dev);
-void rtw_wdev_free(struct wireless_dev *wdev);
-void rtw_wdev_unregister(struct wireless_dev *wdev);
-
-void rtw_cfg80211_init_wiphy(struct adapter *padapter);
-
-void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter);
-
-void rtw_cfg80211_indicate_connect(struct adapter *padapter);
-void rtw_cfg80211_indicate_disconnect(struct adapter *padapter);
-void rtw_cfg80211_indicate_scan_done(struct rtw_wdev_priv *pwdev_priv,
-				     bool aborted);
-
-#ifdef CONFIG_88EU_AP_MODE
-void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter,
-				     u8 *pmgmt_frame, uint frame_len);
-void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter,
-					unsigned char *da,
-					unsigned short reason);
-#endif /* CONFIG_88EU_AP_MODE */
-
-void rtw_cfg80211_issue_p2p_provision_request(struct adapter *padapter,
-					      const u8 *buf, size_t len);
-void rtw_cfg80211_rx_p2p_action_public(struct adapter *padapter,
-				       u8 *pmgmt_frame, uint frame_len);
-void rtw_cfg80211_rx_action_p2p(struct adapter *padapter, u8 *pmgmt_frame,
-				uint frame_len);
-void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame,
-			    uint frame_len, const char *msg);
-
-int rtw_cfg80211_set_mgnt_wpsp2pie(struct net_device *net,
-				   char *buf, int len, int type);
-
-bool rtw_cfg80211_pwr_mgmt(struct adapter *adapter);
-
-#define rtw_cfg80211_rx_mgmt(dev, freq, sig_dbm, buf, len, gfp)		\
-	cfg80211_rx_mgmt(dev, freq, sig_dbm, buf, len, gfp)
-#define rtw_cfg80211_send_rx_assoc(dev, bss, buf, len)			\
-	cfg80211_send_rx_assoc(dev, bss, buf, len)
-
-#endif /* __IOCTL_CFG80211_H__ */
diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
index d666feb87a7a..7c5e5c8007e3 100644
--- a/drivers/staging/r8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
@@ -7,7 +7,6 @@
 #include "../include/rtw_android.h"
 #include "../include/osdep_service.h"
 #include "../include/rtw_debug.h"
-#include "../include/ioctl_cfg80211.h"
 #include "../include/rtw_ioctl_set.h"
 
 static const char *android_wifi_cmd_str[ANDROID_WIFI_CMD_MAX] = {
-- 
2.20.1


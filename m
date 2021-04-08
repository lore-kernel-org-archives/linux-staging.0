Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750706D00
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 19:56:58 +0000 (UTC)
Received: from ipservice-092-217-074-086.092.217.pools.vodafone-ip.de ([92.217.74.86] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUals-0005PV-Ja; Thu, 08 Apr 2021 21:56:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/12] staging: rtl8188eu: move static array from .h to .c
Date: Thu,  8 Apr 2021 21:55:56 +0200
Message-Id: <20210408195601.4762-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408195601.4762-1-martin@kaiser.cx>
References: <20210408195601.4762-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declaring a static array in a header file is likely to cause name conflicts
if the declaration is pulled in multiple times.

The rtl8188 driver protects the declaration of the wlancmds array in
rtw_mlme_ext.h with ifdef _RTW_CMD_C_, which is defined only in rtw_cmd.c.
It makes more sense to declare the array in the .c file.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_cmd.c      | 18 +++++++++++++++
 .../staging/rtl8188eu/include/rtw_mlme_ext.h  | 22 -------------------
 2 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index 1724dfd7edbc..bf1e49404e64 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -12,6 +12,24 @@
 #include <mlme_osdep.h>
 #include <rtw_mlme_ext.h>
 
+static struct cmd_hdl wlancmds[] = {
+	{sizeof(struct wlan_bssid_ex), join_cmd_hdl},
+	{sizeof(struct disconnect_parm), disconnect_hdl},
+	{sizeof(struct wlan_bssid_ex), createbss_hdl},
+	{sizeof(struct setopmode_parm), setopmode_hdl},
+	{sizeof(struct sitesurvey_parm), sitesurvey_cmd_hdl},
+	{sizeof(struct setauth_parm), setauth_hdl},
+	{sizeof(struct setkey_parm), setkey_hdl},
+	{sizeof(struct set_stakey_parm), set_stakey_hdl},
+	{sizeof(struct set_assocsta_parm), NULL},
+	{sizeof(struct addBaReq_parm), add_ba_hdl},
+	{sizeof(struct set_ch_parm), set_ch_hdl},
+	{sizeof(struct wlan_bssid_ex), tx_beacon_hdl},
+	{0, mlme_evt_hdl},
+	{0, rtw_drvextra_cmd_hdl},
+	{sizeof(struct SetChannelPlan_param), set_chplan_hdl}
+};
+
 /*
  * Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
  * No irqsave is necessary.
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
index b11a6886a083..77eb5e3ef172 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme_ext.h
@@ -606,28 +606,6 @@ u8 led_blink_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf);
 u8 tdls_hdl(struct adapter *padapter, unsigned char *pbuf);
 
-#ifdef _RTW_CMD_C_
-
-static struct cmd_hdl wlancmds[] = {
-	{sizeof(struct wlan_bssid_ex), join_cmd_hdl},
-	{sizeof(struct disconnect_parm), disconnect_hdl},
-	{sizeof(struct wlan_bssid_ex), createbss_hdl},
-	{sizeof(struct setopmode_parm), setopmode_hdl},
-	{sizeof(struct sitesurvey_parm), sitesurvey_cmd_hdl},
-	{sizeof(struct setauth_parm), setauth_hdl},
-	{sizeof(struct setkey_parm), setkey_hdl},
-	{sizeof(struct set_stakey_parm), set_stakey_hdl},
-	{sizeof(struct set_assocsta_parm), NULL},
-	{sizeof(struct addBaReq_parm), add_ba_hdl},
-	{sizeof(struct set_ch_parm), set_ch_hdl},
-	{sizeof(struct wlan_bssid_ex), tx_beacon_hdl},
-	{0, mlme_evt_hdl},
-	{0, rtw_drvextra_cmd_hdl},
-	{sizeof(struct SetChannelPlan_param), set_chplan_hdl}
-};
-
-#endif
-
 struct C2HEvent_Header {
 #ifdef __LITTLE_ENDIAN
 	unsigned int len:16;
-- 
2.20.1


Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13F6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:13 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v4so24301937wrp.13
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XbXL6VOKqBjGrxkcT72CH8huvu30zIIknmxoLH73PbU=;
        b=L0dVElC2aDwqkiSO7mgDOXGD8EL5WpMDGbM35NhSDRY06g4AIr0gIcWQlb0TmNACZa
         f6m+iqAys4Tf0ZPSR2J4/9VQGsoCllcsVg4HWbZpEesbIdEcykEAyemUL4fLljv+KLMq
         UVFg7A1FMxqk+6r4niHqRnO9DhSHtCLBi9degw24u6hYiOlD5rxHu9yi6ZDndo9b95MZ
         QasBPSkbbvJRaff/gOnsTHy+nvvqBOfaQuUBSTP16z6CycTjSfaJrDQmS0EbUIlG0fVC
         q+ALZtkX3riEre/PvqLVwnnP0MON9WW8v0JtCcz8YmAzvKlWhJYzgbZTI1HlCG0uy5qT
         EMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbXL6VOKqBjGrxkcT72CH8huvu30zIIknmxoLH73PbU=;
        b=QeD65hxfbwJciqLDugLoY9gg8mqldTxpGqQOftfU+YgLybjFzCTVnC450zI96N4XEG
         LFIZPLu9OGG84Dm2mb8tGqNuRp0qk+6nD5mpKtEbE+BaPE0rwkabrslZVV3KYjD/TluW
         vAy4GQgIi1vjwyZ2715rNJm/TPz+5G5kMme1ZywPPtJOrqTN53f0jQaS/WQtA2N9NKiC
         fz83WZErqgCeb9CyUXvURqAWzs0ZzLXUqtNDhMqkfePxK7gIEVNS5HY8vAq1+XWLO/64
         MKq9jMaXHIsgvKa4WxvWCy46zS+No2zw4Fp+D0m0vZRKwdDC+6owihpqMkN0q4BLN3J0
         QM7g==
X-Gm-Message-State: AOAM532gw8l4g2nQbDsyQlyozKjSJwItdIeZutmBBMioplRaGDHGRS/X
	WtAYbhGVVNGajPH8zzBrMBeAxQ2/LIE=
X-Google-Smtp-Source: ABdhPJytxY6RNd6HU4U6fCCBkgJkvUfBLl1i0dP977c9SotPGWqhPBcQlUdcxU2L4t04RaBkryERwA==
X-Received: by 2002:adf:8b4e:: with SMTP id v14mr3255306wra.103.1616589911913;
        Wed, 24 Mar 2021 05:45:11 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:11 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 27/33] Staging: rtl8723bs: remove named enums in HalBtcOutSrc.h
Date: Wed, 24 Mar 2021 13:44:50 +0100
Message-Id: <20210324124456.25221-28-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
hal/HalBtcOutSrc.h:

	enum btc_powersave_type			[name]
	enum btc_bt_reg_type			[name]
	enum btc_chip_type			[name]
	enum btc_msg_type			[name]
	enum btc_dbg_opcode			[definition]
	enum btc_rssi_state			[name]
	enum btc_wifi_role			[definition]
	enum btc_wifi_bw_mode			[name]
	enum btc_wifi_traffic_dir		[name]
	enum btc_wifi_pnp			[name]
	enum bt_wifi_coex_state			[definition]
	enum btc_get_type			[name]
	enum btc_set_type			[name]
	enum btc_dbg_disp_type			[name]
	enum btc_notify_type_ips		[name]
	enum btc_notify_type_lps		[name]
	enum btc_notify_type_scan		[name]
	enum btc_notify_type_associate		[name]
	enum btc_notify_type_media_status	[name]
	enum btc_notify_type_special_packet	[name]
	enum btc_notify_type_stack_operation	[definition]
	enum btc_antenna_pos			[name]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 70 +++++---------------
 1 file changed, 18 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 10c021024b24..75e1d1a37626 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -44,14 +44,14 @@
 #define BTC_ANT_WIFI_AT_CPL_MAIN	0
 #define BTC_ANT_WIFI_AT_CPL_AUX		1
 
-enum btc_powersave_type {
+enum {
 	BTC_PS_WIFI_NATIVE	= 0,	/*  wifi original power save behavior */
 	BTC_PS_LPS_ON		= 1,
 	BTC_PS_LPS_OFF		= 2,
 	BTC_PS_MAX
 };
 
-enum btc_bt_reg_type {
+enum {
 	BTC_BT_REG_RF		= 0,
 	BTC_BT_REG_MODEM	= 1,
 	BTC_BT_REG_BLUEWIZE	= 2,
@@ -68,7 +68,7 @@ enum btc_chip_interface {
 	BTC_INTF_MAX
 };
 
-enum btc_chip_type {
+enum {
 	BTC_CHIP_UNDEF		= 0,
 	BTC_CHIP_CSR_BC4	= 1,
 	BTC_CHIP_CSR_BC8	= 2,
@@ -78,7 +78,7 @@ enum btc_chip_type {
 	BTC_CHIP_MAX
 };
 
-enum btc_msg_type {
+enum {
 	BTC_MSG_INTERFACE	= 0x0,
 	BTC_MSG_ALGORITHM	= 0x1,
 	BTC_MSG_MAX
@@ -166,17 +166,7 @@ struct btc_board_info {
 	/* bool				bBtExist; */
 };
 
-enum btc_dbg_opcode {
-	BTC_DBG_SET_COEX_NORMAL			    = 0x0,
-	BTC_DBG_SET_COEX_WIFI_ONLY		    = 0x1,
-	BTC_DBG_SET_COEX_BT_ONLY		    = 0x2,
-	BTC_DBG_SET_COEX_DEC_BT_PWR		    = 0x3,
-	BTC_DBG_SET_COEX_BT_AFH_MAP		    = 0x4,
-	BTC_DBG_SET_COEX_BT_IGNORE_WLAN_ACT	= 0x5,
-	BTC_DBG_MAX
-};
-
-enum btc_rssi_state {
+enum {
 	BTC_RSSI_STATE_HIGH			    = 0x0,
 	BTC_RSSI_STATE_MEDIUM			= 0x1,
 	BTC_RSSI_STATE_LOW			    = 0x2,
@@ -189,46 +179,29 @@ enum btc_rssi_state {
 #define BTC_RSSI_MEDIUM(_rssi_)	((_rssi_ == BTC_RSSI_STATE_MEDIUM || _rssi_ == BTC_RSSI_STATE_STAY_MEDIUM) ? true : false)
 #define BTC_RSSI_LOW(_rssi_)	((_rssi_ == BTC_RSSI_STATE_LOW || _rssi_ == BTC_RSSI_STATE_STAY_LOW) ? true : false)
 
-enum btc_wifi_role {
-	BTC_ROLE_STATION			= 0x0,
-	BTC_ROLE_AP					= 0x1,
-	BTC_ROLE_IBSS				= 0x2,
-	BTC_ROLE_HS_MODE			= 0x3,
-	BTC_ROLE_MAX
-};
-
-enum btc_wifi_bw_mode {
+enum {
 	BTC_WIFI_BW_LEGACY			= 0x0,
 	BTC_WIFI_BW_HT20			= 0x1,
 	BTC_WIFI_BW_HT40			= 0x2,
 	BTC_WIFI_BW_MAX
 };
 
-enum btc_wifi_traffic_dir {
+enum {
 	BTC_WIFI_TRAFFIC_TX			= 0x0,
 	BTC_WIFI_TRAFFIC_RX			= 0x1,
 	BTC_WIFI_TRAFFIC_MAX
 };
 
-enum btc_wifi_pnp {
+enum {
 	BTC_WIFI_PNP_WAKE_UP		= 0x0,
 	BTC_WIFI_PNP_SLEEP			= 0x1,
 	BTC_WIFI_PNP_MAX
 };
 
 /* for 8723b-d cut large current issue */
-enum bt_wifi_coex_state {
-	BTC_WIFI_STAT_INIT,
-	BTC_WIFI_STAT_IQK,
-	BTC_WIFI_STAT_NORMAL_OFF,
-	BTC_WIFI_STAT_MP_OFF,
-	BTC_WIFI_STAT_NORMAL,
-	BTC_WIFI_STAT_ANT_DIV,
-	BTC_WIFI_STAT_MAX
-};
 
 /*  defined for BFP_BTC_GET */
-enum btc_get_type {
+enum {
 	/*  type bool */
 	BTC_GET_BL_HS_OPERATION,
 	BTC_GET_BL_HS_CONNECTING,
@@ -270,7 +243,7 @@ enum btc_get_type {
 };
 
 /*  defined for BFP_BTC_SET */
-enum btc_set_type {
+enum {
 	/*  type bool */
 	BTC_SET_BL_BT_DISABLE,
 	BTC_SET_BL_BT_TRAFFIC_BUSY,
@@ -310,44 +283,44 @@ enum btc_set_type {
 	BTC_SET_MAX
 };
 
-enum btc_dbg_disp_type {
+enum {
 	BTC_DBG_DISP_COEX_STATISTICS		= 0x0,
 	BTC_DBG_DISP_BT_LINK_INFO			= 0x1,
 	BTC_DBG_DISP_FW_PWR_MODE_CMD		= 0x2,
 	BTC_DBG_DISP_MAX
 };
 
-enum btc_notify_type_ips {
+enum {
 	BTC_IPS_LEAVE						= 0x0,
 	BTC_IPS_ENTER						= 0x1,
 	BTC_IPS_MAX
 };
 
-enum btc_notify_type_lps {
+enum {
 	BTC_LPS_DISABLE						= 0x0,
 	BTC_LPS_ENABLE						= 0x1,
 	BTC_LPS_MAX
 };
 
-enum btc_notify_type_scan {
+enum {
 	BTC_SCAN_FINISH						= 0x0,
 	BTC_SCAN_START						= 0x1,
 	BTC_SCAN_MAX
 };
 
-enum btc_notify_type_associate {
+enum {
 	BTC_ASSOCIATE_FINISH				= 0x0,
 	BTC_ASSOCIATE_START					= 0x1,
 	BTC_ASSOCIATE_MAX
 };
 
-enum btc_notify_type_media_status {
+enum {
 	BTC_MEDIA_DISCONNECT				= 0x0,
 	BTC_MEDIA_CONNECT					= 0x1,
 	BTC_MEDIA_MAX
 };
 
-enum btc_notify_type_special_packet {
+enum {
 	BTC_PACKET_UNKNOWN					= 0x0,
 	BTC_PACKET_DHCP						= 0x1,
 	BTC_PACKET_ARP						= 0x2,
@@ -355,15 +328,8 @@ enum btc_notify_type_special_packet {
 	BTC_PACKET_MAX
 };
 
-enum btc_notify_type_stack_operation {
-	BTC_STACK_OP_NONE					= 0x0,
-	BTC_STACK_OP_INQ_PAGE_PAIR_START	= 0x1,
-	BTC_STACK_OP_INQ_PAGE_PAIR_FINISH	= 0x2,
-	BTC_STACK_OP_MAX
-};
-
 /* Bryant Add */
-enum btc_antenna_pos {
+enum {
 	BTC_ANTENNA_AT_MAIN_PORT = 0x1,
 	BTC_ANTENNA_AT_AUX_PORT  = 0x2,
 };
-- 
2.30.2


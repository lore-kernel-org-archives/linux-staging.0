Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6190F6E
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so3203228wma.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nCexu6RSTgYJFKMsRn94HRIip9Lby2um8F8S5vmMNKk=;
        b=aqEX72yBCPUt+IPyFb3RnQxpyOoCRX99Zwi2BCzFFs8qtUI50DbGlNlFtbM0XVCRFd
         7fXqeVMF+tLMBG5+5i3BXouTVInAqhsIL7KVn7rLHAylEKWWofwYQa0vREZVcdY2NLSm
         auPs82v1J7DcRtgMLMOPOYa1Vb6TmOcdqcIbW4z349HD25ToAvc1wBFm4D2+rQL8Wa7Z
         1Ci+M0ja6usGKY7sxECxsfl1DesV7rdj9FoHi1NA9ICp9pE2G4SgukWSrSIcYILzmbzP
         hm4tmbWzCIB36HoEMXK2P1xNWiGBY+Jl7MBbmsXbaT2Cy8u/JVMtyJ3/Ma25ZnHTuwbQ
         Kgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nCexu6RSTgYJFKMsRn94HRIip9Lby2um8F8S5vmMNKk=;
        b=PTMefotqzQyIkl+NUMqY2duHrj36k+glUZB4+Ku+x07q29M7WDMeTIKEfw3H+1mBAO
         J7wjEZhvbrAxqD987usZZtrZdW9LsigDf4w4lEiiaSE8pd5/YsHpa4kSav4AE/NFaQWn
         D2z4U6kXfZxWLI+KbGvbcRKJFcOM6rC8qVDN9+I4H9fudLTtmWCl/5/aBA2ChzdRC4hd
         C2akrwFF1s+u6JtIiQpdybPUnZ4FZ9tykOsP3ioQOpYcb8IHaKlRM3k5seT3GQgbP+uq
         ypt42lmxvCPa4pb7few3Ox+hmWqQwNtuPcJgnsutyxy8ZISdJdnIfSGQVJAER+lg7WeK
         w7CQ==
X-Gm-Message-State: AOAM532iPg+cgOxDJjhii3QhckP0cFrcGB7hcnBtTNxKAD5D0NJShQoZ
	icNl3Iv0qS4YSwskZlb/quM=
X-Google-Smtp-Source: ABdhPJx3k+mqeER5dv57OkTXfjnaNFWwRC4IWBRBhtqFR4d9rwC9nZXVyL69o56LLyATFXQOnjI04Q==
X-Received: by 2002:a1c:3d46:: with SMTP id k67mr4220933wma.188.1616611132859;
        Wed, 24 Mar 2021 11:38:52 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:52 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 17/21] Staging: rtl8723bs: remove enums in HalBtcOutSrc.h
Date: Wed, 24 Mar 2021 19:38:43 +0100
Message-Id: <20210324183847.5595-18-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
hal/HalBtcOutSrc.h:

	enum btc_dbg_opcode
	enum btc_wifi_role
	enum bt_wifi_coex_state
	enum btc_notify_type_stack_operation

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 34 --------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 10c021024b24..08172cc38f09 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -166,16 +166,6 @@ struct btc_board_info {
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
 enum btc_rssi_state {
 	BTC_RSSI_STATE_HIGH			    = 0x0,
 	BTC_RSSI_STATE_MEDIUM			= 0x1,
@@ -189,14 +179,6 @@ enum btc_rssi_state {
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
 enum btc_wifi_bw_mode {
 	BTC_WIFI_BW_LEGACY			= 0x0,
 	BTC_WIFI_BW_HT20			= 0x1,
@@ -217,15 +199,6 @@ enum btc_wifi_pnp {
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
 enum btc_get_type {
@@ -355,13 +328,6 @@ enum btc_notify_type_special_packet {
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
 enum btc_antenna_pos {
 	BTC_ANTENNA_AT_MAIN_PORT = 0x1,
-- 
2.30.2


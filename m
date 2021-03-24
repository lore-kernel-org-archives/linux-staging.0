Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD90259E
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 14so2250549wrz.12
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqRVzX0VVNeH+Vs3ffJyP+mwljmnW1fuwE79D/YiJLM=;
        b=CKWoe9RdgiWMdBlndu28BnljRWX6fzRz0KAmtzmfAEXJzc0yPnt4R/Rd8Vzg6Ujnyj
         YrdX/maXLP6hzzYK092wF2xUr1jQLHEMZ2oDYuQMoXIGp89UH2peFOosulDVPO3qa4gM
         qy9NQKjiKPuPX4jp3vObqCfyXQVi7j25cFV4AWAiQYe8Zr+PB8WjS2LWsEVe3ButRKcM
         J+dvD5F8CZPxR8rAmjFFaNt4CA88FQ6FQqO9TrH3tEflzTFYHC2llFx8Z29+28MMWuBW
         m/MNoAAy19HrIicsD3CrRG/tnaj12Zbq4bLqMmS7tPuOCqosyjAgWnHRc9psirQp7Wd8
         MI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqRVzX0VVNeH+Vs3ffJyP+mwljmnW1fuwE79D/YiJLM=;
        b=lCkY7qQcEFUn686ShfWlGIbTnvIfAIaVX7cvjS1PJ2jBqn/LVsWQXx56r7ikA4X/f7
         7z4kdQiRaryguztyFhvHip5jLthhztl/6c2XyKmXsXjeuw5vCfbUC9cJZmefpDIJ+q0u
         vwx2vPBW7NaEvYFsv3fm0d0gU3ckHmVO73LpCRMqT0BN1MrQns5oyic+rPWGcDJ/o2Ka
         zybNinObOmQKLfQ3GrYJnoBfh19KN+bQepyNX4Gmp3sI27hh4Vw+v0M3WUxpyw51bnYN
         45KNPu6RbBcZk26Tw+88n8ZIMhTz+LdfJ3Pbqp/4s0oiE9+ZvVaPknK3KdMujaa1uvYl
         en/A==
X-Gm-Message-State: AOAM531wdpGl2faZThZ2ewW558vKC25wiqaQUhfmWphV7EHOf9OcsPnb
	sit2c1oFQfDdAelDv+KezWI=
X-Google-Smtp-Source: ABdhPJxMU+fJQIocHcAXWIXbllOCcdlkc4apH4uS1zORh+81YGLMykrVfUWfydRa6dXJqqThQqYrMw==
X-Received: by 2002:adf:b642:: with SMTP id i2mr4821314wre.8.1616611125314;
        Wed, 24 Mar 2021 11:38:45 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:45 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/21] Staging: rtl8723bs: remove enums in hal_com_h2c.h
Date: Wed, 24 Mar 2021 19:38:34 +0100
Message-Id: <20210324183847.5595-9-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/hal_com_h2c.h:

	enum h2c_cmd

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 .../staging/rtl8723bs/include/hal_com_h2c.h   | 60 -------------------
 1 file changed, 60 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com_h2c.h b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
index 65e9548c7b68..c7c2ff6c83b1 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_h2c.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
@@ -11,66 +11,6 @@
 /*     H2C CMD DEFINITION    ------------------------------------------------ */
 /*  */
 /*  88e, 8723b, 8812, 8821, 92e use the same FW code base */
-enum h2c_cmd {
-	/* Common Class: 000 */
-	H2C_RSVD_PAGE = 0x00,
-	H2C_MEDIA_STATUS_RPT = 0x01,
-	H2C_SCAN_ENABLE = 0x02,
-	H2C_KEEP_ALIVE = 0x03,
-	H2C_DISCON_DECISION = 0x04,
-	H2C_PSD_OFFLOAD = 0x05,
-	H2C_AP_OFFLOAD = 0x08,
-	H2C_BCN_RSVDPAGE = 0x09,
-	H2C_PROBERSP_RSVDPAGE = 0x0A,
-	H2C_FCS_RSVDPAGE = 0x10,
-	H2C_FCS_INFO = 0x11,
-	H2C_AP_WOW_GPIO_CTRL = 0x13,
-
-	/* PoweSave Class: 001 */
-	H2C_SET_PWR_MODE = 0x20,
-	H2C_PS_TUNING_PARA = 0x21,
-	H2C_PS_TUNING_PARA2 = 0x22,
-	H2C_P2P_LPS_PARAM = 0x23,
-	H2C_P2P_PS_OFFLOAD = 0x24,
-	H2C_PS_SCAN_ENABLE = 0x25,
-	H2C_SAP_PS_ = 0x26,
-	H2C_INACTIVE_PS_ = 0x27, /* Inactive_PS */
-	H2C_FWLPS_IN_IPS_ = 0x28,
-
-	/* Dynamic Mechanism Class: 010 */
-	H2C_MACID_CFG = 0x40,
-	H2C_TXBF = 0x41,
-	H2C_RSSI_SETTING = 0x42,
-	H2C_AP_REQ_TXRPT = 0x43,
-	H2C_INIT_RATE_COLLECT = 0x44,
-
-	/* BT Class: 011 */
-	H2C_B_TYPE_TDMA = 0x60,
-	H2C_BT_INFO = 0x61,
-	H2C_FORCE_BT_TXPWR = 0x62,
-	H2C_BT_IGNORE_WLANACT = 0x63,
-	H2C_DAC_SWING_VALUE = 0x64,
-	H2C_ANT_SEL_RSV = 0x65,
-	H2C_WL_OPMODE = 0x66,
-	H2C_BT_MP_OPER = 0x67,
-	H2C_BT_CONTROL = 0x68,
-	H2C_BT_WIFI_CTRL = 0x69,
-	H2C_BT_FW_PATCH = 0x6A,
-
-	/* WOWLAN Class: 100 */
-	H2C_WOWLAN = 0x80,
-	H2C_REMOTE_WAKE_CTRL = 0x81,
-	H2C_AOAC_GLOBAL_INFO = 0x82,
-	H2C_AOAC_RSVD_PAGE = 0x83,
-	H2C_AOAC_RSVD_PAGE2 = 0x84,
-	H2C_D0_SCAN_OFFLOAD_CTRL = 0x85,
-	H2C_D0_SCAN_OFFLOAD_INFO = 0x86,
-	H2C_CHNL_SWITCH_OFFLOAD = 0x87,
-	H2C_AOAC_RSVDPAGE3 = 0x88,
-
-	H2C_RESET_TSF = 0xC0,
-	H2C_MAXID,
-};
 
 #define H2C_RSVDPAGE_LOC_LEN		5
 #define H2C_MEDIA_STATUS_RPT_LEN		3
-- 
2.30.2


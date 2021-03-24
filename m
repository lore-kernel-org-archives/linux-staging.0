Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807570
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1117051wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqRVzX0VVNeH+Vs3ffJyP+mwljmnW1fuwE79D/YiJLM=;
        b=mqiEn4DjcxzrHelZAvmQP5XmEY6NOIvVGqX3lYGcTHeF3/BUWNlfxP0isiZ6n25hSj
         ZJVWvhPwQBiujuxSJ3rmVOsmQyEImOeWLlgK8JuQID6OLWp9kKKFeHKEJCyJcpQSzHBt
         N6FPMdspb8jeA1Y6aVofRSBKZBUwL8xhl4ppg8KxPrLCRB63ozl+/Q7nhv/uor5PZqOW
         uiZhFEmzwltnOo6jWz7MAjM+K7KOL/c8NBAxuXCJMr646sUxAAlU6HE3sYQMXsVV7XdI
         DQL5r8mjk7nJvw7aRywsVZLhL4faxviTZ6Z9wiF7I3YPzA/QffruEXCvHEkEP8D9nspl
         OmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqRVzX0VVNeH+Vs3ffJyP+mwljmnW1fuwE79D/YiJLM=;
        b=STQoFFrqKukn7cW2w3LaCPWB9P2zE8m1Exk6YsNOeBInVT3KOLXXAaqxokuemEm/MD
         3/lyqrGREzYmK2IG0QDs+SUHoMVvbNBsbN7jAqfJ0sbt3OUBhnxyb2Z03doOYEjefQSa
         M36uw+79iH5A0uJdqOw8BmscsMad4Twx6a3sAROHTo7hcPQd0ONPP/0Hziwm0N8Mliq/
         QNXe0gyDu55ehV0Uf+NRmZ2f6OoBJxqcRKDuuRA0AnEeXAKSfggF9vmdC7xe69DP572q
         CIPmWXXMUQXu/nz5G0W8Qhl8uIJuswSjISQpM2lEtY7ZwtsP2TY+GeAO371YEOfvrHRW
         vNVQ==
X-Gm-Message-State: AOAM533VzHPBvaW29AEZeMxJoHbefskqEfIx68wAArT/K7FEev5zWeBr
	fDGkxpzJiiWe0rytovNA49g=
X-Google-Smtp-Source: ABdhPJy4ojJByGhddVOkuSVqBclnDlUvI6LvzkbVAFEfkCEDHSZv/QVP1fl1du4r1gmlpIOSW1zFcw==
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr2814964wmq.133.1616589900233;
        Wed, 24 Mar 2021 05:45:00 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:00 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/33] Staging: rtl8723bs: remove named enums in hal_com_h2c.h
Date: Wed, 24 Mar 2021 13:44:37 +0100
Message-Id: <20210324124456.25221-15-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
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


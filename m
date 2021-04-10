Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D636D0D
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:54 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a7so13072780eju.1
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PMoQZyndPwufvmDjpeBnGU4sgUe/qCXCw/wqqLdfTzs=;
        b=PRmiCJHVqIqpEh3pzHzwHcCj5YNpw8rtpr87dOgn0pHCmC5H9T8xItXmaVkUTrChkI
         QVXBQJvT1KCeiKPAHx+75wT+hY2b77RDJJAlns58Ny4383CvcsxBKVvWYgpBKt2WFo/s
         /fVOBLx6HDJhvSawC4rJafQlUbrGw6uCX+nj+s9dw1z3vNWW7j5BadZIpfETR79DV8Ew
         hZh16ukBMbitJeFU5BsfQUKIp51sWwEsk1YG0nQQai46oc1la3tzCBnK0tq0fExELHsl
         +ud85IWP/Dou3y+jgi4n9G7+whibybOXgR0gsqOE4puqJhR2b2xmiZ0CGT9PEJAVw2W7
         SS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PMoQZyndPwufvmDjpeBnGU4sgUe/qCXCw/wqqLdfTzs=;
        b=oorx+yOG/HRrxF5+9lU66E/FcLXZc67cTZgKhQN8U/fuSMSpsiUXSUGK+UMDHisIiT
         xnF6VDBbHjnCeQVz2Cm79ASx2mxJ31wv0RaWYI9s5qai5D5IZNvMOiTPZL2mK3unZD3R
         mIH9PMZHuWVZJ+TQLeq4X/2YQp91Ij4s9oi3HLjyBsM1XAfQfN3wdG+DgPi2x1y2Ol1m
         JDh3xFEg81+z13pT0y9lAEqxz0LFanvBzJdiUFB2pEcuTjuBVh13L584Jdx3n65CpDh2
         +pVlGqXKff/nKxNMKCrTmqnpzrD1ImbEMydtn4u5K5SBmMQ5QGZ6nhUCVWl9MO4x9w4H
         oEAw==
X-Gm-Message-State: AOAM530L2O8xLEthahdBK2pqjNPYz3nlyEDMxkW76x3ZWuBdpzDC2vWV
	bf+t64tiqDQrENZ/vjFc0jKoZidpnptj3Q==
X-Google-Smtp-Source: ABdhPJx8GuZn5N1nWkFIyLOJvW9TyLBVeY7cE4yOXbPGBZNSFSNQTaYJmqLAi1uAawrmXIObcB4f/w==
X-Received: by 2002:a17:906:f9cc:: with SMTP id lj12mr19734300ejb.544.1618064453494;
        Sat, 10 Apr 2021 07:20:53 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id gq9sm2759404ejb.62.2021.04.10.07.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/25] staging: rtl8723bs: remove code blocks guarded by DEBUG symbol
Date: Sat, 10 Apr 2021 16:20:21 +0200
Message-Id: <381da3f0c1ddf825b2aa7cbfd074ee2bf42aac4f.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove code blocks guarded by DEBUG symbol
remove undefinition of DEBUG

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  5 ----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 25 -------------------
 drivers/staging/rtl8723bs/include/autoconf.h  |  5 ----
 3 files changed, 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 2c50ff2d16f6..9876de3a3360 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -928,11 +928,6 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 	u32 poll = 0;
 	u8 val8;
 
-#ifdef DEBUG
-	if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == false) {
-	}
-#endif /*  DEBUG */
-
 	pHalData = GET_HAL_DATA(padapter);
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 30845235c7a4..6487aa7bc5e9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -754,21 +754,6 @@ static void hal_ReadEFuse_WiFi(
 	/*  0xff will be efuse default value instead of 0x00. */
 	memset(efuseTbl, 0xFF, EFUSE_MAX_MAP_LEN);
 
-
-#ifdef DEBUG
-if (0) {
-	for (i = 0; i < 256; i++)
-		efuse_OneByteRead(padapter, i, &efuseTbl[i], false);
-	for (i = 0; i < 256; i++) {
-		if (i % 16 == 0)
-			printk("\n");
-		printk("%02X ", efuseTbl[i]);
-	}
-	printk("\n");
-}
-#endif
-
-
 	/*  switch bank back to bank 0 for later BT and wifi use. */
 	hal_EfuseSwitchToBank(padapter, 0, bPseudoTest);
 
@@ -818,16 +803,6 @@ if (0) {
 	for (i = 0; i < _size_byte; i++)
 		pbuf[i] = efuseTbl[_offset+i];
 
-#ifdef DEBUG
-if (1) {
-	for (i = 0; i < _size_byte; i++) {
-		if (i % 16 == 0)
-			printk("\n");
-		printk("%02X ", pbuf[i]);
-	}
-	printk("\n");
-}
-#endif
 	/*  Calculate Efuse utilization */
 	EFUSE_GetEfuseDefinition(padapter, EFUSE_WIFI, TYPE_AVAILABLE_EFUSE_BYTES_TOTAL, &total, bPseudoTest);
 	used = eFuse_Addr - 1;
diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index 222297a937ab..074fee2052c9 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -44,13 +44,8 @@
 /*
  * Debug Related Config
  */
-#undef DEBUG
 
-#ifdef DEBUG
-#define DBG	1	/*  for ODM & BTCOEX debug */
-#else /*  !DEBUG */
 #define DBG	0	/*  for ODM & BTCOEX debug */
-#endif /*  !DEBUG */
 
 /* define DBG_XMIT_BUF */
 /* define DBG_XMIT_BUF_EXT */
-- 
2.20.1


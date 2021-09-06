Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04272
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lc21so15074765ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rvIFJOwmdqhe9fWIYbbg4Sju3/CvE6FlpBQTOPepHeY=;
        b=XsmuM9OljMk6T4wVtX6tyrwWYxcR7+sbe0sZqjcrdXGQyhpZOa94bF4HYEuozieR9l
         mV7/3Y0NQGb13afAmBjJbr2KAvDekaLRC/LVD7wOEcbyLg4vtm5NhRoxSIguiAgHOmKa
         fbkHcbBRoSk8kE3XzqZtGBsk04TIpspAPN1wVO9IlRQmUAk1rKCTYBwvQ65Y+Ex74mPm
         x6BIKyFPbZqtswup3unfBSe9FK7+bB8h6NBZsWYINeDNcEMyS6yMLy7S5Fvli8WAqrrK
         BG+1/Avu+HSspTjsQOSrZwo5dHf5JirVds8vulW/r9LC+VWGLY+whRvChxukywCfvfm7
         CVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rvIFJOwmdqhe9fWIYbbg4Sju3/CvE6FlpBQTOPepHeY=;
        b=bylK50KcW+dhsufzwjmuhN7yMAS35ajGPQJMMDoNVlkN3LDbymfVkcmeeNesE+lKwK
         f1tyVMwEe6cRljTwDlMo5xiwtersMatl7d4I0uK8EQ18Ms3bnTqaxARJFnDmAIoPO3yv
         osik2LzbXDtFYFYNVikcINOm7CDdOHoqx9JSb6mq2nj8zxV1qGIMUoQ4pVp8S38HT7fQ
         RU3kta/7IWzXQhV5MxuvNP8nDlH/Rk23SmYJrOIkaGfB0Kl/SAz01zyeMXpYSoGfdgNc
         NUV2QM6SRUkTvrW8ol12fTTxuA/AXsvzMRhVC2JI8dI6r6xOeCUbCdh2HwE+nK68wN1j
         nUtQ==
X-Gm-Message-State: AOAM530vVWSCPSJSweDCtoZ7NHcx1MVAyRaFIypd16K/cs/Cuu5j7t6N
	1in1T+B7lezf2jqqVYSEs+Y=
X-Google-Smtp-Source: ABdhPJw4ia2DHDSZxQn5BYveOabrWR7g3Embf18FZiaY1tcs7E4l4Tx8CFu99YC1/2gNspNQ4UDbog==
X-Received: by 2002:a17:906:32cf:: with SMTP id k15mr15086987ejk.68.1630954453651;
        Mon, 06 Sep 2021 11:54:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 15/40] staging: r8188eu: remove sreset_init_value from hal_ops
Date: Mon,  6 Sep 2021 20:53:02 +0200
Message-Id: <20210906185327.10326-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove sreset_init_value from hal_ops and remove its wrapper
rtw_hal_sreset_init(). Call sreset_init_value() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 3 ++-
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 58ece9a1232c..712e497f77ab 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,12 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-void rtw_hal_sreset_init(struct adapter *adapt)
-{
-	if (adapt->HalFunc.sreset_init_value)
-		adapt->HalFunc.sreset_init_value(adapt);
-}
-
 void rtw_hal_sreset_reset(struct adapter *adapt)
 {
 	if (adapt->HalFunc.silentreset)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 207fb182ee6c..82de4eaedf1a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_init_value = &sreset_init_value;
 	pHalFunc->sreset_reset_value = &sreset_reset_value;
 	pHalFunc->silentreset = &rtl8188e_silentreset_for_specific_platform;
 	pHalFunc->sreset_xmit_status_check = &rtl8188e_sreset_xmit_status_check;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 63842cd469c5..1cc97dcb06bc 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*sreset_init_value)(struct adapter *padapter);
 	void (*sreset_reset_value)(struct adapter *padapter);
 	void (*silentreset)(struct adapter *padapter);
 	void (*sreset_xmit_status_check)(struct adapter *padapter);
@@ -274,7 +273,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-void rtw_hal_sreset_init(struct adapter *padapter);
 void rtw_hal_sreset_reset(struct adapter *padapter);
 void rtw_hal_sreset_reset_value(struct adapter *padapter);
 void rtw_hal_sreset_xmit_status_check(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 039c05ffbc57..333005c13061 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -13,6 +13,7 @@
 #include "../include/rtw_br_ext.h"
 #include "../include/rtl8188e_led.h"
 #include "../include/rtl8188e_dm.h"
+#include "../include/rtw_sreset.h"
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek Wireless Lan Driver");
@@ -890,7 +891,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 	rtl8188e_init_dm_priv(padapter);
 	rtl8188eu_InitSwLeds(padapter);
 
-	rtw_hal_sreset_init(padapter);
+	sreset_init_value(padapter);
 
 	spin_lock_init(&padapter->br_ext_lock);
 
-- 
2.33.0


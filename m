Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCC3FDC
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:13 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z19so10496315edi.9
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rvIFJOwmdqhe9fWIYbbg4Sju3/CvE6FlpBQTOPepHeY=;
        b=Zlxg9p3Q9AnTQ4VnSKiWf5gYzI5RmFgkNJBF6wpSWW9vyavQj940jb0t5ADsLzuYa6
         wMMwKdL1bXlx1UO++BaNW0cY5L+Nn3PIZGx6v3Q6/WOEB7AzHeEGUK7WM/37gSUYZdZC
         xuLSVYQZsPfGvjlfnbRyPzS+EjkX1/O1kB+Dq328aKv7CY9LQ5GpPveBTYDdZMzQbpRz
         m3tGKhmQMRbRs3LNReS4D90myeU8LLfFRAkZWHeE/uLRG5EJpJfE8AY69Iw0OttZmCnq
         lU7iEUVck5elBnS8Ndmvm0IHcX9LXCfYAQWfV/qY3MpXCNJsBvmtr9PsS2FGGJNfTyvV
         6vmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rvIFJOwmdqhe9fWIYbbg4Sju3/CvE6FlpBQTOPepHeY=;
        b=L9uw5pSHPzuzizS8+dP35gONkc5o68QKW/7Gl2F4acCGlohNalxf2PWNiLrasux4RC
         PsovmG5njXDhqukqTaPiWKO47WnXDeO+6/c1CWMmoeU5wyVKp+/WP1KnLrg+lUWcwqN/
         F9+/7r7sk78txQpVXIOFUaNgVRLk3RSyTs2VLjpKyvNnXWtFZgLoKHVlG7y4c+mnLVI6
         +nAfbibL4kV6843h2cEEa5KcolLbivv0N7PQt0IAS4bSSm3Nn8Wk7hDMC95GtG4L3hds
         VdHREujCeRm85BOr5OqeV+mdL5jx8YkeISQDZ/5cpBowpt2MaAX9kiNHp5+VAPjEwZ+b
         VYng==
X-Gm-Message-State: AOAM530Uz7qfoAaVxaS7pNYa1ObNKYzu9vlGrEMHB/fCQ57rL8qvaJ68
	I/UfnAW8JPHVV5E8aCDEEAM=
X-Google-Smtp-Source: ABdhPJwoZAqAIxhdfe3OTrJ20OYR8+HarSoTmhX/CUmZ2M09FLZ4Yn2Bwx3p9vOOm1zShBvJGCdjzQ==
X-Received: by 2002:a05:6402:b85:: with SMTP id cf5mr14423934edb.153.1630952712421;
        Mon, 06 Sep 2021 11:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/40] staging: r8188eu: remove sreset_init_value from hal_ops
Date: Mon,  6 Sep 2021 20:24:13 +0200
Message-Id: <20210906182438.5417-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
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


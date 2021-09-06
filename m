Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187AD3FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:16 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id j13so10566820edv.13
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZcdw5/FHSKxoWTT6jITNvbxxtZhx7qTeSob97p9cnI=;
        b=gFF2lpOFLerV4CjjVuKBegI/peDL1FQP0gtrfAa4Nj7krvVdLWi8idBOpIyMupwLsr
         IG/krOkpDLBXOlP1CuFLjyikup+gSC2AwrJ/ycOWLpPRKkAlE0wxPFQLKNq1YvZqhLk2
         jn5bgroCqK6F+1ZVnV8MEFV/cEWr5sbMlR6wKB34f0HmbGj+ryt+7+2djqnqMrPuXLFH
         A2dG+5A2gHSonC5Wz5jttm7dRLYoFPYnwaifGCmQ9Nsyh0qi5Xxjza/nanEZffyuhDqX
         m1kDkEI1n3EkUNRPc+0AceIk7FI8dJCGXmsvf4v7Mbw2PbqZWsb27dQHuBP5AwZW7EkB
         GKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZcdw5/FHSKxoWTT6jITNvbxxtZhx7qTeSob97p9cnI=;
        b=LPQsjulIm0P6YhhN/XrDu7bFcoNS9fWODK3yyYS6MkwAyJ652uIV4exN9S95xZTnwg
         LwStXH8+SKJN74VdyRdmUarRsmdGR2Ky0k6DdJ9OhTF+YhO8Oa3riODKpdUa5f/ROegb
         DD3QnxIIP9T/J6IKN2JktlLzNiC+2hWOt+c0RmwSNGf8vNAumAzM7/D5nCk/QfBWfCji
         dkz09eFY/o/8w/tezS29vMtVJg0HSdyCcUX0ZJQZhuy63+wy4diT/lWRAn28gyABsHDA
         +R/gCfo6O0qBc4HWVUzvJQbXKg0hoxyNywzsCbtllqvrqCBtCFBEm91CPHwAz2+qz4V3
         1aCQ==
X-Gm-Message-State: AOAM530zrCh5C8nLs+SSqtoPxP2hmb737bQ8frY5fiI+bSzZLG62cPi0
	gil4k/v6ySwB+Eus5pyilmo=
X-Google-Smtp-Source: ABdhPJwIC6XR3GrW1F+/yKypLz2QZqJ9THIh7oyZRNLmqreeuuu7B9T43EAv2q1NEkaJjf+Qhgk+ew==
X-Received: by 2002:aa7:c44e:: with SMTP id n14mr14686675edr.66.1630954454560;
        Mon, 06 Sep 2021 11:54:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 16/40] staging: r8188eu: remove sreset_reset_value from hal_ops
Date: Mon,  6 Sep 2021 20:53:03 +0200
Message-Id: <20210906185327.10326-17-straube.linux@gmail.com>
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

Remove sreset_reset_value from hal_ops and remove its wrapper
rtw_hal_sreset_reset_value(). Call sreset_reset_value() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 4 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 712e497f77ab..e5267c23ab86 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -227,12 +227,6 @@ void rtw_hal_sreset_reset(struct adapter *adapt)
 		adapt->HalFunc.silentreset(adapt);
 }
 
-void rtw_hal_sreset_reset_value(struct adapter *adapt)
-{
-	if (adapt->HalFunc.sreset_reset_value)
-		adapt->HalFunc.sreset_reset_value(adapt);
-}
-
 void rtw_hal_sreset_xmit_status_check(struct adapter *adapt)
 {
 	if (adapt->HalFunc.sreset_xmit_status_check)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 82de4eaedf1a..222e66656aa9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_reset_value = &sreset_reset_value;
 	pHalFunc->silentreset = &rtl8188e_silentreset_for_specific_platform;
 	pHalFunc->sreset_xmit_status_check = &rtl8188e_sreset_xmit_status_check;
 	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 1cc97dcb06bc..946896698655 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*sreset_reset_value)(struct adapter *padapter);
 	void (*silentreset)(struct adapter *padapter);
 	void (*sreset_xmit_status_check)(struct adapter *padapter);
 	void (*sreset_linked_status_check) (struct adapter *padapter);
@@ -274,7 +273,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *src);
 
 void rtw_hal_sreset_reset(struct adapter *padapter);
-void rtw_hal_sreset_reset_value(struct adapter *padapter);
 void rtw_hal_sreset_xmit_status_check(struct adapter *padapter);
 void rtw_hal_sreset_linked_status_check(struct adapter *padapter);
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 333005c13061..28f6028d7335 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -816,7 +816,7 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-	rtw_hal_sreset_reset_value(padapter);
+	sreset_reset_value(padapter);
 	pwrctrlpriv->pwr_state_check_cnts = 0;
 
 	/* mlmeextpriv */
-- 
2.33.0


Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86672
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:11 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id n27so15129547eja.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/E76js6TBfOzgnGGToEEuG6uYwpd6xQ5NNXwfApcz3s=;
        b=pHntj7U+622VQ1Ck+CSoBmqqj70/AtGiWhqIZIQi4IL9mk6YRKcB6howwXloJTYt1t
         zpPPJ0M7zLQGtLA9h+FDh++6yKg1k7K5MxD5GavQQzVnOJPUYdtqgXAwYs6GQvv/xrXz
         OzU8zgARlQCDYi3+ldpyoKi81HqdOhSZjYId2ABg6ZvDEZRmKkj1DCqIJf2RS/jlja33
         p7wPrOPwoZzMgHSSc20wPhzzSJrNKY1YYeK9wTL716LplE1f8MxsZZtpB/oBemUKivgP
         cO4VmEutWQtV1McFO2zxQ3yqCpT1ywGkmCNRJp4dfWaN4AuxoZqhKHZYVy7h/GHovRYQ
         mn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/E76js6TBfOzgnGGToEEuG6uYwpd6xQ5NNXwfApcz3s=;
        b=nImC/KQl1W30SEYbNqYh+olEVqsP+SmNL61IhCYrXfxzG0nj6G/9HUCt9qPa/gSoMk
         +KfCUGXmheH0NzPGiATKZBKTWtrmx9t7AcgkblUR8wgpjD8dNR2SKTbwcCSX9EXc9C8w
         Htc0vrO2XCz6SHVsbZboxlo2v2XEep13XiFDuiLryOFuKGFdXsbIi+n5E2DfDtgfQctg
         TH3dBLPs7oVAvtzjPgthw0azVoyVL48myNdIcIdklOzKKngB41P0X8qTaC/SPJ1tmZnz
         DyW4ZnCA7FI07oYFSJuxW0q+v8bC7JobJpM07jlSGNxuKYCN2aBu0iH13ldDJS/nwnP0
         ISgw==
X-Gm-Message-State: AOAM533uhMMRnCAuOpWfo9H4ckeq1VOQXQ3pr74efD25sTpHzqz0zOuE
	Gje0ss+nUfYQzqMoB2Cb5nI=
X-Google-Smtp-Source: ABdhPJwK/EBqJRbkGK2GLxTrVSOaKnmXd4SXHMyIjdKUNGyD4XBrHnNhUsgf6HGutDp7EIxa+Et3lQ==
X-Received: by 2002:a17:907:2492:: with SMTP id zg18mr15611309ejb.233.1630954989610;
        Mon, 06 Sep 2021 12:03:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 33/40] staging: r8188eu: remove AntDivCompareHandler from hal_ops
Date: Mon,  6 Sep 2021 21:02:16 +0200
Message-Id: <20210906190223.11396-34-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove AntDivCompareHandler from hal_ops and remove its wrapper
rtw_hal_antdiv_rssi_compared(). Call AntDivCompare8188E() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c         | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c          | 8 --------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 8 --------
 4 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d330f58ab3ad..848b1d4bf398 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -14,6 +14,7 @@
 #include "../include/wlan_bssdef.h"
 #include "../include/rtw_ioctl_set.h"
 #include "../include/usb_osintf.h"
+#include "../include/rtl8188e_dm.h"
 
 extern unsigned char	MCS_rate_2R[16];
 extern unsigned char	MCS_rate_1R[16];
@@ -469,7 +470,7 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	u8 sq_final;
 	long rssi_final;
 
-	rtw_hal_antdiv_rssi_compared(padapter, dst, src); /* this will update src.Rssi, need consider again */
+	AntDivCompare8188E(padapter, dst, src); /* this will update src.Rssi, need consider again */
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
 	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src)) {
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 1bec02b1dede..e723742dab51 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -206,14 +206,6 @@ void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
 		adapt->HalFunc.SetBeaconRelatedRegistersHandler(adapt);
 }
 
-void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
-				  struct wlan_bssid_ex *dst,
-				  struct wlan_bssid_ex *src)
-{
-	if (adapt->HalFunc.AntDivCompareHandler)
-		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
-}
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 62fd62ced0e5..84449d8111c0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1773,7 +1773,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
 
-	pHalFunc->AntDivCompareHandler = &AntDivCompare8188E;
 	pHalFunc->read_bbreg = &rtl8188e_PHY_QueryBBReg;
 	pHalFunc->write_bbreg = &rtl8188e_PHY_SetBBReg;
 	pHalFunc->read_rfreg = &rtl8188e_PHY_QueryRFReg;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 929e861cc81b..2c6a3d1f0077 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -156,10 +156,6 @@ struct hal_ops {
 	void	(*run_thread)(struct adapter *adapter);
 	void	(*cancel_thread)(struct adapter *adapter);
 
-	void	(*AntDivCompareHandler)(struct adapter *adapter,
-					struct wlan_bssid_ex *dst,
-					struct wlan_bssid_ex *src);
-
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
 	s32 (*mgnt_xmit)(struct adapter *padapter,
@@ -255,10 +251,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
-				     struct wlan_bssid_ex *dst,
-				     struct wlan_bssid_ex *src);
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt);
 
-- 
2.33.0


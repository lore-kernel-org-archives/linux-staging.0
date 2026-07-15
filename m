Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5B54C043C
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119878; cv=none; b=LBtFiKliHRgtbGShYOZniVRDHG85wlpnTYoAsFymAb5vSqF/EbsCsv9PcFIGnyeaCTlohNUL798P0OdVyWcIN+uDGU3xUzZSlynYB3VbWxOi7cOL7r97EwfnGMOip0Bx9d5yV50tPnWBLZtJGG3EuwxRbSkLNo4xOophCeGUzds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119878; c=relaxed/simple;
	bh=1QTGDCvZKkTy0djuSNnMKzL2xAk47pu2/T928AMpX9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KmyXhpg+rcJNQinQp1+3ufNpgwbyic1AqavDtPIbXRrPM08HQh6gcSkyAZMJbl+RwJ6iPswlsq7z1ESVYrHg7t8Knef9+13rzRIKTKYKOzzSz9rMD7A9BGZrZFyj5u2yeQQk+6yMDtIRueRtbnKdvRDOUfKmfXgKFhdGv8JB4kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPX04U3D; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPX04U3D"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b015b2d792so6327627e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119867; x=1784724667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LIa5iHpmMsuZVmHeWYom4Y+VxWHnjdmh8WpgFjA5KE=;
        b=bPX04U3D8YCuDZ4n8+YYCRAuPlhvLgZQPPlhYAv+gpV6Eph/ZrX89l2/fU0lNSqJRl
         HVI98hWw4iX+ObfijiYZGJcr2oIoloxXu/UNya7uXdMX1HIAmKc6ysq9l0eR9+TNlTIl
         0X/2vVP54KdvtOX2x2Es/26GTLhhHN39AQKIX6l5ez/+DVLlP22scIZKvEKYb5r3RssX
         Ul0d7yaRskRamA91reZXPQR9TM+UGiG7nmlOz6wQAva4Oc8bJzu9VPcvmfvBPXVdeGQb
         j+Y50TY0wjLdlZ1KibHTu9itADtNETYLBog9rSKapKqoeAKpFZrRHGHky35TXj5C6hDU
         avaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119867; x=1784724667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LIa5iHpmMsuZVmHeWYom4Y+VxWHnjdmh8WpgFjA5KE=;
        b=Rpc7JD1m7QrY0+IaykmRJADKbXXYS58rbZkiVoj4C578YJVdFZeJLoDkXaHqYiCp9R
         lbmkWG2gdxFtQKrtgUyOigIPwMTibl1HsgMAo+MsB2IqLyZ5F1Wbjs+KJl06Oupxd69T
         KcwNzY6OAOwSNuZKg481E93gGIm2lu6cnScS/EAKHjLKncDOzWc1RH3FnaoPpmpyzQCC
         2X6yShDtkvf/p9gPyBiSojTbWPrLYHEAab2Lgv2m+m6fShT6NXxIFJ5F8H/OdNO52Tq8
         w2Ws30xFvRYnwMA0DhFcVuRtFiEmPlHgQPEBwlGkNztpyc312gvDTQqY8kS0Ety/krM+
         xkDA==
X-Gm-Message-State: AOJu0YxH98rYnY5yHPKIRBcjRcdK8JoT43xYG+OpiAe60BHuM0WTNpPV
	WMjY/JwZTa3PSmmZk5IfWv8RQ93gtJsSu3S+tJibiIO4Kqazn5z/g0BX
X-Gm-Gg: AfdE7ckOC8XrNGaJ5U5mQoQX3mX05qL5moI9BjIrxJNdC84RQrECdDyP6NSgzguzy7G
	TfBusI3RmsTjBAlC93Oc1SzML6XVBu5dPDlWDXKRyLT/6fcmwqxmA2oemU82DyWudL+KOpFd7Gl
	w8QoAvDrsJ7Qt33TLy5e4hB18417FtUM9h7A+swyfIoDEnBhvDaF7pnvRusJyxvWtRn16Gs2OM4
	I9Mhalm9q32qia8B2Vk9SLfgHlWaoe3c6c9972/bKcjo5398ukhXhjX0Lw9EQyyx1g05KvqxwF9
	WQvGl+Ajw6qSCtSV64RxoTSeQONhJ0e7PKAqdo84K2AKV/ZNKAImijiK+LmI9FXreqVPCc6lrld
	IFxx+qMPMvFNUedO3d/fmQWV8VX5QcGsIYVGBASHTYj/ieDTn6MGFZe9K0B2uB4QhgCBRbcZWiP
	mLv4FmBhRyr2p6T2duJErxF3T2cKWC7oD8TU3i1Nafq65lcoMwZaCHTQglyMVg3IBpprQtg74nf
	XVooI4BDniwYA==
X-Received: by 2002:a05:6512:12ce:b0:5b0:17c9:a4f3 with SMTP id 2adb3069b0e04-5b159b8fd2fmr1512716e87.60.1784119866632;
        Wed, 15 Jul 2026 05:51:06 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:06 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 60/61] staging: rtl8723bs: inline recv private data freeing helper
Date: Wed, 15 Jul 2026 19:48:28 +0700
Message-ID: <20260715124829.90290-61-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline the receive private data freeing logic directly into
rtw_hal_free_recv_priv. This eliminates a redundant redirection layer
for killing the recv tasklet, dropping pending skbs, and freeing
allocated memory buffers during teardown.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  2 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.h   |  1 +
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 50 ++++++++++++++++++-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 30 -----------
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    | 35 -------------
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  1 -
 .../staging/rtl8723bs/include/rtl8723b_recv.h |  1 -
 7 files changed, 50 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index efb0ffd54..bb3ebfe74 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -1031,7 +1031,7 @@ static void halbtc8723b2ant_CoexAllOff(struct btc_coexist *pBtCoexist)
 	halbtc8723b2ant_CoexTableWithType(pBtCoexist, NORMAL_EXEC, 0);
 }
 
-static void halbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist)
+void halbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist)
 {
 	/*  force to reset coex mechanism */
 
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
index 4043e4e4d..bdb7720a1 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.h
@@ -144,3 +144,4 @@ void EXhalbtc8723b2ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState);
 void EXhalbtc8723b2ant_Periodical(struct btc_coexist *pBtCoexist);
 
 void halbtc8723b2ant_InitHwConfig(struct btc_coexist *pBtCoexist);
+void halbtc8723b2ant_InitCoexDm(struct btc_coexist *pBtCoexist);
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 3244f121d..9c471d176 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -405,7 +405,30 @@ s32	rtw_hal_init_recv_priv(struct adapter *padapter)
 
 void rtw_hal_free_recv_priv(struct adapter *padapter)
 {
-	rtl8723bs_free_recv_priv(padapter);
+	u32 i;
+	struct recv_priv *precvpriv;
+	struct recv_buf *precvbuf;
+
+	precvpriv = &padapter->recvpriv;
+
+	/* 3 1. kill tasklet */
+	tasklet_kill(&precvpriv->recv_tasklet);
+
+	/* 3 2. free all recv buffers */
+	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
+	if (precvbuf) {
+		precvpriv->free_recv_buf_queue_cnt = 0;
+		for (i = 0; i < NR_RECVBUFF; i++) {
+			list_del_init(&precvbuf->list);
+			if (precvbuf->pskb)
+				dev_kfree_skb_any(precvbuf->pskb);
+			precvbuf++;
+		}
+		precvpriv->precv_buf = NULL;
+	}
+
+	kfree(precvpriv->pallocated_recv_buf);
+	precvpriv->pallocated_recv_buf = NULL;
 }
 
 void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
@@ -427,9 +450,32 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 	}
 }
 
+/* arg[0] = macid */
+/* arg[1] = raid */
+/* arg[2] = shortGIrate */
+/* arg[3] = init_rate */
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
 {
-	rtl8723b_Add_RateATid(padapter, bitmap, arg, rssi_level);
+	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct sta_info *psta;
+	u8 mac_id = arg[0];
+	u8 raid = arg[1];
+	u8 shortGI = arg[2];
+	u8 bw;
+	u32 mask = bitmap&0x0FFFFFFF;
+
+	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
+	if (!psta)
+		return;
+
+	bw = psta->bw_mode;
+
+	if (rssi_level != DM_RATR_STA_INIT)
+		mask = ODM_Get_Rate_Bitmap(&pHalData->odmpriv, mac_id, mask, rssi_level);
+
+	rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, raid, bw, shortGI, mask);
 }
 
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 826a20529..593354e41 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -697,38 +697,8 @@ void rtl8723b_set_FwJoinBssRpt_cmd(struct adapter *padapter, u8 mstatus)
 		rtl8723b_download_rsvd_page(padapter, RT_MEDIA_CONNECT);
 }
 
-/* arg[0] = macid */
-/* arg[1] = raid */
-/* arg[2] = shortGIrate */
-/* arg[3] = init_rate */
-void rtl8723b_Add_RateATid(
-	struct adapter *padapter,
-	u32 bitmap,
-	u8 *arg,
-	u8 rssi_level
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct sta_info *psta;
-	u8 mac_id = arg[0];
-	u8 raid = arg[1];
-	u8 shortGI = arg[2];
-	u8 bw;
-	u32 mask = bitmap&0x0FFFFFFF;
-
-	psta = pmlmeinfo->FW_sta_info[mac_id].psta;
-	if (!psta)
-		return;
 
-	bw = psta->bw_mode;
 
-	if (rssi_level != DM_RATR_STA_INIT)
-		mask = ODM_Get_Rate_Bitmap(&pHalData->odmpriv, mac_id, mask, rssi_level);
-
-	rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, raid, bw, shortGI, mask);
-}
 
 static void ConstructBtNullFunctionData(
 	struct adapter *padapter,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 384c5e643..f9aab253f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -356,38 +356,3 @@ void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 		rtw_enqueue_recvbuf(precvbuf, &precvpriv->free_recv_buf_queue);
 	} while (1);
 }
-
-
-/*
- * Free recv private variable of hardware dependent
- * 1. recv buf
- * 2. recv tasklet
- *
- */
-void rtl8723bs_free_recv_priv(struct adapter *padapter)
-{
-	u32 i;
-	struct recv_priv *precvpriv;
-	struct recv_buf *precvbuf;
-
-	precvpriv = &padapter->recvpriv;
-
-	/* 3 1. kill tasklet */
-	tasklet_kill(&precvpriv->recv_tasklet);
-
-	/* 3 2. free all recv buffers */
-	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
-	if (precvbuf) {
-		precvpriv->free_recv_buf_queue_cnt = 0;
-		for (i = 0; i < NR_RECVBUFF; i++) {
-			list_del_init(&precvbuf->list);
-			if (precvbuf->pskb)
-				dev_kfree_skb_any(precvbuf->pskb);
-			precvbuf++;
-		}
-		precvpriv->precv_buf = NULL;
-	}
-
-	kfree(precvpriv->pallocated_recv_buf);
-	precvpriv->pallocated_recv_buf = NULL;
-}
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index 6b2d79e19..df62991c9 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -166,7 +166,6 @@ enum {
 void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 Mode);
 void rtl8723b_set_FwJoinBssRpt_cmd(struct adapter *padapter, u8 mstatus);
 void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param);
-void rtl8723b_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
 void rtl8723b_fw_try_ap_cmd(struct adapter *padapter, u32 need_ack);
 /* s32 rtl8723b_set_lowpwr_lps_cmd(struct adapter *padapter, u8 enable); */
 void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
index c4c91f5f4..2fc530494 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_recv.h
@@ -82,7 +82,6 @@ struct rxreport_8723b {
 };
 
 
-void rtl8723bs_free_recv_priv(struct adapter *padapter);
 
 void rtl8723b_query_rx_phy_status(union recv_frame *prframe, struct phy_stat *pphy_stat);
 void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe);
-- 
2.55.0


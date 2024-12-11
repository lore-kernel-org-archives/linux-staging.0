Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAFC1F2C5B
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960100; cv=none; b=M91WXgH5E6+s2FQYMmq6fYKsfI3PfIqFWFtIeL3wO7zdtjmDST5wO/xlC+UuQOJCC8QjXJBo519fXmZF85QDahakD3D65+1JhIMuRauSlwuXL9jVeGGfqnFO5elTD1YQKfBQ8wmqRZzPpNFFv8p90iSeGbKf5+jzZOfUSxix4EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960100; c=relaxed/simple;
	bh=0tYBGPrDD1XhMtaBGIcX/OQAESdzttopXuhi4GQAfdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2+amK0Oo0p6CS/HTjP54/wP9byRpugMxz76bk1ldewtbEG1CNyL14Kv0WHMjvPN0fyQNfGpLkFFHkW14XxSeNrBQdD3TV2X81CF9zLeIKNgmqfDEAP1/ShxKZTykLqoXXTlEaoxMw7LwbW0WEYekcMT2x/0ptnHBghsgnGK4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csSK6hM7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csSK6hM7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so6524499a91.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 15:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733960098; x=1734564898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mkwrs9HgD1HUPiHXsB7Q16YHuZ/QtErSbW5RB/eh+U=;
        b=csSK6hM7LgBKjWb+V5r8mdt7e+Rng25PFCkXaW1k8igDqYXs0qbEN/ohkGR1iwcsHq
         +hBxC4kOJmTxFtI+8tjobrCuG9BIa9CfmRfkDG3yDzWtOdnigk+db7YUbYwdI+3hqosW
         6Nt5H5/EE7L9cPPw+zc+M6bDgEuasoKF8Y4mvYkHpLpJW7MuPV3kI03hrsk/W1+rmEPE
         v+YYykXLFSKoTw4tuyZbd4ReZl10YGX6b4P2KkHX3azkokFsw/xccWDiqGmb2Iu87HTe
         U0R8zv2VQnBo3cwzdzC9HSxV56QeLnfGpC1GMQycEcWVEI9k/6nMEEb2w81YJlfA/Jeg
         5+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960098; x=1734564898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mkwrs9HgD1HUPiHXsB7Q16YHuZ/QtErSbW5RB/eh+U=;
        b=A7GzewD7xaqNrsy1sLo9Z/KjlJiLJUMBzfAkkbpC2yHdBh0VkOIRM92ONLtpa4UUUw
         /KcLh8okDZQjtR9K9EKZo/s6S0JuaxcpUZjoi2KBnZxqRWUo76giHIjPHJ3j3lFrEfcP
         Pq8ZXXAjZjq27a4/43nILBrrX0QwUbp46u0VBvmguy6oBDDhYppcTXoiHJLTQ9ekEu/q
         Ifrqq5cJcXu/WYxc+hxyBNrjMHZxicVwbWdb2bva3MdWT6AUgOBkcvoR3+xVPVM/V47I
         I8LMrnLizHA2BMukkF+gdJPppDLvDXdUYddxj+s7FcavbtqG1w7hkLXnjFQ9AlS+Tvn1
         xfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXMQj2j8ambWjFgl3BfWQhyJ0+1eIWSZKZ/wQ6Qj93oJDb7lrq826tsclIlbY/9JUiUpmifQVPusJ2Z6SG5@lists.linux.dev
X-Gm-Message-State: AOJu0YwsgLfYjMwNt06ZmVIMmt4uJVUXJjXKcy9QI2EJH0ytrb5cJc2U
	ltyIKdnaXLXO2kw7LZlXWJnuVaFFHLXjeO98JVSdQz+gk0m8N6jz
X-Gm-Gg: ASbGncuzQqBN5fsHMUx6W5capqCEFssLA2qjB1j7Xnk7QbNrg7LM2P36gxU5qX6IuZC
	51ZgnyBZDSL765eI8VMTi78Bl+NHz33ck6dd/wjo8iWYg57Ky5hxTNenSJxoB3WNRVK0Iy96mmw
	XnKJoMk3hgCLIbGWGkR4OYQw+qjVZ8MvIASFViZPpA5QPbMIsqswDS1T4eWrstGpVb+10WMF0xo
	gj+EWb4tm5upoWnHCotxTLZnr4GKHyfTi0qC+qBotLmq5VrQTakNIeArg7Ac9CfhQjBip+6kD+9
	UQ==
X-Google-Smtp-Source: AGHT+IGAKGsBrI1bhx5kJrTiPMGcnbGJ8LtKwlK5tWL3AmZ5jZQsjS5FL+5h4bFS0Nw8QX0PYyFE5Q==
X-Received: by 2002:a17:90b:2dc7:b0:2ee:c291:765a with SMTP id 98e67ed59e1d1-2f13925b1a7mr2877599a91.8.1733960097853;
        Wed, 11 Dec 2024 15:34:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef8a933fdbsm9229485a91.41.2024.12.11.15.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:34:57 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] staging: rtl8723bs: delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef code
Date: Wed, 11 Dec 2024 20:26:39 -0300
Message-ID: <20241211233415.37702-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
References: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove code depending on cflag since it's not compiling
and there is no reference for it's usage;

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 53 -------------------
 .../staging/rtl8723bs/hal/rtl8723b_rxdesc.c   |  4 --
 drivers/staging/rtl8723bs/include/hal_com.h   |  5 --
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 18 -------
 4 files changed, 80 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 95fb38283c58..1803c0cd3a7e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -683,12 +683,6 @@ u8 SetHalDefVar(
 
 	switch (variable) {
 	case HAL_DEF_DBG_RX_INFO_DUMP:
-
-		if (odm->bLinked) {
-			#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-			rtw_dump_raw_rssi_info(adapter);
-			#endif
-		}
 		break;
 	case HW_DEF_ODM_DBG_FLAG:
 		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_COMP, *((u64 *)value));
@@ -879,53 +873,6 @@ void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 	}
 }
 
-#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-void rtw_dump_raw_rssi_info(struct adapter *padapter)
-{
-	u8 isCCKrate, rf_path;
-	struct hal_com_data *pHalData =  GET_HAL_DATA(padapter);
-	struct rx_raw_rssi *psample_pkt_rssi = &padapter->recvpriv.raw_rssi_info;
-
-	isCCKrate = psample_pkt_rssi->data_rate <= DESC_RATE11M;
-
-	if (isCCKrate)
-		psample_pkt_rssi->mimo_signal_strength[0] = psample_pkt_rssi->pwdball;
-
-	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
-		if (!isCCKrate) {
-			netdev_dbg(padapter->pnetdev, ", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
-				   psample_pkt_rssi->ofdm_pwr[rf_path],
-				   psample_pkt_rssi->ofdm_snr[rf_path]);
-		}
-	}
-}
-
-void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
-{
-	u8 isCCKrate, rf_path;
-	struct hal_com_data *pHalData =  GET_HAL_DATA(padapter);
-	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
-
-	struct odm_phy_info *pPhyInfo  = (PODM_PHY_INFO_T)(&pattrib->phy_info);
-	struct rx_raw_rssi *psample_pkt_rssi = &padapter->recvpriv.raw_rssi_info;
-
-	psample_pkt_rssi->data_rate = pattrib->data_rate;
-	isCCKrate = pattrib->data_rate <= DESC_RATE11M;
-
-	psample_pkt_rssi->pwdball = pPhyInfo->rx_pwd_ba11;
-	psample_pkt_rssi->pwr_all = pPhyInfo->recv_signal_power;
-
-	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
-		psample_pkt_rssi->mimo_signal_strength[rf_path] = pPhyInfo->rx_mimo_signal_strength[rf_path];
-		psample_pkt_rssi->mimo_signal_quality[rf_path] = pPhyInfo->rx_mimo_signal_quality[rf_path];
-		if (!isCCKrate) {
-			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->RxPwr[rf_path];
-			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->RxSNR[rf_path];
-		}
-	}
-}
-#endif
-
 static u32 Array_kfreemap[] = {
 	0xf8, 0xe,
 	0xf6, 0xc,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
index 717faebf8aca..db3d7d72bffa 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rxdesc.c
@@ -67,8 +67,4 @@ void rtl8723b_process_phy_info(struct adapter *padapter, void *prframe)
 	/*  Check EVM */
 	/*  */
 	process_link_qual(padapter,  precvframe);
-	#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-	rtw_store_phy_info(padapter, prframe);
-	#endif
-
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 4db93484725f..258a74076dd9 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -149,11 +149,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
-#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe);
-void rtw_dump_raw_rssi_info(struct adapter *padapter);
-#endif
-
 #define		HWSET_MAX_SIZE			512
 
 void rtw_bb_rf_gain_offset(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 18dd1464e0c2..aa9f9d5ecd01 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -89,21 +89,6 @@ struct phy_info {
 	u8 btCoexPwrAdjust;
 };
 
-#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-struct rx_raw_rssi {
-	u8 data_rate;
-	u8 pwdball;
-	s8 pwr_all;
-
-	u8 mimo_signal_strength[4];/*  in 0~100 index */
-	u8 mimo_signal_quality[4];
-
-	s8 ofdm_pwr[4];
-	u8 ofdm_snr[4];
-
-};
-#endif
-
 struct rx_pkt_attrib	{
 	u16 pkt_len;
 	u8 physt;
@@ -221,9 +206,6 @@ struct recv_priv {
 	u8 signal_strength;
 	u8 signal_qual;
 	s8 rssi;	/* translate_percentage_to_dbm(ptarget_wlan->network.PhyInfo.SignalStrength); */
-	#ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
-	struct rx_raw_rssi raw_rssi_info;
-	#endif
 	/* s8 rxpwdb; */
 	s16 noise;
 	/* int RxSNRdB[2]; */
-- 
2.47.0


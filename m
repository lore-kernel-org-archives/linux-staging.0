Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581C22ACEB
	for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733864904; cv=none; b=Yho0WS1yK1x4JPzfzxhe2MzFSFhNpLHhiG8bdLENnoINVWZUCKhyPGlGKWvfhKe//SvntvLNCmm74fSPeEFo/9ZZvvq+81+Zex2ks05K43W6TaxLe7YO8PeUHwzDjOmS0Q+pxhrBSawYSWCfvIESJC4HJ3o93yL0F13kl6FjIDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733864904; c=relaxed/simple;
	bh=0tYBGPrDD1XhMtaBGIcX/OQAESdzttopXuhi4GQAfdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fc51W5ixdGTcKT7kCPILzINA3l4FNzwFRbR29VXWd3Nng7ruWWkCGHhOIeRSZLjguhuu1zhTqhzPyrt7kAZm0H0/JmoL3M+ilz2pKiFO54NIL8FxmrxemJGKY6poT1QUxOrPltuPeGLM0YNBdJlAWyzvWrFKQrIsBsi5N34KPoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfbAKZ8W; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfbAKZ8W"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd17f231a7so4059774a12.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Dec 2024 13:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864902; x=1734469702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mkwrs9HgD1HUPiHXsB7Q16YHuZ/QtErSbW5RB/eh+U=;
        b=UfbAKZ8WloFe5ia/ImYZnUN/7pDKXSYSR0z//3BkFfz91P9VqIIru/b3T/t/zWCinH
         s8qU/oolOaPTYWYOmNjbWvNCIXPX1aImoqu6pMAXd8Bu4FCSaKxIBg31A4FCdTZcZ/AP
         2M4XQF2hfrDOgUmGXYkT1j0UQGSGCEW9l4RdHeJznCSUtyOgETet3nCHYv5BcPIUghP4
         43muCNxqBY0/4S9kHxlWYchdPQ2FFgag0hfcnhYaNPmzkYvr44eyMEyej8lpX5FkH437
         wxu0DbRy6p2rFNuwJbZ/mhty0j0t6xPruqch183J+WiFHMtRuVwFLoWbjyqDOgOpuBqh
         JJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864902; x=1734469702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mkwrs9HgD1HUPiHXsB7Q16YHuZ/QtErSbW5RB/eh+U=;
        b=bunaQPcInXZHuGfVOJmhcrfk9o/EMwiv/yYbzcFoTV+qU51FPqp4JwiyRrxUQl3Wec
         pzC2V8W98eb5DApyq3DwvbDmlQJuDt7GRUuPR/QfMEvf3dzmwAaVN0MwA3GCmAMJm7GX
         XUmG6ngn+bah6zI/0+9XqzHs7axJHwIJp11b1a5XDkTwhWnjMAk4Vz8a95YMKuF4MkOA
         EXKXKKkJiK5ri5RAjibt9B+t4myMJ/C6EIOOiyt0jQ59jGyxojlaKWjeRXasZJ3c14QM
         P6kVbJrBtbNC2fGV/RvAyPH6PylK+VUnATQDzwVp4W/z1u7IZG6WKBIZ2gcZD4opLQmo
         CzMw==
X-Forwarded-Encrypted: i=1; AJvYcCV98/R+2qOHkCR+iiLeOjXKH18+keeiKX6Dl62Z7Z5y6yOkolMEJOoOL6hDVomaHm9k+YhJJXu2Lf49JRNv@lists.linux.dev
X-Gm-Message-State: AOJu0YxAU3FXqiUB7MfZ5VOuu0C5ETES+gcqKApIMBtNbkARH+ndnBGn
	CENHqgZWSXFZ1xzNVWMj1TQ1BVFMG9RdHzb8AqE69km9ItlpfBWn
X-Gm-Gg: ASbGncvqPqTBBERwUz1Oi4Is6KZcy3Uf4CPoJ5XgaBMJYIGnWBP7K+917dBQm8upp6Q
	BYFv6gZswk5nUPGjKR8Txep6ZY3KQpWkDacP01EziBAj5hSlP+Qz6cz2t1SXksRugcsJLvpEgA3
	0k84f2IbCRpmFFVhC5xais8JF/5/K5Vf1vmnjODd7m2oGylfWhXf8c3cmJsQ73vWyrp9I0npjfV
	n0RkkhHYLNA21Wh9Zh9TDDGa6VzQ0fe6AARsMbLzNVnU2Ibk1lL86KKAoC50ToeJaFZu6ZM1d+Q
	JQ==
X-Google-Smtp-Source: AGHT+IGhnkHQMhkwvAQ0cwUekcrEGQSa5voTLpUa6xqcQOFJkFRm8LyjloVz0Q0by4q5iJtm2/ItmA==
X-Received: by 2002:a17:90b:4c8a:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-2f127fc6f1dmr665534a91.13.1733864902143;
        Tue, 10 Dec 2024 13:08:22 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700979fsm13385731a91.18.2024.12.10.13.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:08:21 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] staging: rtl8723bs: delete DBG_RX_SIGNAL_DISPLAY_RAW_DATA ifdef code
Date: Tue, 10 Dec 2024 17:48:18 -0300
Message-ID: <20241210210741.17101-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
References: <20241210210741.17101-1-rodrigo.gobbi.7@gmail.com>
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


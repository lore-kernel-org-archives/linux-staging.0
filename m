Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2381449B5AF
	for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077860; cv=none; b=o9mfixK7g0ce/U62p6QDUcxNp14L6nVNcz5dr6+BiWGCjogG8tHZNw6JWEmglxvvSYe3fK86kF3V78EFidXC0eEF356KriKm9koZ+QnR30+zQm8V7em92UdS/lXBKToQeSrHrfgpuaTO2zsIsccn2JRlIn98RGsp0WhVL3OhRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077860; c=relaxed/simple;
	bh=bEoLJMPPHo5n30/9uO0oC400YkWa40ZRNT7Yl7u0l8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FT3NY3GgqmV3xAEo66jAOUi5+gcoaCzrwyaChRhbelvhrMk7cHU1our2mxRtk2bgymWZO02MTGRyjCZ+RmrkXsN/QXH8SCt9944SwgicGkokZ383w5/PVOR8uHnheMCJzB/F7ywzmRrjLIbpvH2ykZJnCz/YVOT+YIYr4lvP1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joW/5LYO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joW/5LYO"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fe517774so2451285ad.0
        for <linux-staging@lists.linux.dev>; Thu, 10 Sep 2026 15:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077858; x=1789682658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpiUJg03bcwv6eEDHUVs1RWll43nN8DKXwJj7XGeCM4=;
        b=joW/5LYOv/yNUf+7fgmqbvoxC678NwURHOndDhX/XVkSBz8dKL/KjF70Ms1wXSAM+X
         NvEo1SyZYpIBAMvCvfQ70sjLIU5W2hOZ3OXF6UPbkG7GQnYNJf1B9+1XwOOfVTLi9oCk
         ukZf9wy7w8fdajZp2rfBVDG4nDObwPTyUOEkUYO3yXio7G+cg4izQTKs1ukVmrE8+shT
         RzwYAQfVPj1ZEG6fRHFoXMd8oKIqxUwUe1WyxX7qW53mpo/UKu7hthOfw9E2xR5lunlx
         VOW2ks+vaS+mE/Tg/r2WBH6q0UjxCrlxW6RGTvFNunIShFuPT9x5BCQeqGUTapkKmZwO
         U3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077858; x=1789682658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpiUJg03bcwv6eEDHUVs1RWll43nN8DKXwJj7XGeCM4=;
        b=XqVTCFJpzWYEAzNjRY+UcRaOlRSJwUkJIg5dfEzgW9CzfdOLNran9/7AaI1O7kCtrp
         YZTmPe/92DyFU/jdUROMFKedCZr4u9Rqr6IMsrIHy8rvEAF6AlAjKolyIQeET791TEoz
         5BEZQaLYkBWZHfc01a8ots0rE83F5MUdFwXY9rPbvh6UpUwrhWwuoc6T940XjPyZxEwJ
         6s2Z96eY+reMcITDAF2HHUu2p9gHPJLZ6wQJtRHx6hkXrr5omDr3/Mpz00clezvFzkez
         L4j3Lk5JlEtnLD1K0KvujamtCwMrJ5bzFTVB8NhF/7TDl8xhlErX+Hz3Zrgq9wCxC/oK
         2HPw==
X-Gm-Message-State: AFuF++lY6NqGjTEa+8+46LxBp8+ersbQcWCfYPXFElL/cc0JpVoVdmTQ
	xkJpjK34FJtAss0xgpMoFUVF6bQh+c4zNyZEKwMX7ZrIQCf6jB+KqMfBaE1Ytw==
X-Gm-Gg: AYBFou2WniiRIlG1NE4MMrKzo4NzPbV/jC2XSazuDWAxCuUC5+l2olIUJqWkiuIQ8Ys
	qPI0Ogk3Hp0e5PSC1C7xAIgMhTJhuTkOb34oDsdQx0RRiPLagPDWiAcvgY1U2smeUMnixPJu+TO
	C2fQulEAlV4GjibDYyerEzD0esjAj808jv66JB42FlNY7nwI0cPIDFwrrAWhRgX6fOxnAYy5lxQ
	EeHHNRnJrbJaoyiVWdPQEb2VYL+JRMae5Zrn0k8t3DTXee2JhB2hQ4owkvfeOcvJp69BAs2vzuB
	D8V/ROX/EVQsT4wX8ixEsRtOlK95dwdnBW+n75FaKhGtSBncUpWOg6jqFS7E82PpcznDSZd03lS
	4nMgVJtqI5KY8v1jQ3wt4PZ4e3zNnF+dYCu6St67/8EqLrs+kJFBrjj9rDO9rgO/tbnDDPoO6QF
	PWAHV+eNZXj1SLDRsvERlcdu5U/PFlR583QC3xdxstkk1Ae49WvjFnFHqnrkRiaZxyZHztCTxaU
	tusnHjZxneBvbMDzBm0
X-Received: by 2002:a17:903:240e:b0:2db:359e:799c with SMTP id d9443c01a7336-2dd2a4753a7mr27676685ad.22.1789077858082;
        Thu, 10 Sep 2026 15:04:18 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm997755eec.16.2026.09.10.15.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:04:17 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 3/3] staging: rtl8723bs: delete empty comment lines in header files
Date: Thu, 10 Sep 2026 15:03:59 -0700
Message-Id: <20260910220359.6683-4-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910220359.6683-1-guojy.bj@gmail.com>
References: <20260910220359.6683-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines in a bunch of include/ header files.
Add back a newline if needed for spacing, while avoiding multiple blank
lines.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h | 2 --
 drivers/staging/rtl8723bs/include/basic_types.h  | 2 --
 drivers/staging/rtl8723bs/include/drv_types.h    | 3 ---
 drivers/staging/rtl8723bs/include/hal_com.h      | 5 ++---
 drivers/staging/rtl8723bs/include/hal_com_h2c.h  | 2 --
 drivers/staging/rtl8723bs/include/hal_data.h     | 1 -
 drivers/staging/rtl8723bs/include/hal_phy.h      | 3 +--
 drivers/staging/rtl8723bs/include/rtw_eeprom.h   | 2 --
 drivers/staging/rtl8723bs/include/rtw_efuse.h    | 4 +---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 --
 drivers/staging/rtl8723bs/include/rtw_recv.h     | 2 --
 drivers/staging/rtl8723bs/include/sta_info.h     | 7 +------
 12 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
index b81252d374ef..a0c4461557e7 100644
--- a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
+++ b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
@@ -98,9 +98,7 @@ struct wlan_pwr_cfg {
 #define GET_PWR_CFG_VALUE(__PWR_CMD)		__PWR_CMD.value
 
 
-/*  */
 /* 	Prototype of protected function. */
-/*  */
 u8 HalPwrSeqCmdParsing(
 	struct adapter *padapter,
 	u8 		CutVersion,
diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index aaa1e60f4295..ff6435e2ca68 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -25,9 +25,7 @@
  *	3. After read integer from IO.
  */
 
-/*  */
 /*  Byte Swapping routine. */
-/*  */
 #define EF1Byte	(u8)
 #define EF2Byte		le16_to_cpu
 #define EF4Byte	le32_to_cpu
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 20265770ed77..9de6a3f7364b 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -209,7 +209,6 @@ struct dvobj_priv {
 	s32	processing_dev_remove;
 
 	/* for local/global synchronization */
-	/*  */
 	spinlock_t	lock;
 	int macid[NUM_STA];
 
@@ -377,9 +376,7 @@ struct adapter {
 #define adapter_to_pwrctl(adapter) (dvobj_to_pwrctl(adapter->dvobj))
 #define adapter_wdev_data(adapter) (&((adapter)->wdev_data))
 
-/*  */
 /*  Function disabled. */
-/*  */
 #define DF_TX_BIT		BIT(0)
 #define DF_RX_BIT		BIT(1)
 #define DF_IO_BIT		BIT(2)
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 17bce0f88bac..6cf4f7f678d2 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -15,10 +15,9 @@
 
 /*------------------------------ Tx Desc definition Macro ------------------------*/
 /* pragma mark -- Tx Desc related definition. -- */
-/*  */
-/*  */
+
 /* 	Rate */
-/*  */
+
 /*  CCK Rates, TxHT = 0 */
 #define DESC_RATE1M					0x00
 #define DESC_RATE2M					0x01
diff --git a/drivers/staging/rtl8723bs/include/hal_com_h2c.h b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
index a59d13090565..889b12719e2e 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_h2c.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_h2c.h
@@ -14,9 +14,7 @@
 #define H2C_MACID_CFG_LEN		7
 #define H2C_RSSI_SETTING_LEN		4
 
-/*  */
 /*     Structure    -------------------------------------------------- */
-/*  */
 struct rsvdpage_loc {
 	u8 LocProbeRsp;
 	u8 LocPsPoll;
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 614fd885451b..07a956cc47f6 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -174,7 +174,6 @@ struct hal_com_data {
 	/*  RF: at most 2 = AB = 0/1 */
 	/*  CCK = 0 OFDM = 1 HT-MCS 0-7 = 2 */
 	s8 TxPwrByRateOffset[MAX_RF_PATH_NUM][TX_PWR_BY_RATE_NUM_RATE];
-	/*  */
 
 	/*  Power Limit Table for 2.4G */
 	s8	TxPwrLimit_2_4G[MAX_REGULATION_NUM]
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index ec9bc47816db..2e519a3044d8 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -6,10 +6,9 @@
  ******************************************************************************/
 #ifndef __HAL_PHY_H__
 #define __HAL_PHY_H__
-/*  */
+
 /*  Antenna detection method, i.e., using single tone detection or RSSI reported from each antenna detected. */
 /*  Added by Roger, 2013.05.22. */
-/*  */
 #define ANT_DETECT_BY_SINGLE_TONE	BIT(0)
 #define ANT_DETECT_BY_RSSI				BIT(1)
 #define IS_ANT_DETECT_SUPPORT_SINGLE_TONE(__Adapter)		((GET_HAL_DATA(__Adapter)->AntDetection) & ANT_DETECT_BY_SINGLE_TONE)
diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index 9b84105af816..4294b021f1bd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -34,14 +34,12 @@
 #define eeprom_cis0_sz	17
 #define eeprom_cis1_sz	50
 
-/*  */
 /*  Customer ID, note that: */
 /*  This variable is initiailzed through EEPROM or registry, */
 /*  however, its definition may be different with that in EEPROM for */
 /*  EEPROM size consideration. So, we have to perform proper translation between them. */
 /*  Besides, CustomerID of registry has precedence of that of EEPROM. */
 /*  defined below. 060703, by rcnjko. */
-/*  */
 enum {
 	RT_CID_DEFAULT = 0,
 	RT_CID_8187_ALPHA0 = 1,
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1e5d61f4587b..865a47637b5a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -30,13 +30,11 @@ enum {
 
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
-/*  */
 /*	The following is for BT Efuse definition */
-/*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
 #define		EFUSE_MAX_BT_BANK		(EFUSE_MAX_BANK-1)
-/*  */
+
 /*--------------------------Define Parameters-------------------------------*/
 #define		EFUSE_MAX_WORD_UNIT			4
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index d486cd462509..eaa3e9e9d58f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -70,14 +70,12 @@ extern unsigned char WMM_INFO_OUI[];
 extern unsigned char WMM_PARA_OUI[];
 
 
-/*  */
 /*  Channel Plan Type. */
 /*  Note: */
 /* 	We just add new channel plan when the new channel plan is different from any of the following */
 /* 	channel plan. */
 /* 	If you just want to customize the actions(scan period or join actions) about one of the channel plan, */
 /* 	customize them in rt_channel_info in the RT_CHANNEL_LIST. */
-/*  */
 enum {
 	/*  old channel plan mapping ===== */
 	RT_CHANNEL_DOMAIN_FCC = 0x00,
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 5c197bd6915f..3c94f97d86db 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -296,8 +296,6 @@ struct recv_frame_hdr {
 
 	void *precvbuf;
 
-
-	/*  */
 	struct sta_info *psta;
 
 	/* for A-MPDU Rx reordering buffer control */
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index bc78c32192c0..9fa5d5319997 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -189,16 +189,13 @@ struct sta_info {
 	/* ODM_STA_INFO_T */
 	/*  ================ODM Relative Info ======================= */
 	/*  Please be care, dont declare too much structure here. It will cost memory * STA support num. */
-	/*  */
-	/*  */
 	/*  2011/10/20 MH Add for ODM STA info. */
-	/*  */
 	/*  Driver Write */
 	u8 bValid;				/*  record the sta status link or not? */
 	u8 IOTPeer;			/*  Enum value.	HT_IOT_PEER_E */
 	/*  ODM Write */
 	/* 1 PHY_STATUS_INFO */
-	u8 RSSI_Path[4];		/*  */
+	u8 RSSI_Path[4];
 	u8 RSSI_Ave;
 	u8 RXEVM[4];
 	u8 RXSNR[4];
@@ -207,9 +204,7 @@ struct sta_info {
 	/*  ODM Write */
 	/* 1 TX_INFO (may changed by IC) */
 	/* TX_INFO_T		pTxInfo;		 Define in IC folder. Move lower layer. */
-	/*  */
 	/*  ================ODM Relative Info ======================= */
-	/*  */
 
 	/* To store the sequence number of received management frame */
 	u16 rx_mgmt_frame_seq_num;
-- 
2.34.1


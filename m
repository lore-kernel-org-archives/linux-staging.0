Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BE2CA0
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id q16so59625349wrg.7
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kTPq3bwy8yog6hFLtW+V15w6R9lOZAWWw5IrK/yQyN8=;
        b=HgKm7xkW/qoi/ID9pKhSSSbbF/4253umdAAPLBkG2ooU7m5o7vPdbout5Liuf4APqh
         egHIEF3SKUWBDnUjKTFbYFhBa70bj1f4l6VS0Yf6w9EQKyIyFs4lZUveBecSqGyCDbAb
         VqSQEsCL5sGG5mydHNwzXanpzUlhK335sFVp/QSQzOqBtSlaPr/Z6dC6uuObN2wARAy/
         tctqWxpxGxH7IzvPFwqtYUwKv3c42eRv99WQgI1vqLeQT+jhMciubDtyW7W+NHXzMHS2
         qFuJtcipZEAJSy3Jafc7IQkYen2uChAg+mc6iz2XTxKvkHSRIyRXSZjwe2MR3Ymwx/Yj
         YCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTPq3bwy8yog6hFLtW+V15w6R9lOZAWWw5IrK/yQyN8=;
        b=Vz4v46MzbQheW9ISM9+eyfSXT+AojqKVxIQyMwOQP/VeTlD/AlNj52BQu6XVP6mIyJ
         2fwRY13qZxMEjNm67zTQkVOIaGeLdAXHAXeWILaARuQU4+653SDYfCdVhWSMw7Pwx4jH
         0RpvolWjXICif/0j5MMaUMH4g/Y3AvN4F5J3tpgl0cqKbRWw8Ysi9DZirEkWsFtRlNlZ
         7ZqbLg4UwOZb375Y3QErZB8o+E8oB2NEewXWlyepDTc9uvjJTBfFyU/FxOoBPQwl9R7s
         EQUPVeoqXo+hOEuF3X/VGeUw3/rvUXn3YoDleBkrNv/Abe/8Pwvbb5gqP1m0fYIfEh+D
         ncVw==
X-Gm-Message-State: AOAM530F5UjWOfVDcrm/bgc/kEwfvHHO7QGdElahfyKqNcztZy0Isuxh
	FDfvjrR3Nu8ZeippCBSHRh0Pg7BKlTo=
X-Google-Smtp-Source: ABdhPJwKMf+fs+TBJ1CkJHY8LOPZFsGF3o+HS+5e3UgWJ4mJSAx7EQQma8XXTTKq3w3nQQue2pemyQ==
X-Received: by 2002:adf:f6c1:: with SMTP id y1mr31607998wrp.351.1641025087926;
        Sat, 01 Jan 2022 00:18:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:07 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 5/7] staging: r8188eu: remove unused fields from struct hal_data_8188e
Date: Sat,  1 Jan 2022 09:17:56 +0100
Message-Id: <20220101081758.9716-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101081758.9716-1-straube.linux@gmail.com>
References: <20220101081758.9716-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused fields from struct hal_data_8188e.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 .../staging/r8188eu/include/rtl8188e_hal.h    | 30 -------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 40b3db34b8f2..2ce42d647a34 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -175,15 +175,9 @@ struct hal_data_8188e {
 
 	u16	BasicRateSet;
 
-	/*  EEPROM setting. */
-	u16	EEPROMSVID;
-	u16	EEPROMSDID;
 	u8	EEPROMRegulatory;
-
 	u8	EEPROMThermalMeter;
 
-	bool	EepromOrEfuse;
-
 	u8	Index24G_CCK_Base[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	u8	Index24G_BW40_Base[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	/* If only one tx, only BW20 and OFDM are used. */
@@ -192,11 +186,6 @@ struct hal_data_8188e {
 	s8	BW20_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
 	s8	BW40_24G_Diff[RF_PATH_MAX][MAX_TX_COUNT];
 
-	u8	TxPwrLevelCck[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
-	/*  For HT 40MHZ pwr */
-	u8	TxPwrLevelHT40_1S[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
-	/*  For HT 40MHZ pwr */
-	u8	TxPwrLevelHT40_2S[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	/*  HT 20<->40 Pwr diff */
 	u8	TxPwrHt20Diff[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	/*  For HT<->legacy pwr diff */
@@ -205,7 +194,6 @@ struct hal_data_8188e {
 	u8	PwrGroupHT20[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 	u8	PwrGroupHT40[RF_PATH_MAX][CHANNEL_MAX_NUMBER];
 
-	u8	LegacyHTTxPowerDiff;/*  Legacy to HT rate power diff */
 	/*  The current Tx Power Level */
 	u8	CurrentCckTxPwrIdx;
 	u8	CurrentOfdm24GTxPwrIdx;
@@ -213,21 +201,12 @@ struct hal_data_8188e {
 	u8	CurrentBW4024GTxPwrIdx;
 
 	/*  Read/write are allow for following hardware information variables */
-	u8	framesync;
-	u32	framesyncC34;
-	u8	framesyncMonitor;
-	u8	DefaultInitialGain[4];
 	u8	pwrGroupCnt;
 	u32	MCSTxPowerLevelOriginalOffset[MAX_PG_GROUP][16];
-	u32	CCKTxPowerLevelOriginalOffset;
 
 	u8	CrystalCap;
-	u32	AntennaTxPath;			/*  Antenna path Tx */
-	u32	AntennaRxPath;			/*  Antenna path Rx */
 	u8	ExternalPA;
 
-	u8	b1x1RecvCombine;	/*  for 1T1R receive combining */
-
 	u32	AcParam_BE; /* Original parameter for BE, use for EDCA turbo. */
 
 	struct bb_reg_def PHYRegDef[2];	/* Radio A/B */
@@ -254,17 +233,9 @@ struct hal_data_8188e {
 	u8	FwRsvdPageStartOffset; /* Reserve page start offset except
 					*  beacon in TxQ. */
 
-	/*  2010/08/09 MH Add CU power down mode. */
-	bool		pwrdown;
-
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
 
-	/*  2010/11/22 MH Add for slim combo debug mode selective. */
-	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut.
-	 * HW auto suspend ability. Close BT clock. */
-	bool		SlimComboDbg;
-
 	u16	EfuseUsedBytes;
 
 	struct P2P_PS_Offload_t	p2p_ps_offload;
@@ -280,7 +251,6 @@ struct hal_data_8188e {
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-	u32	MaxUsbRxAggBlock;
 
 	enum usb_rx_agg_mode UsbRxAggMode;
 	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
-- 
2.34.1


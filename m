Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121C2F9D
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:08 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id u21so103860684ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtDNhuesiV092x3OUvFA66jxC2b1Nb/wzZi8zlya7+c=;
        b=GM3yS8Xl9gJvJQKuBNthasfqa3Kcf6zQylH5r5pKaTmbEcSEjaG96KxA0QA8j+KH9w
         Fqa2alrijFtdDLPXJKGuZJE+hOmM6VD6uUevNdwvYc12uzJCSFd9pe2B+RGwh9qNkphT
         iQ24/imY24HsiGQ0XNRzZkHhAtZqwBnufoo/uqPKg3/6UReH6iDFKEWcKaDUe8b1fHmj
         HW87zHr0PkxsVyXfgxkahQq15UP70YnRObbW9/aXYlpPel/rCxCJFIy9RauJqxvuWt5U
         QoR+VKv8bqNSdH92FKj1yc49Nd0amn8fP1xnmcsHbWtLqBbXTEbYo5p4uvu72b5Qi4Nv
         kuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtDNhuesiV092x3OUvFA66jxC2b1Nb/wzZi8zlya7+c=;
        b=akFNIROC2A29VtW4AzjJ5Uyna9kQLzrWQjdx8IUp1fhxVZpJ37yygoQi0i/s7I49eC
         0EHCPVpeqxtLH83Ch12rtri4oyBUqTb7O6Et2gzYBLijuiHze/6Df0N193kAGhIVacHQ
         aE4M4oYbt6UEUxXKQK+guK6x3KJEfL1hJFOZIGRJh6jIqgUDVe8u4ueTI+PIbrGKHArS
         2FR98hmJjVuLxQehzAiLFiQQJE5yizbEXcidMzUCP3frBzahAfGJJrRbpyC6JEmo0jSI
         qL70Qk+h/zAGCpnhjo84Wm6phkYjsnCniGSEEDb5UzpuhwLV5f2Sad6wsWMCD4obsHPc
         d13Q==
X-Gm-Message-State: AOAM533dXbIE8TP3sCjNiNSZO9iEjkmAR1qVbO8/deX5pJoha8xFsmUY
	8sSQZ6bLIFYlMz0LunhjY4M=
X-Google-Smtp-Source: ABdhPJzhtd6hCxCr+3uiGD+xl3P5J3XKWYWOGOK6cyJhWv7YM2P3sS71wMzvuK3x/BkmS9c8i33cgw==
X-Received: by 2002:a17:906:4098:: with SMTP id u24mr2772108ejj.228.1619768706883;
        Fri, 30 Apr 2021 00:45:06 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id p18sm1413922ejb.19.2021.04.30.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/43] staging: rtl8723bs: remove commented out *RT_DISP logs
Date: Fri, 30 Apr 2021 09:43:55 +0200
Message-Id: <d91518f1e72122966700d83a8d0815a831528a16.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out ODM_RT_DISP and RT_DISP logs.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c      | 7 -------
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 179199993fa7..32f7eb952ca8 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -59,8 +59,6 @@ static u8 odm_EVMdbToPercentage(s8 Value)
 	ret_val = Value;
 	ret_val /= 2;
 
-	/* ODM_RT_DISP(FRX, RX_PHY_SQ, ("EVMdbToPercentage92C Value =%d / %x\n", ret_val, ret_val)); */
-
 	if (ret_val >= 0)
 		ret_val = 0;
 	if (ret_val <= -33)
@@ -166,7 +164,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(
 			/* Translate DBM to percentage. */
 			RSSI = odm_QueryRxPwrPercentage(rx_pwr[i]);
 			total_rssi += RSSI;
-			/* RT_DISP(FRX, RX_PHY_SS, ("RF-%d RXPWR =%x RSSI =%d\n", i, rx_pwr[i], RSSI)); */
 
 			pPhyInfo->rx_mimo_signal_strength[i] = (u8) RSSI;
 
@@ -181,7 +178,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(
 		rx_pwr_all = (((pPhyStaRpt->cck_sig_qual_ofdm_pwdb_all) >> 1)&0x7f)-110;
 
 		PWDB_ALL_BT = PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
-		/* RT_DISP(FRX, RX_PHY_SS, ("PWDB_ALL =%d\n", PWDB_ALL)); */
 
 		pPhyInfo->rx_pwd_ba11 = PWDB_ALL;
 		pPhyInfo->bt_rx_rssi_percentage = PWDB_ALL_BT;
@@ -203,9 +199,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(
 				/*  value to positive one, then the dbm value (which is supposed to be negative)  is not correct anymore. */
 				EVM = odm_EVMdbToPercentage((pPhyStaRpt->stream_rxevm[i]));	/* dbm */
 
-				/* RT_DISP(FRX, RX_PHY_SQ, ("RXRATE =%x RXEVM =%x EVM =%s%d\n", */
-				/* GET_RX_STATUS_DESC_RX_MCS(pDesc), pDrvInfo->rxevm[i], "%", EVM)); */
-
 				/* if (pPktinfo->bPacketMatchBSSID) */
 				{
 					if (i == ODM_RF_PATH_A) /*  Fill value in RFD, Get the first spatial stream only */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4e21d98f7414..db06c778993b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1148,10 +1148,8 @@ static u16 hal_EfuseGetCurrentSize_BT(struct adapter *padapter, u8 bPseudoTest)
 	retU2 = ((bank-1)*EFUSE_BT_REAL_BANK_CONTENT_LEN)+efuse_addr;
 	if (bPseudoTest) {
 		pEfuseHal->fakeBTEfuseUsedBytes = retU2;
-		/* RT_DISP(FEEPROM, EFUSE_PG, ("Hal_EfuseGetCurrentSize_BT92C(), already use %u bytes\n", pEfuseHal->fakeBTEfuseUsedBytes)); */
 	} else {
 		pEfuseHal->BTEfuseUsedBytes = retU2;
-		/* RT_DISP(FEEPROM, EFUSE_PG, ("Hal_EfuseGetCurrentSize_BT92C(), already use %u bytes\n", pEfuseHal->BTEfuseUsedBytes)); */
 	}
 
 	return retU2;
-- 
2.20.1


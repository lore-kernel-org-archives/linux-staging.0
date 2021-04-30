Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01A2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:08 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r9so105690347ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtDNhuesiV092x3OUvFA66jxC2b1Nb/wzZi8zlya7+c=;
        b=Aezp54nq2b96HKFZq+scpRF4sB5IAfBsXN00ENDqEj1nXTmurwbzvWDmm+FRz2xhWl
         KwpxzmX3pb/pn/r26PVlFMpbfHpvb9N6UDKB+2OV+iYwmN0PczmXdi7T5Yc9BekUyquD
         UyIaMOcS+mJVur6UrBYKpUlIfPH9PUceSbJGGt9rTPemYB44V6R+h2C4xeG8vE7i+3zm
         sVi23HVubyuYtwmo0kICqRq5iusWqsmgdbraaD/BqZCp6U5US32jn3FOaflm82FQMEmB
         ApEf28D7EtM4LZUQt4Y+rysvIdSWn7pI7KMaWVPhZYdXnPxIn2sd/2K09jJxuQ21Sh0D
         E9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtDNhuesiV092x3OUvFA66jxC2b1Nb/wzZi8zlya7+c=;
        b=cDk7ScNf5XTCTqqD0mhXd3MHPtgJGJ/mqvwJPV+pVaS0Oi1fAPvuOMtZlpHm1H6rJS
         k6/dKwEgS4agDiz+I1Q8qrtgMDQEJNYlMdVpU195crFYRzhOMNVk4vdK879sELS8uwVZ
         1NMocHdX30Z2h1hnTeJqUI8bjQewYqIHYp0bSgyXzYgOG5TEY1grc/Z6RlLs/4SVcxlr
         2F2MkrozuxKonDe1sVp2wVyLTc6DVh58FN9bO/Ia2fEpmoT3U1Iahuu3ShJBhXUqbbWS
         HaLCgAMoGuAjVj1cngd8EDhjnEZ1lZGzJSg/m4QAjnduhm4fV93STxrJJK0yvlPM78rn
         aj+w==
X-Gm-Message-State: AOAM531/BRvw9qfW3MZCY+a7UIvCpV9PLOefTilGcLpEQkfhaGISkVYc
	jXk+pO7xmUtdhbaM+OnJUOU=
X-Google-Smtp-Source: ABdhPJzwPYv6xp66fb44BSAAvTaW7Qke3z9tqCPrMGW2VFfQjsBcZvYr0T0ZEMkyh5H+SxQQTgr4rw==
X-Received: by 2002:a17:906:c01a:: with SMTP id e26mr4846682ejz.300.1619794687433;
        Fri, 30 Apr 2021 07:58:07 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id a22sm1481486edu.14.2021.04.30.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 37/43] staging: rtl8723bs: remove commented out *RT_DISP logs
Date: Fri, 30 Apr 2021 16:56:59 +0200
Message-Id: <23b7764fc40e1b201952be79e94e0782cf33d546.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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


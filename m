Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E872
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 18:38:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1779657wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGBuWNnuLIIkEjqXHJ5pLIXLp3WoUQ05z2H7MjCGg9o=;
        b=qADFT1sB/79kpS3GNjM8Xj8bXp2lw1Repqjd3eedxc7rzct1+ukUaDNvcrX9VMP63D
         WKQLI7sFcJs8aS3sMkAY4RXMOuwWscUVN+GjhzYrpUwbNt4b600qeZ/ReXGUQVCkq7cF
         TWHeh2wm+9uA5hF5KzhZVoR9LJ2PyG0CPfSA4r+xwlql3UzbddIQNo8GtYZ3yoR+7vlG
         SFjnZ3AkmfQnW+vqg/8jn0YynR/V1iFDaMR4NTD1qBNWfNzcL9u7UkkqlFiTz0FWgrkG
         xiNv9ViRo+/Yjh+PI//d4tXey5+0CwdjjBVJu/TA/h1L8IZR7v0PEuzEj3FojeAOIY7S
         4FMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGBuWNnuLIIkEjqXHJ5pLIXLp3WoUQ05z2H7MjCGg9o=;
        b=g4xCacQUi3VKh8N42H+hOEWfu28pxlpT+x6kGTTPXcCSOWXHcDotHTI+nTle5GSnJy
         eYXJcB5f+bT91PHAAUqRfzQOKoWAQfL/aTi/nL1uEm0VE1znV4MYZoEj9J+RVK3eaFb6
         8ckQTQWaM0GgrSmTQlYtVkP/1IrszpA7ubXYuL2Kj4vXSmfwLJZlodECrNj4kEDl1elc
         YaUIjVc3Oh0PXw0YrayTGC6eOs14rG6db1Dw4FV3LhALH4kKiCZ7yrAf//Y2iF8hFFtp
         amyEppiUX94MAM4ZsgiT332a5977uBqAiovetJOmTXVrErm3dwjAsXzrd0YovmPrblFp
         Maog==
X-Gm-Message-State: AOAM532lg6HNTj26V2eXZXifFvpC+NMPleDsAaCNI2gCeBToUIqfdhyM
	zlHtzblLfe957hhcOuPVgmyzEIjYr8o=
X-Google-Smtp-Source: ABdhPJwMORDPW45FNGZ28h/Z662qUsvrSdZj3ipuvoGDwIWIIaAEny4mStpFcjC4GdQBXbj6mDT7Xw==
X-Received: by 2002:a05:600c:614:: with SMTP id o20mr4126178wmm.66.1616611122586;
        Wed, 24 Mar 2021 11:38:42 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id z2sm4358040wrm.0.2021.03.24.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 11:38:42 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/21] Staging: rtl8723bs: remove enums in rtw_mp.h
Date: Wed, 24 Mar 2021 19:38:31 +0100
Message-Id: <20210324183847.5595-6-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324183847.5595-1-marcocesati@gmail.com>
References: <20210324183847.5595-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definitions in
include/rtw_mp.h:

	enum mp_mode
	enum mpt_rate_index
	enum power_mode
	enum ofdm_tx_mode
	enum encry_ctrl_state
	enum mpt_txpwr_def

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mp.h | 98 ----------------------
 1 file changed, 98 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index ead63cf09fe0..26dec21bf0f1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -265,97 +265,12 @@ struct mp_priv {
 /* Hardware Registers */
 #define BB_REG_BASE_ADDR		0x800
 
-/* MP variables */
-enum mp_mode {
-	MP_OFF,
-	MP_ON,
-	MP_ERR,
-	MP_CONTINUOUS_TX,
-	MP_SINGLE_CARRIER_TX,
-	MP_CARRIER_SUPPRISSION_TX,
-	MP_SINGLE_TONE_TX,
-	MP_PACKET_TX,
-	MP_PACKET_RX
-};
-
 #define MAX_RF_PATH_NUMS	RF_PATH_MAX
 
 extern u8 mpdatarate[NumRates];
 
-/* MP set force data rate base on the definition. */
-enum mpt_rate_index {
-	/* CCK rate. */
-	MPT_RATE_1M = 0,	/* 0 */
-	MPT_RATE_2M,
-	MPT_RATE_55M,
-	MPT_RATE_11M,	/* 3 */
-
-	/* OFDM rate. */
-	MPT_RATE_6M,	/* 4 */
-	MPT_RATE_9M,
-	MPT_RATE_12M,
-	MPT_RATE_18M,
-	MPT_RATE_24M,
-	MPT_RATE_36M,
-	MPT_RATE_48M,
-	MPT_RATE_54M,	/* 11 */
-
-	/* HT rate. */
-	MPT_RATE_MCS0,	/* 12 */
-	MPT_RATE_MCS1,
-	MPT_RATE_MCS2,
-	MPT_RATE_MCS3,
-	MPT_RATE_MCS4,
-	MPT_RATE_MCS5,
-	MPT_RATE_MCS6,
-	MPT_RATE_MCS7,	/* 19 */
-	MPT_RATE_MCS8,
-	MPT_RATE_MCS9,
-	MPT_RATE_MCS10,
-	MPT_RATE_MCS11,
-	MPT_RATE_MCS12,
-	MPT_RATE_MCS13,
-	MPT_RATE_MCS14,
-	MPT_RATE_MCS15,	/* 27 */
-	/* VHT rate. Total: 20*/
-	MPT_RATE_VHT1SS_MCS0 = 100,/*  To reserve MCS16~MCS31, the index starts from #100. */
-	MPT_RATE_VHT1SS_MCS1, /*  #101 */
-	MPT_RATE_VHT1SS_MCS2,
-	MPT_RATE_VHT1SS_MCS3,
-	MPT_RATE_VHT1SS_MCS4,
-	MPT_RATE_VHT1SS_MCS5,
-	MPT_RATE_VHT1SS_MCS6, /*  #106 */
-	MPT_RATE_VHT1SS_MCS7,
-	MPT_RATE_VHT1SS_MCS8,
-	MPT_RATE_VHT1SS_MCS9,
-	MPT_RATE_VHT2SS_MCS0,
-	MPT_RATE_VHT2SS_MCS1, /*  #111 */
-	MPT_RATE_VHT2SS_MCS2,
-	MPT_RATE_VHT2SS_MCS3,
-	MPT_RATE_VHT2SS_MCS4,
-	MPT_RATE_VHT2SS_MCS5,
-	MPT_RATE_VHT2SS_MCS6, /*  #116 */
-	MPT_RATE_VHT2SS_MCS7,
-	MPT_RATE_VHT2SS_MCS8,
-	MPT_RATE_VHT2SS_MCS9,
-	MPT_RATE_LAST
-};
-
 #define MAX_TX_PWR_INDEX_N_MODE 64	/*  0x3F */
 
-enum power_mode {
-	POWER_LOW = 0,
-	POWER_NORMAL
-};
-
-/*  The following enumeration is used to define the value of Reg0xD00[30:28] or JaguarReg0x914[18:16]. */
-enum ofdm_tx_mode {
-	OFDM_ALL_OFF		= 0,
-	OFDM_ContinuousTx	= 1,
-	OFDM_SingleCarrier	= 2,
-	OFDM_SingleTone		= 4,
-};
-
 #define RX_PKT_BROADCAST	1
 #define RX_PKT_DEST_ADDR	2
 #define RX_PKT_PHY_MATCH	3
@@ -371,19 +286,6 @@ enum ofdm_tx_mode {
 #define Mac_HT_FasleAlarm		0x90000000
 #define Mac_DropPacket			0xA0000000
 
-enum encry_ctrl_state {
-	HW_CONTROL,		/* hw encryption& decryption */
-	SW_CONTROL,		/* sw encryption& decryption */
-	HW_ENCRY_SW_DECRY,	/* hw encryption & sw decryption */
-	SW_ENCRY_HW_DECRY	/* sw encryption & hw decryption */
-};
-
-enum mpt_txpwr_def {
-	MPT_CCK,
-	MPT_OFDM, /*  L and HT OFDM */
-	MPT_VHT_OFDM
-};
-
 #define		REG_RF_BB_GAIN_OFFSET	0x7f
 #define		RF_GAIN_OFFSET_MASK	0xfffff
 
-- 
2.30.2


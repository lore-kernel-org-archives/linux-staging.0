Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6D70
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so1100334wmf.5
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGBuWNnuLIIkEjqXHJ5pLIXLp3WoUQ05z2H7MjCGg9o=;
        b=pqxoaL8zkPdCpN2kwPWYGz69SKiSo4aL1hiQtnQZJInXj/WA1U0pipZKgdIbz5tU3i
         TNGhXdoXMsOpOhMlnoijtobcHNjN+Bq+ST9/rLk9U7mav2C/h7kZotJOaqmSzd1q7MP7
         qTL2ydeBu7Kl3AkpRfqfSS7cHrlM0yC5U0iQt02Gwi461vFz0IYBa3SCdHimQn4iK+TF
         bqon2Pept8nFgMPGVUyt8QQRHhe60HvJKq++PyqlnonrZELgz5rbIizyuC5q4OSw4Izo
         Ue1VUThJhkzHOle8spzJQK8ylt04HIa2M+pUPPdF9L39qBGXEeashozAKOkUWTIYo6kA
         nRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGBuWNnuLIIkEjqXHJ5pLIXLp3WoUQ05z2H7MjCGg9o=;
        b=DWu02/GG/xh7v1MSxXVtLYKl8AhPhPnzvjBusIIZyz6xIxga4UYhM+DO5q7pqHvlfT
         3jKWB/P9imzCfzpN57iFlNVxS4P3DibQnNP5DY5EDxHUVEpU7OiSx2yJ9AynITbWxYDG
         Htcd5WGRn4sGF6aQ0LQKv8r2j6vCQQMqoQ2tsg4s4L2ffMjvXa/X6DWCnKMeGmHp1C0I
         xFLLG4kICG9EgPTkDIU+6xPHvQ9dfeDohzyDMaJMIxdbZupu1g8/5UmBf4pAOs1FtAOQ
         RfNRrNtK8QSuyzwDnwQ/AUP8T8D94wZ4NHZEjUk5V5MQCQCa1pnErygs/N6yWX+vRvfv
         KhhQ==
X-Gm-Message-State: AOAM5337R1RUHPkvRTdFhIu0lY46xjTZFbLs3N43z/NbNL7O1Gt7Dqzp
	jPhjO2KoORma7HdkSANjjrANntB38UA=
X-Google-Smtp-Source: ABdhPJwF0xznU+pyAsKFrpyxtGEEPm1X9e4SuOoqQwhqVwN+/+n30D0kb1lkI7X1nomDfc13kxKJ2w==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr2763895wmq.104.1616589895503;
        Wed, 24 Mar 2021 05:44:55 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:55 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/33] Staging: rtl8723bs: remove named enums in rtw_mp.h
Date: Wed, 24 Mar 2021 13:44:32 +0100
Message-Id: <20210324124456.25221-10-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
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


Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E223FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:28 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g16so165083wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BRmr7Kn+ch2D7Rk91cbzSX80Ai6rUJ5p2SRm6PQqTeg=;
        b=MxVMOeyP8hhcfjb/d+Sdlmhx9+zPCqyl8N5m+nYdqgXv65t4IyKZHIUsqTjV+FTSnF
         vBUtogjQ4SCsGrbTzZFWvq2IKGH6k/Q5uVLo2OmLJnxvuHZFoTRZFDk12H1Zb4wnKMrG
         sXT9OF6ijv/dhzWwpr5/sh4e2IPuAJy0XAVJ/suapao4JRRKbyBL9U8aZLQSzSQlGI3C
         SNbrOVgyVC86R85NbhpE9vjRZ2DE7qEJ+GPinGzc/D6zz7HWw1dUCml95NNLPgImMXHB
         4jCBMKYM4a1h77fBQnLHNuNS08etVdrUgxpt2jHaWXWlY8ga7CrNfvHQHfn3K9OS/NCl
         ZB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BRmr7Kn+ch2D7Rk91cbzSX80Ai6rUJ5p2SRm6PQqTeg=;
        b=iM4AurDhuEiCgCuW5jEwoW93VV2cTnZfTr4sjqbU5xaZPERBB2zkE0LvKJ1g34tMNl
         6q2d9S0c/TEKbXbXI8PAG273bFDS3nQdYCPrvM7y+AkWAR0BXK2WFWTL9UI19mNMjrxT
         47PsPOTwOYN+eFdsb6Fa4oSf8U4vng/ejS/GjlNvx/3w1Bkem4ABUonlqTNHq0VuctTC
         6XnPxBxrWAgPABiZrU2uvz1mvPE17L0itr1ZcUhS0jtJemFlu5P30SJRMFXBuTHZwvwo
         u+vz1kq355/bM4iaS+BvJSVUEpqxUbz0XBrHbIxTNHxqjqGtG/kp4V5vlbHlMEAesk/O
         +thg==
X-Gm-Message-State: AOAM533G34h3fslZYmhpMeUhWNGEWvHIknEndyfTZ8b1eUoc9XrW22Of
	vvt2piMEubhKAxOkgW/1/QA=
X-Google-Smtp-Source: ABdhPJxwX3o6UMofJ40335sri1zn/PwJCDWx/J6qg+im67i+DwaWwjiKftyfHbHSGAsn7OGUyK3TcQ==
X-Received: by 2002:a05:6000:14a:: with SMTP id r10mr37468236wrx.380.1632253647233;
        Tue, 21 Sep 2021 12:47:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: r8188eu: remove dead code from rtl8188e_rf6052.c
Date: Tue, 21 Sep 2021 21:46:56 +0200
Message-Id: <20210921194658.10654-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver DynamicTxHighPowerLvl is set to TxHighPwrLevel_Normal
and never changed. In the file rtl8188e_rf6052.c there are some if
statements that check DynamicTxHighPowerLvl for other values than
TxHighPwrLevel_Normal. The code in the if blocks is never executed.
Remove the dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 57 +++++--------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index edaa9a6dfdb1..946a1b97d96f 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -85,7 +85,6 @@ rtl8188e_PHY_RF6052SetCckTxPower(
 		u8 *pPowerlevel)
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
-	struct dm_priv *pdmpriv = &pHalData->dmpriv;
 	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
 	u32 TxAGC[2] = {0, 0}, tmpval = 0, pwrtrac_value;
 	bool TurboScanOff = false;
@@ -112,34 +111,19 @@ rtl8188e_PHY_RF6052SetCckTxPower(
 			}
 		}
 	} else {
-		/* Driver dynamic Tx power shall not affect Tx power.
-		 * It shall be determined by power training mechanism.
-i		 *  Currently, we cannot fully disable driver dynamic
-		 * tx power mechanism because it is referenced by BT
-		 * coexist mechanism.
-		 * In the future, two mechanism shall be separated from
-		 * each other and maintained independently. */
-		if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_Level1) {
-			TxAGC[RF_PATH_A] = 0x10101010;
-			TxAGC[RF_PATH_B] = 0x10101010;
-		} else if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_Level2) {
-			TxAGC[RF_PATH_A] = 0x00000000;
-			TxAGC[RF_PATH_B] = 0x00000000;
-		} else {
-			for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
-				TxAGC[idx1] =
-					pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
-					(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
-			}
-			if (pHalData->EEPROMRegulatory == 0) {
-				tmpval = (pHalData->MCSTxPowerLevelOriginalOffset[0][6]) +
-						(pHalData->MCSTxPowerLevelOriginalOffset[0][7] << 8);
-				TxAGC[RF_PATH_A] += tmpval;
-
-				tmpval = (pHalData->MCSTxPowerLevelOriginalOffset[0][14]) +
-						(pHalData->MCSTxPowerLevelOriginalOffset[0][15] << 24);
-				TxAGC[RF_PATH_B] += tmpval;
-			}
+		for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
+			TxAGC[idx1] =
+				pPowerlevel[idx1] | (pPowerlevel[idx1] << 8) |
+				(pPowerlevel[idx1] << 16) | (pPowerlevel[idx1] << 24);
+		}
+		if (pHalData->EEPROMRegulatory == 0) {
+			tmpval = (pHalData->MCSTxPowerLevelOriginalOffset[0][6]) +
+					(pHalData->MCSTxPowerLevelOriginalOffset[0][7] << 8);
+			TxAGC[RF_PATH_A] += tmpval;
+
+			tmpval = (pHalData->MCSTxPowerLevelOriginalOffset[0][14]) +
+					(pHalData->MCSTxPowerLevelOriginalOffset[0][15] << 24);
+			TxAGC[RF_PATH_B] += tmpval;
 		}
 	}
 	for (idx1 = RF_PATH_A; idx1 <= RF_PATH_B; idx1++) {
@@ -207,7 +191,6 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
 				    u32 *pOutWriteVal)
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
-	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
 	u8	i, chnlGroup = 0, pwr_diff_limit[4], customer_pwr_limit;
 	s8	pwr_diff = 0;
 	u32	writeVal, customer_limit, rf;
@@ -283,19 +266,7 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
 					((index < 2) ? powerBase0[rf] : powerBase1[rf]);
 			break;
 		}
-/*  20100427 Joseph: Driver dynamic Tx power shall not affect Tx power. It shall be determined by power training mechanism. */
-/*  Currently, we cannot fully disable driver dynamic tx power mechanism because it is referenced by BT coexist mechanism. */
-/*  In the future, two mechanism shall be separated from each other and maintained independently. Thanks for Lanhsin's reminder. */
-		/* 92d do not need this */
-		if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_Level1)
-			writeVal = 0x14141414;
-		else if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_Level2)
-			writeVal = 0x00000000;
-
-		/*  20100628 Joseph: High power mode for BT-Coexist mechanism. */
-		/*  This mechanism is only applied when Driver-Highpower-Mechanism is OFF. */
-		if (pdmpriv->DynamicTxHighPowerLvl == TxHighPwrLevel_BT1)
-			writeVal = writeVal - 0x06060606;
+
 		*(pOutWriteVal + rf) = writeVal;
 	}
 }
-- 
2.33.0


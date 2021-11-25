Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB302C86
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id i5so13947335wrb.2
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XIxFmbmWp8UNhN55bamLP0PSNC4syh5hVwDeqjzzjA=;
        b=SM2wHLNVQ56VRhmxfSVgSBsmH8aTHALI5IrHO/i0zkeap+3Pw0QqPNtrMai928eBdb
         eQzMxeLxFs5N0xIAn4AqQOVVR7GXtG9/HQY1G+IVNEC5Cr8Rvx6zamy3TfnPq3Mq4e6E
         f0n67reW+4jfyfW1xYjpcLtPqxIOu6YehSZZE8qtmBMdWXl91GUGXlbPo8LjFYi0jsT5
         bAHQeEe9vabXUysd8R+NwLoq1ARMhZRDm24QPakW/awzyzsodjSwqnf9C7Nq9ZLKLbVe
         gUVu+3H0y76fo//El3N6JB9Sm/i9sRa45YFPtDR5Suf7Sv2zMfKVK9G1MmgpI9CCzlfU
         63VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XIxFmbmWp8UNhN55bamLP0PSNC4syh5hVwDeqjzzjA=;
        b=KQYJd+T3RAE5Otv0X96M7mxmw2yTYyMilioaIEOcCq/Tbkof7rNiGF+0ZJZ5MJ204c
         VpEvRi43cM2q/z2pJKhUkiNqaIMQbjN9WmBxLXI8MCpgswOPCROZFhTD4YYkREokKdRX
         fLkkmvKTrrYXtjmUEAWPO5Tz593sz7aGJR2SlaFc875lNpt5PQ/I7vgQHplUyvb+SvAK
         z8eIyHAliElI3ebSCStmTB68eEAQPJMPJh35Nq4SWEgIzPEh75sTjif9c2romL3ruV2p
         jDI97IMBcr0EAawHUbvQUFlpwZrxqVN66evLG3qQ9XAtRv1h0Nikot4+BykEgQRBYYlC
         A+4g==
X-Gm-Message-State: AOAM531wpCAFfeEpjC7Z72P1KNWmuNHx1OeQN/48JlIKEhe0jC9cJ0A2
	O9xGcoISAbG9UWqVxxRTBm4=
X-Google-Smtp-Source: ABdhPJxmbEZ/C3mKh9MuRZ2lsFDqVBRuC2Hnbrm1HTBLS3bJFYxGbVQjMU9N65yM5pltsRcmNKx48g==
X-Received: by 2002:a5d:6351:: with SMTP id b17mr9331658wrw.151.1637870390811;
        Thu, 25 Nov 2021 11:59:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:50 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: remove rf_type from getTxPowerIndex88E()
Date: Thu, 25 Nov 2021 20:59:35 +0100
Message-Id: <20211125195936.10060-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211125195936.10060-1-straube.linux@gmail.com>
References: <20211125195936.10060-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pHalData->rf_type is always RF_1T1R. As a result the variable
path_nums is always set to 1 and the for loop is entered only
once with TxCount = 0. Also RF_PATH_A = 0. Remove the unneeded
check for pHalData->rf_type and resulting dead code from
getTxPowerIndex88E().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 80 +++----------------
 1 file changed, 12 insertions(+), 68 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 258349e6104f..7124b9880efa 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -611,74 +611,18 @@ static void getTxPowerIndex88E(struct adapter *Adapter, u8 channel, u8 *cckPower
 {
 	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	u8 index = (channel - 1);
-	u8 TxCount = 0, path_nums;
-
-	if ((RF_1T2R == pHalData->rf_type) || (RF_1T1R == pHalData->rf_type))
-		path_nums = 1;
-	else
-		path_nums = 2;
-
-	for (TxCount = 0; TxCount < path_nums; TxCount++) {
-		if (TxCount == RF_PATH_A) {
-			/*  1. CCK */
-			cckPowerLevel[TxCount]	= pHalData->Index24G_CCK_Base[TxCount][index];
-			/* 2. OFDM */
-			ofdmPowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-				pHalData->OFDM_24G_Diff[TxCount][RF_PATH_A];
-			/*  1. BW20 */
-			BW20PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-				pHalData->BW20_24G_Diff[TxCount][RF_PATH_A];
-			/* 2. BW40 */
-			BW40PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[TxCount][index];
-		} else if (TxCount == RF_PATH_B) {
-			/*  1. CCK */
-			cckPowerLevel[TxCount]	= pHalData->Index24G_CCK_Base[TxCount][index];
-			/* 2. OFDM */
-			ofdmPowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-			/*  1. BW20 */
-			BW20PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[TxCount][RF_PATH_A] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-			/* 2. BW40 */
-			BW40PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[TxCount][index];
-		} else if (TxCount == RF_PATH_C) {
-			/*  1. CCK */
-			cckPowerLevel[TxCount]	= pHalData->Index24G_CCK_Base[TxCount][index];
-			/* 2. OFDM */
-			ofdmPowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_B][index] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-			/*  1. BW20 */
-			BW20PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_B][index] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-			/* 2. BW40 */
-			BW40PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[TxCount][index];
-		} else if (TxCount == RF_PATH_D) {
-			/*  1. CCK */
-			cckPowerLevel[TxCount]	= pHalData->Index24G_CCK_Base[TxCount][index];
-			/* 2. OFDM */
-			ofdmPowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_B][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_C][index] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-
-			/*  1. BW20 */
-			BW20PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_A][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_B][index] +
-			pHalData->BW20_24G_Diff[RF_PATH_C][index] +
-			pHalData->BW20_24G_Diff[TxCount][index];
-
-			/* 2. BW40 */
-			BW40PowerLevel[TxCount]	= pHalData->Index24G_BW40_Base[TxCount][index];
-		}
-	}
+	u8 TxCount = RF_PATH_A;
+
+	/*  1. CCK */
+	cckPowerLevel[TxCount] = pHalData->Index24G_CCK_Base[TxCount][index];
+	/* 2. OFDM */
+	ofdmPowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->OFDM_24G_Diff[TxCount][RF_PATH_A];
+	/*  1. BW20 */
+	BW20PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[RF_PATH_A][index] +
+		pHalData->BW20_24G_Diff[TxCount][RF_PATH_A];
+	/* 2. BW40 */
+	BW40PowerLevel[TxCount] = pHalData->Index24G_BW40_Base[TxCount][index];
 }
 
 static void phy_PowerIndexCheck88E(struct adapter *Adapter, u8 channel, u8 *cckPowerLevel,
-- 
2.33.1


Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A02C81
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y196so12688765wmc.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EbQpxrlX3u2T8LjW6UHxKKJ6H/TsR/HXA2XP3vkB7hs=;
        b=RY7sbza6RseE4sGzdBTZUx9XUJjXYWZfY6zUtbZevL77CO4mMrHyASbg3MzD8vkFxx
         G6dpaxM3ddfy2j+NcJ18RECp/xX/MwMbPYe/+rgmX07NyPLM/75+twOEONcCR2EycGxj
         5awuRLsK1JQh0b2/X7A1OtaGqcKpOSDt6XnGVlJLkRnlXTQC18CI0AOZv0cACLyrNWho
         4Ejf0v2HGgIXHIThli52XZ423DSXqXI8PchuznrbGWfz4oKjLMx78K6iH5gIx2B1TZGh
         ZDuXUV8rGxUWrnHHIgJrnYTmlgI3C0wKMA0Ri76FX2AGpZ2Dir5CC3IYwl33gOiiPZjV
         VuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EbQpxrlX3u2T8LjW6UHxKKJ6H/TsR/HXA2XP3vkB7hs=;
        b=jofB2Ws3L09ni5DujxS8dp9O5c/0Ax00Jmbt3oWwgL2wgK/+0kT+JFnQdNH+aSnM+Q
         Ht4Z7cuvqqlCO+vZQ65hA2A47a3++71Gs/OS+XQxvQEsBJNMjCwr1J7gjOjWy0ASVF/N
         RrEjU8cwnPOwMiip/G592gwW0Y5v1a7FC5f5HOk5vPY9TEvHAor9WR4aCrh+a2PcPyuO
         CW+UpKMsAyG4FJ4dCEC+GsJyR6ejdJIit5L48ZPPF7CU0WeMVBP5hNagpJQj8QVP+QHT
         Zb/g9Br0E5mY+JcK3wwY6Szk0EM5lf8/Q9uKzP1dFgVnhK9hPXY3af8eBiz2wSwEYgFv
         xmTA==
X-Gm-Message-State: AOAM530o2V/yfvsUZxeY8SKzs7660ZHrwLoCJ+n4EAxH8HdK1rY1m6KT
	fIV2gUR4kVYTKHNHrkOHVpk=
X-Google-Smtp-Source: ABdhPJw+MTEnJEEQlP6qzJxBHrGZ4WcbDldQ2CFfioNNUCBWXiUllj+gsWsw+ioF84r/Cxhhsgb6vA==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr30763305wmk.92.1638119391201;
        Sun, 28 Nov 2021 09:09:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:50 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 04/10] staging: r8188eu: remove rf_type from getTxPowerIndex88E()
Date: Sun, 28 Nov 2021 18:09:18 +0100
Message-Id: <20211128170924.5874-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
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
2.34.0


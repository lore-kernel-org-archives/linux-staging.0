Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530763FD0
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 09:44:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 192-20020a1c04c9000000b002f7a4ab0a49so5457882wme.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lutVxa6fHCXHHJWCv9CzZ9NdTiQVG3MxU/LECqbu9b8=;
        b=jOxaNxjiioyGomcqsDSVW/aBxiFVE7PPpe5/MqqgI8pyMZemZwaao91kw1JtUe3jTt
         mqE44MBNBjrV6kyQkJ+43apNvy1Ni20jj4mVLWneaQlphlvBUMTkBviMZxxAYklgiZ2T
         kUSjmJ5lrtZx4/QkwizDnJp021N9txmG5f6IY4xImf+giiVSfE1DLOKo8De1QMlySLzU
         CBb5ZzyAfc5FRDxvoUjj97Ga9D2iA5cUQ6xbmTmV+G1z2kGOnxm+Q96m68+1Cer9Mfcv
         fFIk296UG5dRnhkOlXS3Nvgfe+3nWn/2jCFp7pwikavsdox4QAtJdF6Xf7qqlHRbgTXE
         fi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lutVxa6fHCXHHJWCv9CzZ9NdTiQVG3MxU/LECqbu9b8=;
        b=aN35N5v4OHLdHjiqLJTnZ2ONpKRJQL1mmgGDH6tahBtyrKOSwd0d8I2TAWMXVnWjyj
         uLnC/1x4au1gpk8CU0ruipFYbvVQ3rE/mUv0FFKvqNYWYP18F/J91uiaWFmQLOrf0wfX
         kTi9IlyYheu8xV/FAgwT/gNPyQox2sYnnb+l/QzL49nbJlfwdjYTvlw8wfGKw0RIi69e
         wvAgLoCWOU3RRdZo9FEZkC3DlgqjefIlJDRekS5Suti7ntLZFgrrEzmz/kQ7odc4HtrO
         Esg6xL195E7hubN1PjfPYTG2NTTkK+xI60Iv/BnrebPMb6lP+MCnoFhtAcg24y0gBKK6
         qElg==
X-Gm-Message-State: AOAM531wQfm1dS9tXRJ9VO36yJi2jtbVqTLu9sUjlz7HuIB8u46gZleJ
	xbM2ta/G8gp0B1WdrKVyDmw=
X-Google-Smtp-Source: ABdhPJy8diiFtTuiTSQA4GhHUVTgngDvNIKNhLvXZ9JGVnSxq655b4FhWs64UXS4ilpVOiXcD4IpIw==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr9069314wme.191.1631785465582;
        Thu, 16 Sep 2021 02:44:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id f18sm3344423wrw.63.2021.09.16.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:44:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove dead code from odm_RxPhyStatus92CSeries_Parsing()
Date: Thu, 16 Sep 2021 11:43:54 +0200
Message-Id: <20210916094354.15635-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test "if (dm_odm->SupportICType & (ODM_RTL8188E | ODM_RTL8812))" is
always true since SupportICType is always ODM_RTL8188E in this driver.
Remove the test and the never executed else arm.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Tested on x86_64 with Inter-Tech DMG-02.

 drivers/staging/r8188eu/hal/odm_HWConfig.c | 153 ++++++---------------
 1 file changed, 45 insertions(+), 108 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 40642375c972..86c2e03dcdce 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -111,7 +111,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 	pPhyInfo->RxMIMOSignalQuality[RF_PATH_B] = -1;
 
 	if (isCCKrate) {
-		u8 report;
 		u8 cck_agc_rpt;
 
 		dm_odm->PhyDbgInfo.NumQryPhyStatusCCK++;
@@ -125,113 +124,51 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 		/* 2011.11.28 LukeLee: 88E use different LNA & VGA gain table */
 		/* The RSSI formula should be modified according to the gain table */
 		/* In 88E, cck_highpwr is always set to 1 */
-		if (dm_odm->SupportICType & (ODM_RTL8188E | ODM_RTL8812)) {
-			LNA_idx = ((cck_agc_rpt & 0xE0) >> 5);
-			VGA_idx = (cck_agc_rpt & 0x1F);
-			switch (LNA_idx) {
-			case 7:
-				if (VGA_idx <= 27)
-					rx_pwr_all = -100 + 2 * (27 - VGA_idx); /* VGA_idx = 27~2 */
-				else
-					rx_pwr_all = -100;
-				break;
-			case 6:
-				rx_pwr_all = -48 + 2 * (2 - VGA_idx); /* VGA_idx = 2~0 */
-				break;
-			case 5:
-				rx_pwr_all = -42 + 2 * (7 - VGA_idx); /* VGA_idx = 7~5 */
-				break;
-			case 4:
-				rx_pwr_all = -36 + 2 * (7 - VGA_idx); /* VGA_idx = 7~4 */
-				break;
-			case 3:
-				rx_pwr_all = -24 + 2 * (7 - VGA_idx); /* VGA_idx = 7~0 */
-				break;
-			case 2:
-				if (cck_highpwr)
-					rx_pwr_all = -12 + 2 * (5 - VGA_idx); /* VGA_idx = 5~0 */
-				else
-					rx_pwr_all = -6 + 2 * (5 - VGA_idx);
-				break;
-			case 1:
-					rx_pwr_all = 8 - 2 * VGA_idx;
-				break;
-			case 0:
-					rx_pwr_all = 14 - 2 * VGA_idx;
-				break;
-			default:
-				break;
-			}
-			rx_pwr_all += 6;
-			PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
-			if (!cck_highpwr) {
-				if (PWDB_ALL >= 80)
-					PWDB_ALL = ((PWDB_ALL - 80) << 1) + ((PWDB_ALL - 80) >> 1) + 80;
-				else if ((PWDB_ALL <= 78) && (PWDB_ALL >= 20))
-					PWDB_ALL += 3;
-				if (PWDB_ALL > 100)
-					PWDB_ALL = 100;
-			}
-		} else {
-			if (!cck_highpwr) {
-				report = (cck_agc_rpt & 0xc0) >> 6;
-				switch (report) {
-				/*  03312009 modified by cosa */
-				/*  Modify the RF RNA gain value to -40, -20, -2, 14 by Jenyu's suggestion */
-				/*  Note: different RF with the different RNA gain. */
-				case 0x3:
-					rx_pwr_all = -46 - (cck_agc_rpt & 0x3e);
-					break;
-				case 0x2:
-					rx_pwr_all = -26 - (cck_agc_rpt & 0x3e);
-					break;
-				case 0x1:
-					rx_pwr_all = -12 - (cck_agc_rpt & 0x3e);
-					break;
-				case 0x0:
-					rx_pwr_all = 16 - (cck_agc_rpt & 0x3e);
-					break;
-				}
-			} else {
-				report = (cck_agc_rpt & 0x60) >> 5;
-				switch (report) {
-				case 0x3:
-					rx_pwr_all = -46 - ((cck_agc_rpt & 0x1f) << 1);
-					break;
-				case 0x2:
-					rx_pwr_all = -26 - ((cck_agc_rpt & 0x1f) << 1);
-					break;
-				case 0x1:
-					rx_pwr_all = -12 - ((cck_agc_rpt & 0x1f) << 1);
-					break;
-				case 0x0:
-					rx_pwr_all = 16 - ((cck_agc_rpt & 0x1f) << 1);
-					break;
-				}
-			}
-
-			PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
-
-			/* Modification for ext-LNA board */
-			if (dm_odm->BoardType == ODM_BOARD_HIGHPWR) {
-				if ((cck_agc_rpt >> 7) == 0) {
-					PWDB_ALL = (PWDB_ALL > 94) ? 100 : (PWDB_ALL + 6);
-				} else {
-					if (PWDB_ALL > 38)
-						PWDB_ALL -= 16;
-					else
-						PWDB_ALL = (PWDB_ALL <= 16) ? (PWDB_ALL >> 2) : (PWDB_ALL - 12);
-				}
-
-				/* CCK modification */
-				if (PWDB_ALL > 25 && PWDB_ALL <= 60)
-					PWDB_ALL += 6;
-			} else {/* Modification for int-LNA board */
-				if (PWDB_ALL > 99)
-					PWDB_ALL -= 8;
-				else if (PWDB_ALL > 50 && PWDB_ALL <= 68)
-					PWDB_ALL += 4;
-			}
+		LNA_idx = ((cck_agc_rpt & 0xE0) >> 5);
+		VGA_idx = (cck_agc_rpt & 0x1F);
+		switch (LNA_idx) {
+		case 7:
+			if (VGA_idx <= 27)
+				rx_pwr_all = -100 + 2 * (27 - VGA_idx); /* VGA_idx = 27~2 */
+			else
+				rx_pwr_all = -100;
+			break;
+		case 6:
+			rx_pwr_all = -48 + 2 * (2 - VGA_idx); /* VGA_idx = 2~0 */
+			break;
+		case 5:
+			rx_pwr_all = -42 + 2 * (7 - VGA_idx); /* VGA_idx = 7~5 */
+			break;
+		case 4:
+			rx_pwr_all = -36 + 2 * (7 - VGA_idx); /* VGA_idx = 7~4 */
+			break;
+		case 3:
+			rx_pwr_all = -24 + 2 * (7 - VGA_idx); /* VGA_idx = 7~0 */
+			break;
+		case 2:
+			if (cck_highpwr)
+				rx_pwr_all = -12 + 2 * (5 - VGA_idx); /* VGA_idx = 5~0 */
+			else
+				rx_pwr_all = -6 + 2 * (5 - VGA_idx);
+			break;
+		case 1:
+				rx_pwr_all = 8 - 2 * VGA_idx;
+			break;
+		case 0:
+				rx_pwr_all = 14 - 2 * VGA_idx;
+			break;
+		default:
+			break;
+		}
+		rx_pwr_all += 6;
+		PWDB_ALL = odm_QueryRxPwrPercentage(rx_pwr_all);
+		if (!cck_highpwr) {
+			if (PWDB_ALL >= 80)
+				PWDB_ALL = ((PWDB_ALL - 80) << 1) + ((PWDB_ALL - 80) >> 1) + 80;
+			else if ((PWDB_ALL <= 78) && (PWDB_ALL >= 20))
+				PWDB_ALL += 3;
+			if (PWDB_ALL > 100)
+				PWDB_ALL = 100;
 		}
 
 		pPhyInfo->RxPWDBAll = PWDB_ALL;
-- 
2.33.0


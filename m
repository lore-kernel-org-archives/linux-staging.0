Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08D02FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m12so14309006wru.12
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C7TXhpo3IkqxTA2se8kHpSGAWyhGsN3m02cPxt+hDNQ=;
        b=MM2LAmDwzWQ2t6MUlqtFXBj8DEtGkaQKIYdVariDA26SNybR0fGhdr0Cyr623/r0dd
         61qkFhpjkDFbLzFcw81+rEigXGZbMeoKNb8JoNzAcQCvjMWY2zGKV+ZvmniXg82RVrcL
         5zqfkqU+eRRfJjN2nIR+0yYNuxjy7PpdSvtnVUEC17QvA1dOgle+PuVhN6RCsL7rgC2g
         jnYCD84hw7b3rbcr4Gjt5rF2aBbCELN1DaNBNkAHThK8uPcEtV/XcPw1t3XNU3FyiJtm
         6R2oQYeTzvEx626ceHNjtLnnCGJMMKyVFbloXJ/UXHUzXmRRbMWLFaVR93acvKRoyohq
         goLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C7TXhpo3IkqxTA2se8kHpSGAWyhGsN3m02cPxt+hDNQ=;
        b=etCwRSvciyTmPGQky/bOSpSWyE4b7GIq+ChJur2o83PMsQ+DkNcz5UABbnDU3kNscZ
         7kGzpZlKcUGm6g6afWxWYviFha6v1dxFISqkgWCZrhhXxpFwaHD/pBmxFVcZW6eZEFQD
         G2NeamVuT5WYe7zDQ2BOnWwnPXB+ggzdLkqCpZBggs1h0nYsyy+mkZDw+I/c8tUYPhAz
         QD5M7O2Bd2aYiwAy4aB7/DxqG5Xf/qIpxd4uUyi+k5xR5bKp8puKs9jhe3UGzU6MuPq4
         QapTsTponnZSpaWfN2De4Ja3534NQIu9GxIA3xL0NrvIDgCxhB8PqMhn3f8B8s4UAvtE
         ixQQ==
X-Gm-Message-State: AOAM5308wTidaWEoEfjyhxQSyNSMXxCVE6qd7Xhbpyurkfjm6/l/LSr4
	k2SaDmYoPbre4w7fZOAR6245e41YQIM=
X-Google-Smtp-Source: ABdhPJzM/ZZJxCz9isk6YtAU4ecaoIveVrgg1nthWjrLG8m060bI9LlsSuT5Cjye7C87h/Fw1wi+eA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr14626629wrp.175.1628329722101;
        Sat, 07 Aug 2021 02:48:42 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id j19sm16361050wmi.3.2021.08.07.02.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/21] staging: rtl8723bs: fix tx power tables size
Date: Sat,  7 Aug 2021 11:48:12 +0200
Message-Id: <5f52295a8b17f68ad80ffb7b6301da83bfc11a68.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix sizes of tx power tables to the real used
values (i.e. 2 bandwidth, 3 rate sections).

Delete MAX_BASE_NUM_IN_PHY_REG_PG_2_4 macro in
this process, for it expands to a larger than
needed rate section index value.

Modify comments accordingly.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 86 +------------------
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 10 ---
 drivers/staging/rtl8723bs/include/hal_data.h  |  8 +-
 3 files changed, 4 insertions(+), 100 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 00d429977ea9..efc68c17b126 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -494,48 +494,6 @@ static u8 *Array_MP_8723B_TXPWR_LMT[] = {
 	"FCC", "20M", "HT", "1T", "14", "63",
 	"ETSI", "20M", "HT", "1T", "14", "63",
 	"MKK", "20M", "HT", "1T", "14", "63",
-	"FCC", "20M", "HT", "2T", "01", "30",
-	"ETSI", "20M", "HT", "2T", "01", "32",
-	"MKK", "20M", "HT", "2T", "01", "32",
-	"FCC", "20M", "HT", "2T", "02", "32",
-	"ETSI", "20M", "HT", "2T", "02", "32",
-	"MKK", "20M", "HT", "2T", "02", "32",
-	"FCC", "20M", "HT", "2T", "03", "32",
-	"ETSI", "20M", "HT", "2T", "03", "32",
-	"MKK", "20M", "HT", "2T", "03", "32",
-	"FCC", "20M", "HT", "2T", "04", "32",
-	"ETSI", "20M", "HT", "2T", "04", "32",
-	"MKK", "20M", "HT", "2T", "04", "32",
-	"FCC", "20M", "HT", "2T", "05", "32",
-	"ETSI", "20M", "HT", "2T", "05", "32",
-	"MKK", "20M", "HT", "2T", "05", "32",
-	"FCC", "20M", "HT", "2T", "06", "32",
-	"ETSI", "20M", "HT", "2T", "06", "32",
-	"MKK", "20M", "HT", "2T", "06", "32",
-	"FCC", "20M", "HT", "2T", "07", "32",
-	"ETSI", "20M", "HT", "2T", "07", "32",
-	"MKK", "20M", "HT", "2T", "07", "32",
-	"FCC", "20M", "HT", "2T", "08", "32",
-	"ETSI", "20M", "HT", "2T", "08", "32",
-	"MKK", "20M", "HT", "2T", "08", "32",
-	"FCC", "20M", "HT", "2T", "09", "32",
-	"ETSI", "20M", "HT", "2T", "09", "32",
-	"MKK", "20M", "HT", "2T", "09", "32",
-	"FCC", "20M", "HT", "2T", "10", "32",
-	"ETSI", "20M", "HT", "2T", "10", "32",
-	"MKK", "20M", "HT", "2T", "10", "32",
-	"FCC", "20M", "HT", "2T", "11", "30",
-	"ETSI", "20M", "HT", "2T", "11", "32",
-	"MKK", "20M", "HT", "2T", "11", "32",
-	"FCC", "20M", "HT", "2T", "12", "63",
-	"ETSI", "20M", "HT", "2T", "12", "32",
-	"MKK", "20M", "HT", "2T", "12", "32",
-	"FCC", "20M", "HT", "2T", "13", "63",
-	"ETSI", "20M", "HT", "2T", "13", "32",
-	"MKK", "20M", "HT", "2T", "13", "32",
-	"FCC", "20M", "HT", "2T", "14", "63",
-	"ETSI", "20M", "HT", "2T", "14", "63",
-	"MKK", "20M", "HT", "2T", "14", "63",
 	"FCC", "40M", "HT", "1T", "01", "63",
 	"ETSI", "40M", "HT", "1T", "01", "63",
 	"MKK", "40M", "HT", "1T", "01", "63",
@@ -577,49 +535,7 @@ static u8 *Array_MP_8723B_TXPWR_LMT[] = {
 	"MKK", "40M", "HT", "1T", "13", "32",
 	"FCC", "40M", "HT", "1T", "14", "63",
 	"ETSI", "40M", "HT", "1T", "14", "63",
-	"MKK", "40M", "HT", "1T", "14", "63",
-	"FCC", "40M", "HT", "2T", "01", "63",
-	"ETSI", "40M", "HT", "2T", "01", "63",
-	"MKK", "40M", "HT", "2T", "01", "63",
-	"FCC", "40M", "HT", "2T", "02", "63",
-	"ETSI", "40M", "HT", "2T", "02", "63",
-	"MKK", "40M", "HT", "2T", "02", "63",
-	"FCC", "40M", "HT", "2T", "03", "30",
-	"ETSI", "40M", "HT", "2T", "03", "30",
-	"MKK", "40M", "HT", "2T", "03", "30",
-	"FCC", "40M", "HT", "2T", "04", "32",
-	"ETSI", "40M", "HT", "2T", "04", "30",
-	"MKK", "40M", "HT", "2T", "04", "30",
-	"FCC", "40M", "HT", "2T", "05", "32",
-	"ETSI", "40M", "HT", "2T", "05", "30",
-	"MKK", "40M", "HT", "2T", "05", "30",
-	"FCC", "40M", "HT", "2T", "06", "32",
-	"ETSI", "40M", "HT", "2T", "06", "30",
-	"MKK", "40M", "HT", "2T", "06", "30",
-	"FCC", "40M", "HT", "2T", "07", "32",
-	"ETSI", "40M", "HT", "2T", "07", "30",
-	"MKK", "40M", "HT", "2T", "07", "30",
-	"FCC", "40M", "HT", "2T", "08", "32",
-	"ETSI", "40M", "HT", "2T", "08", "30",
-	"MKK", "40M", "HT", "2T", "08", "30",
-	"FCC", "40M", "HT", "2T", "09", "32",
-	"ETSI", "40M", "HT", "2T", "09", "30",
-	"MKK", "40M", "HT", "2T", "09", "30",
-	"FCC", "40M", "HT", "2T", "10", "32",
-	"ETSI", "40M", "HT", "2T", "10", "30",
-	"MKK", "40M", "HT", "2T", "10", "30",
-	"FCC", "40M", "HT", "2T", "11", "30",
-	"ETSI", "40M", "HT", "2T", "11", "30",
-	"MKK", "40M", "HT", "2T", "11", "30",
-	"FCC", "40M", "HT", "2T", "12", "63",
-	"ETSI", "40M", "HT", "2T", "12", "32",
-	"MKK", "40M", "HT", "2T", "12", "32",
-	"FCC", "40M", "HT", "2T", "13", "63",
-	"ETSI", "40M", "HT", "2T", "13", "32",
-	"MKK", "40M", "HT", "2T", "13", "32",
-	"FCC", "40M", "HT", "2T", "14", "63",
-	"ETSI", "40M", "HT", "2T", "14", "63",
-	"MKK", "40M", "HT", "2T", "14", "63"
+	"MKK", "40M", "HT", "1T", "14", "63"
 };
 
 void ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(struct dm_odm_t *pDM_Odm)
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 14f34e38a327..3e814a15e893 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -836,12 +836,6 @@ void PHY_SetTxPowerLimit(
 		rateSection = 1;
 	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("1T"), 2))
 		rateSection = 2;
-	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("2T"), 2))
-		rateSection = 3;
-	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("3T"), 2))
-		rateSection = 4;
-	else if (eqNByte(RateSection, (u8 *)("HT"), 2) && eqNByte(RfPath, (u8 *)("4T"), 2))
-		rateSection = 5;
 	else
 		return;
 
@@ -849,10 +843,6 @@ void PHY_SetTxPowerLimit(
 		bandwidth = 0;
 	else if (eqNByte(Bandwidth, (u8 *)("40M"), 3))
 		bandwidth = 1;
-	else if (eqNByte(Bandwidth, (u8 *)("80M"), 3))
-		bandwidth = 2;
-	else if (eqNByte(Bandwidth, (u8 *)("160M"), 4))
-		bandwidth = 3;
 
 	channelIndex = phy_GetChannelIndexOfTxPowerLimit(channel);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index db9d7587c20e..b87c90f693ec 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -52,10 +52,8 @@ enum rt_ampdu_burst {
 
 /*  Tx Power Limit Table Size */
 #define MAX_REGULATION_NUM			4
-#define MAX_2_4G_BANDWIDTH_NUM			4
-#define MAX_RATE_SECTION_NUM			10
-
-#define MAX_BASE_NUM_IN_PHY_REG_PG_2_4G		10 /*   CCK:1, OFDM:1, HT:4, VHT:4 */
+#define MAX_2_4G_BANDWIDTH_NUM			2
+#define MAX_RATE_SECTION_NUM			3 /* CCK:1, OFDM:1, HT:1 */
 
 /*  duplicate code, will move to ODM ######### */
 /* define IQK_MAC_REG_NUM		4 */
@@ -257,7 +255,7 @@ struct hal_com_data {
 						[MAX_RF_PATH_NUM];
 
 	/*  Store the original power by rate value of the base of each rate section of rf path A & B */
-	u8 TxPwrByRateBase2_4G[MAX_RF_PATH_NUM][MAX_BASE_NUM_IN_PHY_REG_PG_2_4G];
+	u8 TxPwrByRateBase2_4G[MAX_RF_PATH_NUM][MAX_RATE_SECTION_NUM];
 
 	/*  For power group */
 	u8 PwrGroupHT20[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];
-- 
2.20.1


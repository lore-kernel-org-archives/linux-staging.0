Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DE2FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i10-20020a05600c354ab029025a0f317abfso10633402wmq.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P+J7zqcolDmfspavfo2f9McxNVxOftLX2lSxzml65Lk=;
        b=oqCuyLNDtGk1mJj5WKS+I9UZoMnclHmBAKQg6gkiN5Aotm8yXQ7Py37EICPLTQ/T1Y
         3TucOEdGQPA3z/iaZzIPeKvAtoF0gBtrGSQP+Y1hAiPH+NexMMJ+Qmcq8pk7dNVeHDo7
         1An2A/zjoFQRLMqPwWJhR4Md3NbcrWZEeo4y4xJ/cfLQM2WdsGM6xmxCFn6lAivi5pFZ
         C8acYjhDLsFK43Od5+0kxzK1Pzu/mmqt2l0KdohQDibzQ775czGHuyRQlMpbiwZ2cyNB
         mj0WpNbG+Q0vPAxlJ0ZnaT3iIx2394tXD+E8KAc/mzRjivoKvpJPZFxIMEP4ySJMhsiS
         Grgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+J7zqcolDmfspavfo2f9McxNVxOftLX2lSxzml65Lk=;
        b=aljp2HEbr6BIKljaGNAaMQ4ZD2kDn8mmwbngbld/OhEblEdoOLMZhTBvekpcSt2asB
         17gpuBTilC6/b/d6bPLFrdnjUoET5gQSCoe4PnR9TEKQjoSmKpfj/XKY1mr7RWM2O1s4
         TuZH2WFr+KrxzH2kTqcuxubXAlnHyIskjwD9WD5SmmHnPv3IImobaDheAAhsLqCk2sIm
         D6Y6sGyEJGnXn60gruBXDR5L+0dM/jO2k3jF0f8apvKifiLOgmn2RE13v+TJoI8U/HbC
         dVVohwdbLwU7ezk1v8kAjR0fFOvgTwjG5WvZMo7V1zYOy1wUgjCuCDCNUfhhDN+dOyT8
         OxFA==
X-Gm-Message-State: AOAM533KP/362gB0dL7XdopBSfP8B9n8UX8hKUbCLVrhwJc6SGa61pEQ
	6lVC2gD1ntIZKOfEop0Xyy8=
X-Google-Smtp-Source: ABdhPJz8+jSz/DRrGmp3ocosBxu+XwWkRXoS3/WmlFcc2mm38UsYjJBu2ALNeu4xWFIXzb4ayxY4iQ==
X-Received: by 2002:a05:600c:2049:: with SMTP id p9mr1724499wmg.37.1628329720749;
        Sat, 07 Aug 2021 02:48:40 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id y14sm326329wrs.29.2021.08.07.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:40 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/21] staging: rtl8723bs: use MAX_RF_PATH_NUM as ceiling to rf path index
Date: Sat,  7 Aug 2021 11:48:11 +0200
Message-Id: <88da23cef57131b39a63b2757b91f959553dd65d.1628329348.git.fabioaiuto83@gmail.com>
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

use MAX_RF_PATH_NUM as ceiling to rf path index.
Only 2 rf paths are used, not 4. Remove also
TX_POWER_BY_RATE_NUM_RF left unused.

Use RF_PATH_A as loop starting point instead of
hardcoded 0, as in other places.

Related comments modified accordingly.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c |  2 +-
 drivers/staging/rtl8723bs/include/hal_data.h   | 12 +++++-------
 drivers/staging/rtl8723bs/include/hal_pg.h     |  8 +++-----
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 272a9ec7a2d3..14f34e38a327 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -347,7 +347,7 @@ void PHY_InitTxPowerByRate(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	u8 rfPath, rate;
 
-	for (rfPath = 0; rfPath < TX_PWR_BY_RATE_NUM_RF; ++rfPath)
+	for (rfPath = RF_PATH_A; rfPath < MAX_RF_PATH_NUM; ++rfPath)
 		for (rate = 0; rate < TX_PWR_BY_RATE_NUM_RATE; ++rate)
 			pHalData->TxPwrByRateOffset[rfPath][rate] = 0;
 }
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 7bbf81ce3045..db9d7587c20e 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -234,14 +234,12 @@ struct hal_com_data {
 	u8 TxPwrInPercentage;
 
 	u8 TxPwrCalibrateRate;
-	/*  TX power by rate table at most 4RF path. */
-	/*  The register is */
-	/*  VHT TX power by rate off setArray = */
-	/*  RF: at most 4*4 = ABCD = 0/1/2/3 */
-	/*  CCK = 0 OFDM = 1/2 HT-MCS 0-15 =3/4/56 VHT =7/8/9/10/11 */
+	/*  TX power by rate table */
+	/*  RF: at most 2 = AB = 0/1 */
+	/*  CCK = 0 OFDM = 1 HT-MCS 0-7 = 2 */
 	u8 TxPwrByRateTable;
 	u8 TxPwrByRateBand;
-	s8 TxPwrByRateOffset[TX_PWR_BY_RATE_NUM_RF][TX_PWR_BY_RATE_NUM_RATE];
+	s8 TxPwrByRateOffset[MAX_RF_PATH_NUM][TX_PWR_BY_RATE_NUM_RATE];
 	/*  */
 
 	/* 2 Power Limit Table */
@@ -259,7 +257,7 @@ struct hal_com_data {
 						[MAX_RF_PATH_NUM];
 
 	/*  Store the original power by rate value of the base of each rate section of rf path A & B */
-	u8 TxPwrByRateBase2_4G[TX_PWR_BY_RATE_NUM_RF][MAX_BASE_NUM_IN_PHY_REG_PG_2_4G];
+	u8 TxPwrByRateBase2_4G[MAX_RF_PATH_NUM][MAX_BASE_NUM_IN_PHY_REG_PG_2_4G];
 
 	/*  For power group */
 	u8 PwrGroupHT20[RF_PATH_MAX_92C_88E][CHANNEL_MAX_NUMBER];
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 2d8ccc9ddebb..7cb9c441fc01 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -14,11 +14,9 @@
  */
 #define MAX_TX_COUNT				4
 
-/*  For VHT series TX power by rate table. */
-/*  VHT TX power by rate off setArray = */
-/*  RF: at most 4*4 = ABCD = 0/1/2/3 */
-/*  CCK = 0 OFDM = 1/2 HT-MCS 0-15 =3/4/56 VHT =7/8/9/10/11 */
-#define TX_PWR_BY_RATE_NUM_RF			4
+/*  TX power by rate table. */
+/*  RF: = AB = 0/1 */
+/*  CCK = 0 OFDM = 1 HT-MCS 0-7 = 2 */
 #define TX_PWR_BY_RATE_NUM_RATE			84
 #define MAX_RF_PATH_NUM				2
 #define	MAX_CHNL_GROUP_24G			6
-- 
2.20.1


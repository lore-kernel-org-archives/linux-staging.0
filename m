Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB429D6
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id b11so14348207wrx.6
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yvrs/t9mWUESzDPcxjj1KRsT2IHzyiSvfwyLWrUR7Wo=;
        b=MOgN6DlI3wk4RowbDbc02YaBvk/Rl3qOs2twAobCw1l5YfTOUJyYWn2nwpFLz8EOgK
         aDKg9xYWua7fa0ZD1CWdB3/kK+hps7QbUoPb/JjLCFahuQUnUT9xLDBzLpcoftsiW+LQ
         IhaVafjVXUzkIdXO1DWYGQXAb/hqSbSS1rdT9VqHsXwfZWLHn/4kG7x7GjAhZYe2PVrl
         TFUWwztjFMJ64TaNhRBhDdlNXbDzTJAdpLKIcL+ezqQ5omK7INlJuAc53fSuYs5nUYus
         28WLHumk6kbKFepvCr97cXGSapb+U8X5IkA+3OPIFGE28DCcyZml58hPxsq0SMsIWray
         18Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yvrs/t9mWUESzDPcxjj1KRsT2IHzyiSvfwyLWrUR7Wo=;
        b=Ee4zyn+PHl1HcwrnNzbYFhb57CqHh2R3khJXGyYh4kwz3imO/Z87sLp9I/8SzbM3Xy
         L9Ephu25LBAuyxmtIzoIDShhizrl1sCboN6xR0UAtpRovUHKLO+7d4ZRc9JNqKSKpjpA
         z7aUN/zCTTp0H3rS+s/JsYSSa+AOQTA5X40bSMClAacC54EnJBWHBZb+visyNEDqGuyk
         gum1j8JP2fyU3YrEq6Ga00qICAczmvJOWZWvjOBhDxNfd25SGFuEAHRWiEKTCRU578DA
         OenLwQ8QPbxxDCDtw7iBRGwH3I1YCUuvMQM//Kzy7jstf7awTk/xZtZY0aFDbRo3HWm7
         rjrw==
X-Gm-Message-State: AOAM533V9ba7jYEz35EqG20/iHkc8BhDRQx0a/dJ263nCzrOiM6zlJAb
	SaPhxcLGXDniHVc1ArAKFQ4=
X-Google-Smtp-Source: ABdhPJy3Q9QFNTnOJdGB7H9N1uk04ehOi0EGAOKA+OPxgBM5cyD9u3QTWxxM6RRAeTAjaaGPIktJhw==
X-Received: by 2002:a5d:67c4:: with SMTP id n4mr14571018wrw.176.1628329697881;
        Sat, 07 Aug 2021 02:48:17 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id y11sm14839535wru.0.2021.08.07.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/21] staging: rtl8723bs: remove unneeded loop
Date: Sat,  7 Aug 2021 11:47:54 +0200
Message-Id: <45f2ed02b8e5bb25057da6e7dc3e7c8713a1a2c0.1628329348.git.fabioaiuto83@gmail.com>
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

remove unneeded loop over multiple spatial streams
as phy only works on 1 spatial stream.

Removed commented code, removed condition
always satisfied, beautified comments.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 43 +++++++++-----------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 17a5850183ad..af4d5ab1b382 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -78,7 +78,7 @@ static void odm_RxPhyStatus92CSeries_Parsing(
 	struct odm_packet_info *pPktinfo
 )
 {
-	u8 i, Max_spatial_stream;
+	u8 i;
 	s8 rx_pwr[4], rx_pwr_all = 0;
 	u8 EVM, PWDB_ALL = 0, PWDB_ALL_BT;
 	u8 RSSI, total_rssi = 0;
@@ -182,30 +182,27 @@ static void odm_RxPhyStatus92CSeries_Parsing(
 		pPhyInfo->rx_power = rx_pwr_all;
 		pPhyInfo->recv_signal_power = rx_pwr_all;
 
-		{/* pMgntInfo->CustomerID != RT_CID_819x_Lenovo */
-			/*  */
-			/*  (3)EVM of HT rate */
-			/*  */
-			Max_spatial_stream = 1; /* only spatial stream 1 makes sense */
-
-			for (i = 0; i < Max_spatial_stream; i++) {
-				/*  Do not use shift operation like "rx_evmX >>= 1" because the compilor of free build environment */
-				/*  fill most significant bit to "zero" when doing shifting operation which may change a negative */
-				/*  value to positive one, then the dbm value (which is supposed to be negative)  is not correct anymore. */
-				EVM = odm_EVMdbToPercentage((pPhyStaRpt->stream_rxevm[i]));	/* dbm */
-
-				/* if (pPktinfo->bPacketMatchBSSID) */
-				{
-					if (i == ODM_RF_PATH_A) /*  Fill value in RFD, Get the first spatial stream only */
-						pPhyInfo->signal_quality = (u8)(EVM & 0xff);
-
-					pPhyInfo->rx_mimo_signal_quality[i] = (u8)(EVM & 0xff);
-				}
-			}
-		}
+		/*
+		 * (3)EVM of HT rate
+		 *
+		 * Only spatial stream 1 makes sense
+		 *
+		 * Do not use shift operation like "rx_evmX >>= 1"
+		 * because the compiler of free build environment
+		 * fill most significant bit to "zero" when doing
+		 * shifting operation which may change a negative
+		 * value to positive one, then the dbm value (which
+		 * is supposed to be negative) is not correct
+		 * anymore.
+		 */
+		EVM = odm_EVMdbToPercentage(pPhyStaRpt->stream_rxevm[0]);	/* dbm */
+
+		/*  Fill value in RFD, Get the first spatial stream only */
+		pPhyInfo->signal_quality = (u8)(EVM & 0xff);
+
+		pPhyInfo->rx_mimo_signal_quality[ODM_RF_PATH_A] = (u8)(EVM & 0xff);
 
 		ODM_ParsingCFO(pDM_Odm, pPktinfo, pPhyStaRpt->path_cfotail);
-
 	}
 
 	/* UI BSS List signal strength(in percentage), make it good looking, from 0~100. */
-- 
2.20.1


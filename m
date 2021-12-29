Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077872CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:40 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a203-20020a1c7fd4000000b003457874263aso15027528wmd.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RYLjV/KsTSydN7cpKQfVD7hNP0rRNeSCBgS7kcgCQmE=;
        b=DkUAFMhlYQXgbNx+AjtbaEhrxXPxTEAhzrIDs3KBbUzIGx9Qhj18rdUQ96yrJgpKYx
         Ezfywnsj6TyTfmj69qrd8A68maDw4Xe16ZmKMXSkBfVL4tjMUrdM6tsTFRU0nI+2BQEi
         SIGL9ZhBZnAKnllbvjsFpXvkXB0a8I1JFNdZWErRDw0ULTyok24snuGfJxQ61L6cryFx
         7aRYArkU8HVOrzXsemDabUhDTuj6cfEXqJh6fD/5f/EWw7koa549lb52IU6B9y4Aw4tW
         rwNqO8FrKUh3Lh7cULaxpZpejtDc5Q8h2PaHS4FOkHu9CkTtG9Bvft3wD0Hb4WlcEjjr
         blNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RYLjV/KsTSydN7cpKQfVD7hNP0rRNeSCBgS7kcgCQmE=;
        b=jlE0Xmh+NvJQ0x2P5h7Mo2l5QLNwDkPNX7+y6smAwVU7GTjurkPE6ZwzZz79viVlMq
         LN6EGdsl5n9ICXyqsewFD9iYV4Y3po3xYemPGJ/RHz/5tHuXm2VpH2OKS5YGe7OGASZ/
         uidWBH87+Pue+C5JkXhZS35K7eONLQom4h2XDlU+GUcm7wNCUQMu6LWQKkIQWe55Ff7a
         Dv1YRoIinc32GFzdY67si+kUeLKgyDI6PSTVtVSQKzBnbvl6UKbdSZ61OGBs3MmZ4o+0
         KNpNfeuA1OMu6svuWdkSzNDaZe7RZ4x5XbiVZVm4mrSWbDk5YxhGrQXww7NmeTN2UKB1
         agEA==
X-Gm-Message-State: AOAM533mH1HF2wq49IK5Klk6txos2+YGXOs7/p6NXKmkGzFByvX1nDAG
	r6diZwcero01fn9Ulj8GxP0=
X-Google-Smtp-Source: ABdhPJyOdfC8KhiTiLj0hrDkzqCjnb/WGqoY9W6CPCX6638Hq5YePXVFIeoW40P/fqgsvFCu7KcjnQ==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr7138529wmh.118.1640811099477;
        Wed, 29 Dec 2021 12:51:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/32] staging: r8188eu: make odm_CommonInfoSelfUpdate() static
Date: Wed, 29 Dec 2021 21:50:54 +0100
Message-Id: <20211229205108.26373-19-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_CommonInfoSelfUpdate() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 52 +++++++++----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index d62ae3e021be..94ad1e5b9804 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -311,6 +311,32 @@ static void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm)
 	pDM_Odm->RFPathRxEnable = (u8)rtl8188e_PHY_QueryBBReg(adapter, 0xc04, 0x0F);
 }
 
+static void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
+{
+	u8 EntryCnt = 0;
+	u8 i;
+	struct sta_info *pEntry;
+
+	if (*pDM_Odm->pBandWidth == ODM_BW40M) {
+		if (*pDM_Odm->pSecChOffset == 1)
+			pDM_Odm->ControlChannel = *pDM_Odm->pChannel - 2;
+		else if (*pDM_Odm->pSecChOffset == 2)
+			pDM_Odm->ControlChannel = *pDM_Odm->pChannel + 2;
+	} else {
+		pDM_Odm->ControlChannel = *pDM_Odm->pChannel;
+	}
+
+	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
+		pEntry = pDM_Odm->pODM_StaInfo[i];
+		if (IS_STA_VALID(pEntry))
+			EntryCnt++;
+	}
+	if (EntryCnt == 1)
+		pDM_Odm->bOneEntryOnly = true;
+	else
+		pDM_Odm->bOneEntryOnly = false;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -434,32 +460,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 	}
 }
 
-void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
-{
-	u8 EntryCnt = 0;
-	u8 i;
-	struct sta_info *pEntry;
-
-	if (*pDM_Odm->pBandWidth == ODM_BW40M) {
-		if (*pDM_Odm->pSecChOffset == 1)
-			pDM_Odm->ControlChannel = *pDM_Odm->pChannel - 2;
-		else if (*pDM_Odm->pSecChOffset == 2)
-			pDM_Odm->ControlChannel = *pDM_Odm->pChannel + 2;
-	} else {
-		pDM_Odm->ControlChannel = *pDM_Odm->pChannel;
-	}
-
-	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		pEntry = pDM_Odm->pODM_StaInfo[i];
-		if (IS_STA_VALID(pEntry))
-			EntryCnt++;
-	}
-	if (EntryCnt == 1)
-		pDM_Odm->bOneEntryOnly = true;
-	else
-		pDM_Odm->bOneEntryOnly = false;
-}
-
 void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index b92e5b68161e..e6e6c7c49130 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -35,7 +35,6 @@ void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
-void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1


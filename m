Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302872CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id b73so14380569wmd.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KNcBsGkgbuF3jMvtnNADnzVX5XV2OEwlyvafToFPdO0=;
        b=ntmCOynjOVu6CT64KOi5XybB6ojWl5kzqPoXOoQ5LX9RqCIpNj0sMhk1pMmy9sabKe
         Ga1oEN9gn9XslKY2r0yAVXnEf2ve05cYaK52KhQbDnEI09hEtLY0+5lmfsTBCoUGfYrA
         PWTdMzNYjlO0UHgTYvjAtuDPiHk9t72nt7fyk9jO7p2mLTJgXM7JK4jy+OiygxAhiWHy
         cxGUwAVzG4Toa7oMv9UalcUeRUeT4N4x+8kvt7GNFe0vD0akcyjil/vAwuPYvos0aBbE
         jOwEiYCo400tmNogBMtIl6iRg6lWsybRXhgdLGiPJmB7oZ8kM2DEFbdruUM4ZZFG+lE8
         DxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KNcBsGkgbuF3jMvtnNADnzVX5XV2OEwlyvafToFPdO0=;
        b=J/Uh4OAGyRoXpHIIHGMKeB03Qqj9XPSHq6DgjjAiAmpsnN49A8GPLZS7zivLhHYHeG
         dh3ZjW7k8EaK5iNOCtfKFX27POrS9mfkCHsuYq4ufm+CQAy7aPbL9gp7jPmUWrT2nzTx
         D21cnLI8CJv/00AP3yIRpSHLEsXtkx05Z+Mkzo+XvgBZ3JUk+K0Aj9Uy7J7kYAHa8PTj
         HGXmMgHyIDTBrvA0jTS9pFecf4ZwvVq/sRUHnx5aKAKQKTTSNEDmrTR/C8GKngEl/WLU
         OrRHFvlrjiWqtVTyKWkVJ74Y+vVr926ip37tT8UjLKPt/APJnhru1e7LF4CBhtOG+k5Q
         dvuQ==
X-Gm-Message-State: AOAM531Au/ocdCuPGrFCWNMa+XWAx13PS86/UYSHjo+WWWtwsQmir2LZ
	f7hyqnqU2Zme+KdqMoweAZw=
X-Google-Smtp-Source: ABdhPJxpcBXzLBTXK1CC834Ev/TfD3ZATrVeAoSRqJKQn1OJ4SovdHKSaENeB8g7jszRdL1LhBqpQg==
X-Received: by 2002:a05:600c:2308:: with SMTP id 8mr23139236wmo.14.1640811103700;
        Wed, 29 Dec 2021 12:51:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:43 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 24/32] staging: r8188eu: make odm_RSSIMonitorCheck() static
Date: Wed, 29 Dec 2021 21:51:00 +0100
Message-Id: <20211229205108.26373-25-straube.linux@gmail.com>
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

Function odm_RSSIMonitorCheck() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 148 +++++++++---------
 drivers/staging/r8188eu/include/odm_precomp.h |   1 -
 2 files changed, 72 insertions(+), 77 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 88ce6675fb30..a8b477f70c29 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -456,6 +456,78 @@ static void odm_CCKPacketDetectionThresh(struct odm_dm_struct *pDM_Odm)
 	ODM_Write_CCK_CCA_Thres(pDM_Odm, CurCCK_CCAThres);
 }
 
+static void FindMinimumRSSI(struct adapter *pAdapter)
+{
+	struct hal_data_8188e *pHalData = &pAdapter->haldata;
+	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
+	struct mlme_priv	*pmlmepriv = &pAdapter->mlmepriv;
+
+	/* 1 1.Determine the minimum RSSI */
+	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
+	    pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
+		pdmpriv->MinUndecoratedPWDBForDM = 0;
+
+	pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
+}
+
+static void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
+{
+	struct adapter *Adapter = pDM_Odm->Adapter;
+	struct hal_data_8188e *pHalData = &Adapter->haldata;
+	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
+	int	i;
+	int	tmpEntryMaxPWDB = 0, tmpEntryMinPWDB = 0xff;
+	u8	sta_cnt = 0;
+	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
+	struct sta_info *psta;
+
+	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
+		return;
+
+	if (!check_fwstate(&Adapter->mlmepriv, _FW_LINKED))
+		return;
+
+	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
+		psta = pDM_Odm->pODM_StaInfo[i];
+		if (IS_STA_VALID(psta) &&
+		    (psta->state & WIFI_ASOC_STATE) &&
+		    !is_broadcast_ether_addr(psta->hwaddr) &&
+		    memcmp(psta->hwaddr, myid(&Adapter->eeprompriv), ETH_ALEN)) {
+			if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmpEntryMinPWDB)
+				tmpEntryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
+
+			if (psta->rssi_stat.UndecoratedSmoothedPWDB > tmpEntryMaxPWDB)
+				tmpEntryMaxPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
+			if (psta->rssi_stat.UndecoratedSmoothedPWDB != (-1))
+				PWDB_rssi[sta_cnt++] = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB << 16));
+		}
+	}
+
+	for (i = 0; i < sta_cnt; i++) {
+		if (PWDB_rssi[i] != (0)) {
+			if (pHalData->fw_ractrl) {
+				/*  Report every sta's RSSI to FW */
+			} else {
+				ODM_RA_SetRSSI_8188E(
+				&pHalData->odmpriv, (PWDB_rssi[i] & 0xFF), (u8)((PWDB_rssi[i] >> 16) & 0xFF));
+			}
+		}
+	}
+
+	if (tmpEntryMaxPWDB != 0)	/*  If associated entry is found */
+		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmpEntryMaxPWDB;
+	else
+		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = 0;
+
+	if (tmpEntryMinPWDB != 0xff) /*  If associated entry is found */
+		pdmpriv->EntryMinUndecoratedSmoothedPWDB = tmpEntryMinPWDB;
+	else
+		pdmpriv->EntryMinUndecoratedSmoothedPWDB = 0;
+
+	FindMinimumRSSI(Adapter);
+	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM);
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -753,82 +825,6 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
 	return false;
 }
 
-/* 3============================================================ */
-/* 3 RSSI Monitor */
-/* 3============================================================ */
-
-static void FindMinimumRSSI(struct adapter *pAdapter)
-{
-	struct hal_data_8188e *pHalData = &pAdapter->haldata;
-	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
-	struct mlme_priv	*pmlmepriv = &pAdapter->mlmepriv;
-
-	/* 1 1.Determine the minimum RSSI */
-	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
-		pdmpriv->MinUndecoratedPWDBForDM = 0;
-
-	pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
-}
-
-void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
-{
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct dm_priv	*pdmpriv = &pHalData->dmpriv;
-	int	i;
-	int	tmpEntryMaxPWDB = 0, tmpEntryMinPWDB = 0xff;
-	u8	sta_cnt = 0;
-	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
-	struct sta_info *psta;
-
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
-		return;
-
-	if (!check_fwstate(&Adapter->mlmepriv, _FW_LINKED))
-		return;
-
-	for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
-		psta = pDM_Odm->pODM_StaInfo[i];
-		if (IS_STA_VALID(psta) &&
-		    (psta->state & WIFI_ASOC_STATE) &&
-		    !is_broadcast_ether_addr(psta->hwaddr) &&
-		    memcmp(psta->hwaddr, myid(&Adapter->eeprompriv), ETH_ALEN)) {
-			if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmpEntryMinPWDB)
-				tmpEntryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
-
-			if (psta->rssi_stat.UndecoratedSmoothedPWDB > tmpEntryMaxPWDB)
-				tmpEntryMaxPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
-			if (psta->rssi_stat.UndecoratedSmoothedPWDB != (-1))
-				PWDB_rssi[sta_cnt++] = (psta->mac_id | (psta->rssi_stat.UndecoratedSmoothedPWDB << 16));
-		}
-	}
-
-	for (i = 0; i < sta_cnt; i++) {
-		if (PWDB_rssi[i] != (0)) {
-			if (pHalData->fw_ractrl) {
-				/*  Report every sta's RSSI to FW */
-			} else {
-				ODM_RA_SetRSSI_8188E(
-				&pHalData->odmpriv, (PWDB_rssi[i] & 0xFF), (u8)((PWDB_rssi[i] >> 16) & 0xFF));
-			}
-		}
-	}
-
-	if (tmpEntryMaxPWDB != 0)	/*  If associated entry is found */
-		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = tmpEntryMaxPWDB;
-	else
-		pdmpriv->EntryMaxUndecoratedSmoothedPWDB = 0;
-
-	if (tmpEntryMinPWDB != 0xff) /*  If associated entry is found */
-		pdmpriv->EntryMinUndecoratedSmoothedPWDB = tmpEntryMinPWDB;
-	else
-		pdmpriv->EntryMinUndecoratedSmoothedPWDB = 0;
-
-	FindMinimumRSSI(Adapter);
-	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM);
-}
-
 /* 3============================================================ */
 /* 3 Tx Power Tracking */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 71f3cd6eb9cd..9a22a9211d1c 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -34,7 +34,6 @@
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm);
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1


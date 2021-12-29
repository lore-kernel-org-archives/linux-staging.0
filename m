Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D12CA4
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v11so46593639wrw.10
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fV6rF+h2p4xnM+TdhV3cNj0xTKGOLLvdKxWwKe4ndzI=;
        b=PxM1fXXWlABHeD2m9JqP6uzDMtc+ZCg9F+QP5QCu5sk6NmpOIx+9BCCW3lRxT6AVOg
         rXB+NTBVGEdTq7PqP2QdL1n6+/RslYy3tmY/uV3OgrW8ILMUzntQQE4pCbGj5n4DsY3S
         LPwd3s207Yod6/oPiZELbNgEIDkqES8q6pCJeaB8lBhpWdl1jrVmLY5lT4kAaFasHBkD
         VEORbW6tRBy5M5MHwGigk//OGqjy9+p7L6fPRcKg5ndF1OW9tjiKgCw1ZiIOv6XHoHv6
         2w7SzSzxfbl69FFa9BzPqtsL7eIYvZ3Pv+tcu2q6ikmGVTeZ2dYgUSgX4KWnEVEL2Fs6
         NlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fV6rF+h2p4xnM+TdhV3cNj0xTKGOLLvdKxWwKe4ndzI=;
        b=vfVSLJX1fGLZRrvxG5LFB+m3tMGgNIMUhov7+xuxZN1isk/msxxbI7qBo0dRJy4SJd
         cs5AyfC4YgsRK/pjMNhEdxUCokwqCd6NgluH5GLVPHnL+qfiVXo1u3vOkNLZzuGHRMh9
         C+MDrDgx+63UV3TlQCALycNMchpLs5fK/HpQ/ArYA084fOtLRZvIlCMHjwqCqVz4W5xb
         DR6RqZFv0XKsf6OGXSYZ8fmM6yy+4b+TeeU952hIIctdtlLgvyogNzA637Vp21E6GcQz
         td1UxsiJqNLlA2JBofdnSjSDHbwrvoNqYsqgLxwLukHisKUHq+wj4E5CPwGlX563DsWt
         zGPw==
X-Gm-Message-State: AOAM531uqsPNO0234YqGQiPy99qJhAfWEm7zJAM4p5JpyyOo/rNM/0rH
	iMVIjNZ8kFqAa4oG1kXaXEQ=
X-Google-Smtp-Source: ABdhPJzImfWH65x5+ZAx6c6XJX/1E6vaq1sVobtYRF4hy/86NUSvJaG6ADkHyJUwVE/RTtOMnRS4og==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr21644086wro.621.1640811107921;
        Wed, 29 Dec 2021 12:51:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 30/32] staging: r8188eu: make odm_EdcaTurboCheck() static
Date: Wed, 29 Dec 2021 21:51:06 +0100
Message-Id: <20211229205108.26373-31-straube.linux@gmail.com>
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

Function odm_EdcaTurboCheck() is only used in odm.c. Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 154 +++++++++---------
 drivers/staging/r8188eu/include/odm_precomp.h |   2 -
 2 files changed, 77 insertions(+), 79 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 9afd9ed10432..acdf0ba40567 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -560,6 +560,83 @@ static void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm)
 	Adapter->recvpriv.bIsAnyNonBEPkts = false;
 }
 
+static void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm)
+{
+	struct adapter *Adapter = pDM_Odm->Adapter;
+	u32	trafficIndex;
+	u32	edca_param;
+	u64	cur_tx_bytes = 0;
+	u64	cur_rx_bytes = 0;
+	u8	bbtchange = false;
+	struct hal_data_8188e *pHalData = &Adapter->haldata;
+	struct xmit_priv		*pxmitpriv = &Adapter->xmitpriv;
+	struct recv_priv		*precvpriv = &Adapter->recvpriv;
+	struct registry_priv	*pregpriv = &Adapter->registrypriv;
+	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
+	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
+
+	if (!(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO))
+		return;
+
+	if (pregpriv->wifi_spec == 1)
+		goto dm_CheckEdcaTurbo_EXIT;
+
+	if (pmlmeinfo->assoc_AP_vendor >=  HT_IOT_PEER_MAX)
+		goto dm_CheckEdcaTurbo_EXIT;
+
+	/*  Check if the status needs to be changed. */
+	if ((bbtchange) || (!precvpriv->bIsAnyNonBEPkts)) {
+		cur_tx_bytes = pxmitpriv->tx_bytes - pxmitpriv->last_tx_bytes;
+		cur_rx_bytes = precvpriv->rx_bytes - precvpriv->last_rx_bytes;
+
+		/* traffic, TX or RX */
+		if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_RALINK) ||
+		    (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS)) {
+			if (cur_tx_bytes > (cur_rx_bytes << 2)) {
+				/*  Uplink TP is present. */
+				trafficIndex = UP_LINK;
+			} else {
+				/*  Balance TP is present. */
+				trafficIndex = DOWN_LINK;
+			}
+		} else {
+			if (cur_rx_bytes > (cur_tx_bytes << 2)) {
+				/*  Downlink TP is present. */
+				trafficIndex = DOWN_LINK;
+			} else {
+				/*  Balance TP is present. */
+				trafficIndex = UP_LINK;
+			}
+		}
+
+		if ((pDM_Odm->DM_EDCA_Table.prv_traffic_idx != trafficIndex) || (!pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA)) {
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_CISCO) && (pmlmeext->cur_wireless_mode & WIRELESS_11_24N))
+				edca_param = EDCAParam[pmlmeinfo->assoc_AP_vendor][trafficIndex];
+			else
+				edca_param = EDCAParam[HT_IOT_PEER_UNKNOWN][trafficIndex];
+
+			rtw_write32(Adapter, REG_EDCA_BE_PARAM, edca_param);
+
+			pDM_Odm->DM_EDCA_Table.prv_traffic_idx = trafficIndex;
+		}
+
+		pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = true;
+	} else {
+		/*  Turn Off EDCA turbo here. */
+		/*  Restore original EDCA according to the declaration of AP. */
+		if (pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA) {
+			rtw_write32(Adapter, REG_EDCA_BE_PARAM, pHalData->AcParam_BE);
+			pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
+		}
+	}
+
+dm_CheckEdcaTurbo_EXIT:
+	/*  Set variables for next time. */
+	precvpriv->bIsAnyNonBEPkts = false;
+	pxmitpriv->last_tx_bytes = pxmitpriv->tx_bytes;
+	precvpriv->last_rx_bytes = precvpriv->rx_bytes;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -874,80 +951,3 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 		pDM_Odm->RFCalibrateInfo.TM_Trigger = 0;
 	}
 }
-
-void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm)
-{
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	u32	trafficIndex;
-	u32	edca_param;
-	u64	cur_tx_bytes = 0;
-	u64	cur_rx_bytes = 0;
-	u8	bbtchange = false;
-	struct hal_data_8188e *pHalData = &Adapter->haldata;
-	struct xmit_priv		*pxmitpriv = &Adapter->xmitpriv;
-	struct recv_priv		*precvpriv = &Adapter->recvpriv;
-	struct registry_priv	*pregpriv = &Adapter->registrypriv;
-	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
-	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-
-	if (!(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO))
-		return;
-
-	if (pregpriv->wifi_spec == 1)
-		goto dm_CheckEdcaTurbo_EXIT;
-
-	if (pmlmeinfo->assoc_AP_vendor >=  HT_IOT_PEER_MAX)
-		goto dm_CheckEdcaTurbo_EXIT;
-
-	/*  Check if the status needs to be changed. */
-	if ((bbtchange) || (!precvpriv->bIsAnyNonBEPkts)) {
-		cur_tx_bytes = pxmitpriv->tx_bytes - pxmitpriv->last_tx_bytes;
-		cur_rx_bytes = precvpriv->rx_bytes - precvpriv->last_rx_bytes;
-
-		/* traffic, TX or RX */
-		if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_RALINK) ||
-		    (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS)) {
-			if (cur_tx_bytes > (cur_rx_bytes << 2)) {
-				/*  Uplink TP is present. */
-				trafficIndex = UP_LINK;
-			} else {
-				/*  Balance TP is present. */
-				trafficIndex = DOWN_LINK;
-			}
-		} else {
-			if (cur_rx_bytes > (cur_tx_bytes << 2)) {
-				/*  Downlink TP is present. */
-				trafficIndex = DOWN_LINK;
-			} else {
-				/*  Balance TP is present. */
-				trafficIndex = UP_LINK;
-			}
-		}
-
-		if ((pDM_Odm->DM_EDCA_Table.prv_traffic_idx != trafficIndex) || (!pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA)) {
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_CISCO) && (pmlmeext->cur_wireless_mode & WIRELESS_11_24N))
-				edca_param = EDCAParam[pmlmeinfo->assoc_AP_vendor][trafficIndex];
-			else
-				edca_param = EDCAParam[HT_IOT_PEER_UNKNOWN][trafficIndex];
-
-			rtw_write32(Adapter, REG_EDCA_BE_PARAM, edca_param);
-
-			pDM_Odm->DM_EDCA_Table.prv_traffic_idx = trafficIndex;
-		}
-
-		pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = true;
-	} else {
-		/*  Turn Off EDCA turbo here. */
-		/*  Restore original EDCA according to the declaration of AP. */
-		 if (pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA) {
-			rtw_write32(Adapter, REG_EDCA_BE_PARAM, pHalData->AcParam_BE);
-			pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
-		}
-	}
-
-dm_CheckEdcaTurbo_EXIT:
-	/*  Set variables for next time. */
-	precvpriv->bIsAnyNonBEPkts = false;
-	pxmitpriv->last_tx_bytes = pxmitpriv->tx_bytes;
-	precvpriv->last_rx_bytes = precvpriv->rx_bytes;
-}
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index d6046cf9645a..994f5c883979 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -31,6 +31,4 @@
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
 
-void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-
 #endif	/*  __ODM_PRECOMP_H__ */
-- 
2.34.1


Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C9C2C82
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 16:35:21 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v17so27410452wrv.9
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=megC4K92vDEP0q7uSIzXOLfeRzgx84LBgrmcKglZkqM=;
        b=WZKBfr35FkGbA8gTfrta42E2B6B4korGTJhCh48vS7CUOclzAcOu/Rt20jWoLiZRDn
         Z0NDg7T0pCUJVG5kqt2stE19qOIhfggoPKgYmex+h10f1n+S/Qja7V234gcRyMQVwC+G
         p/jKo0qKd/OwuKvNk7fRLE+R3vbQiXKYhmW5ScLMzQmR5TD8UhFb8ElBQ9hSUdAo8Mm6
         ZPFFbRe57qyTH6N60tpUNj/PpAFFeWVG/RKKItfo7N6ZuNj+01JB+cTUcctLkyhjVySD
         nSVg/WogO7JBeFqSqxFXkLzG6Efew2y4RedeQ7/wVy5LwFfXTOlsrxGioOak5XVNAf/x
         5STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=megC4K92vDEP0q7uSIzXOLfeRzgx84LBgrmcKglZkqM=;
        b=rm3ADvwaL1k2xa1ADM0hU2ogGBbmxJXgh5nJ5S69MUqCSrFkeoxwV39ZkFASaPkEol
         1Dzpx+XF65yQlvZ1tNiTjfsyAQzMYTbjWKOhk0drmUmc0ytp17h+tsbP2IhbxZzQhid2
         uiNsjiS8vFLPFT6E7wsRs5I/Od//8SvEag66DeAAHD1LsZmNLXnRYn8JEqeIgES7cj/R
         vU+oyYyHL6vRgmkPTKlccaxRAkG0UKJoRReYEV35UVCBYsjjYW6cjMP1ZFM23P+97djc
         D5vSA1aYdxLa8eqTYlItNfZl/9+GWsFxYMmnv0/ZB8hmc+PkLC+zBhNVb6PLxSUNEeEE
         hi2Q==
X-Gm-Message-State: AOAM530WxOOe777IP3oDZ9GXJFghlMpH8+q7Ms+ft1X4k5HcQMQa/lzD
	PMjUPXyBgS59hH9YiUrjKx0=
X-Google-Smtp-Source: ABdhPJwzXqNx3nbM67b2OK/b9PkKEJXTbb9jUlYkb/75GJEpPdGNT8zZBhmbFNWQxpWEFZxi/eIx7g==
X-Received: by 2002:adf:a1d3:: with SMTP id v19mr16170194wrv.268.1634315720367;
        Fri, 15 Oct 2021 09:35:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id c17sm5489593wrq.4.2021.10.15.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:35:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/7] staging: r8188eu: remove ODM_CmnInfoPtrArrayHook()
Date: Fri, 15 Oct 2021 18:35:07 +0200
Message-Id: <20211015163507.9091-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015163507.9091-1-straube.linux@gmail.com>
References: <20211015163507.9091-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ODM_CmnInfoPtrArrayHook() there is only the case
ODM_CMNINFO_STA_STATUS and the function is called only with this value.
Remove ODM_CmnInfoPtrArrayHook() and fix the three places where it is
called.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 15 ---------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c       |  2 +-
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  5 +++--
 drivers/staging/r8188eu/include/odm.h           | 10 ----------
 4 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index a2cbe727f6e0..0987ff3e382a 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -292,21 +292,6 @@ void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def Cmn
 	}
 }
 
-void ODM_CmnInfoPtrArrayHook(struct odm_dm_struct *pDM_Odm, enum odm_common_info_def CmnInfo, u16 Index, void *pValue)
-{
-	/*  Hook call by reference pointer. */
-	switch	(CmnInfo) {
-	/*  Dynamic call by reference pointer. */
-	case	ODM_CMNINFO_STA_STATUS:
-		pDM_Odm->pODM_StaInfo[Index] = (struct sta_info *)pValue;
-		break;
-	/* To remove the compiler warning, must add an empty default statement to handle the other values. */
-	default:
-		/* do nothing */
-		break;
-	}
-}
-
 /*  Update Band/CHannel/.. The values are dynamic but non-per-packet. */
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_dm.c b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
index 1ca24a507d6d..f1a1015eedfb 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_dm.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_dm.c
@@ -90,7 +90,7 @@ static void Update_ODM_ComInfo_88E(struct adapter *Adapter)
 	ODM_CmnInfoInit(dm_odm, ODM_CMNINFO_RF_ANTENNA_TYPE, hal_data->TRxAntDivType);
 
 	for (i = 0; i < NUM_STA; i++)
-		ODM_CmnInfoPtrArrayHook(dm_odm, ODM_CMNINFO_STA_STATUS, i, NULL);
+		dm_odm->pODM_StaInfo[i] = NULL;
 }
 
 void rtl8188e_InitHalDm(struct adapter *Adapter)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index dd8d6b4a9d48..8c00f2dd67da 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1671,13 +1671,14 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVaria
 	case HAL_ODM_STA_INFO:
 		{
 			struct sta_info *psta = (struct sta_info *)pValue1;
+
 			if (bSet) {
 				DBG_88E("### Set STA_(%d) info\n", psta->mac_id);
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, psta);
+				podmpriv->pODM_StaInfo[psta->mac_id] = psta;
 				ODM_RAInfo_Init(podmpriv, psta->mac_id);
 			} else {
 				DBG_88E("### Clean STA_(%d) info\n", psta->mac_id);
-				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
+				podmpriv->pODM_StaInfo[psta->mac_id] = NULL;
 		       }
 		}
 		break;
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 6cbf64df9be7..841603b341bd 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -305,12 +305,6 @@ enum odm_common_info_def {
 	ODM_CMNINFO_BT_BUSY,			/* Check Bt is using or not */
 	ODM_CMNINFO_BT_DISABLE_EDCA,
 /* CALL BY VALUE-------------*/
-
-	/*  Dynamic ptr array hook itms. */
-	ODM_CMNINFO_STA_STATUS,
-	ODM_CMNINFO_PHY_STATUS,
-	ODM_CMNINFO_MAC_STATUS,
-	ODM_CMNINFO_MAX,
 };
 
 /*  2011/10/20 MH Define ODM support ability.  ODM_CMNINFO_ABILITY */
@@ -882,10 +876,6 @@ void ODM_CmnInfoInit(struct odm_dm_struct *pDM_Odm,
 void ODM_CmnInfoHook(struct odm_dm_struct *pDM_Odm,
 		     enum odm_common_info_def CmnInfo, void *pValue);
 
-void ODM_CmnInfoPtrArrayHook(struct odm_dm_struct *pDM_Odm,
-			     enum odm_common_info_def CmnInfo,
-			     u16 Index, void *pValue);
-
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 
 #endif
-- 
2.33.0


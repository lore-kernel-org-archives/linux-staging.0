Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C53FC9
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g16so164765wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MdVxaNtvGER8omnGE7pPYp9QywtUqFSyvheRb5loYHk=;
        b=cYtAf/zFXKrW/Xkrd/8L1tQXJUXCXh2/7veJwgqqACknRANvsWbqtzhYMz0gAnUkNi
         tiQzOdXbxRIMsUmVawztc9Wg3y0VsAavXWvMUbf41JhnAhQ7NgR3BO1+gbnfI1k7kWO3
         Y4OQNQ8bWOTfar7WLaRMGOgTU0+TULKgFTFHZOS6/QwVzv7+vAbqchuhUEI+WEjAr1nG
         zy2AVHpxhQ5PTUnJIgN0rT1W+frvywAzSyGH5tkHHY17PWIF3uplraWYTf5WT0MPEAB0
         KmVseIeDTAyBOaiMnR1NmeZCdtRnrXBgF2uj/hUZcB9h5iHweWgKQYuYW8DCJZgntl17
         ITIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MdVxaNtvGER8omnGE7pPYp9QywtUqFSyvheRb5loYHk=;
        b=66bDMYdh31hhBPOvglV0yqpmZx2pE12zMn5cUMVUL3WbGamYbbVwDJNdXp6kauYGss
         +3px9SOTHZ9e6NNJOKCAfKPHVDf7pXqH/AIOGzvb0nuj527+XUwiq5eLdxeRciqORoO0
         I3LvSo+bAfsK4fuQbuSbJQCMb3Gk3CbABo+TPfrbAjaWC2CHjdOBUuTdjVQdNj73ojsq
         cIzccDdYTPN1kCOsDXNgPILg/v+nQphnhaRW3djt1VDf6dxgax3NFbkY8UqJVuSjYjPA
         4stQhHqPl6co3zgwj9JhPFAt+pkES08aM97yPNZJSozrIipq+EDdjRQBmpFEZPZruzi/
         FfCg==
X-Gm-Message-State: AOAM530JnWwdMNx5iMCjAk6lBoG+OYAOaxSHoR1OLz8kCsADI/KfVwAz
	i7qqJGlRMUqhQg5HWHxKtII=
X-Google-Smtp-Source: ABdhPJzNh2rY81R+jcDnUOjFGii6pcq8EzqDLmi6Yruz93Hpu1/j201QsFKjgeu2Mqzkgc8zt8II6A==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr36111668wrw.224.1632253644046;
        Tue, 21 Sep 2021 12:47:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/8] staging: r8188eu: remove odm_DynamicTxPower()
Date: Tue, 21 Sep 2021 21:46:53 +0200
Message-Id: <20210921194658.10654-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_DynamicTxPower() does nothing, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 27 -------------------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index e39c79db7667..c691a6a90fa9 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -216,7 +216,6 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 
 	ODM_TXPowerTrackingCheck(pDM_Odm);
 	odm_EdcaTurboCheck(pDM_Odm);
-	odm_DynamicTxPower(pDM_Odm);
 
 	odm_dtc(pDM_Odm);
 }
@@ -1189,32 +1188,6 @@ void odm_DynamicTxPowerInit(struct odm_dm_struct *pDM_Odm)
 	pdmpriv->DynamicTxHighPowerLvl = TxHighPwrLevel_Normal;
 }
 
-void odm_DynamicTxPower(struct odm_dm_struct *pDM_Odm)
-{
-	/*  For AP/ADSL use struct rtl8192cd_priv * */
-	/*  For CE/NIC use struct adapter * */
-
-	if (!(pDM_Odm->SupportAbility & ODM_BB_DYNAMIC_TXPWR))
-		return;
-
-	/*  2012/01/12 MH According to Luke's suggestion, only high power will support the feature. */
-	if (!pDM_Odm->ExtPA)
-		return;
-
-	/*  2011/09/29 MH In HW integration first stage, we provide 4 different handle to operate */
-	/*  at the same time. In the stage2/3, we need to prive universal interface and merge all */
-	/*  HW dynamic mechanism. */
-	switch	(pDM_Odm->SupportPlatform) {
-	case	ODM_MP:
-	case	ODM_CE:
-		break;
-	case	ODM_AP:
-		break;
-	case	ODM_ADSL:
-		break;
-	}
-}
-
 /* 3============================================================ */
 /* 3 RSSI Monitor */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 1d6e93b13d7d..43f8e6849a45 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -49,7 +49,6 @@ void odm_RefreshRateAdaptiveMaskMP(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSaving(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivChkAntSwitch(struct odm_dm_struct *pDM_Odm, u8 Step);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_DynamicTxPower(struct odm_dm_struct *pDM_Odm);
 void odm_CommonInfoSelfInit(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivInit(struct odm_dm_struct *pDM_Odm);
 void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0


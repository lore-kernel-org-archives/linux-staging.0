Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D372CA2
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso12502810wmc.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xPXFKP24S9HYo1oAtd+5wVylGqR6XS7SREVC37I7fxg=;
        b=CzpJqn9inym1g/r0W1e7drS86koAaQJhLRUaoknTF3+ZUImya/gstwKYX5v7T+k2tF
         toCNVpzn05+/8cbFAxKkY/qODjnCovhmM6IQJ7UKY+qMHAtnrZ2dTTc3JFnQSBpiEzSw
         4w2kgVyhXZVAZU98kalCHMdpKCreZwXY6BdNpDnR3rUBQVemV2QMqwcVm1fG1MAKRTeX
         ZQs4Y0SEdtC8eIbYzcEUO5tAA/Q4fLiy8D/rInVlzd4gyBHmKHkSBzCcLc/x627bN6pX
         +iHKgekCK5gIuRXSt2OWljKJBB0UWVqHK2v5diS4yq8fpK4+n1XwToih6KUnHqt2nYg8
         r8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xPXFKP24S9HYo1oAtd+5wVylGqR6XS7SREVC37I7fxg=;
        b=s9it+NJH8DVnJfLSg1pkDKefmNVmoZvaMMnjS9IGlkhVoc/IrdiQ1MZYNdR6ytKnvP
         6pj28hmO6MZrDch7JxciOe/0BLcs73u2VlRZwKyRCb26i3FMPsKMWlzySVLxHCNSddWE
         E0A8QIVAwgvLt4Lmzj/vkpkVNUbg21lyPfERCj3QAssjbftIBFhiYpt0VpWN03zcB4ah
         rW4VL3i0Yiwy/BQQUlkxFkhOTCMDN18ltKRQsPZkMV0e8Hr3WINegnxmHShuX3nq5Ays
         Uq4cFSMjdqi+7BLKDb9xmMoFxXfEgtdbVt+QeYwBxJXy7orVXrFydEKk/bnV8Sptet5i
         qnYg==
X-Gm-Message-State: AOAM530E6FKuw78N8BsfHhQsn/7VdTzhxzeiB+GpyKnJH1bCuyadn2FS
	BE5h31KqJ3/pqYvB4GBstB0=
X-Google-Smtp-Source: ABdhPJzI3i5JfS++gGs1Zo16s0kQtSX0HirvYlpXsnGPekLyVUn8B8npRhEJIH2NoGW9I8G2NiexOA==
X-Received: by 2002:a7b:c4d3:: with SMTP id g19mr23270918wmk.46.1640811101618;
        Wed, 29 Dec 2021 12:51:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:41 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 21/32] staging: r8188eu: make odm_DynamicBBPowerSavingInit() static
Date: Wed, 29 Dec 2021 21:50:57 +0100
Message-Id: <20211229205108.26373-22-straube.linux@gmail.com>
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

Function odm_DynamicBBPowerSavingInit() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 21 ++++++++-----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 41e954ec4e86..d933d60a77ac 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -364,6 +364,15 @@ static void odm_RefreshRateAdaptiveMask(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
+static void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm)
+{
+	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
+
+	pDM_PSTable->pre_rf_state = RF_MAX;
+	pDM_PSTable->cur_rf_state = RF_MAX;
+	pDM_PSTable->initialize = 0;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -599,18 +608,6 @@ void ODM_Write_CCK_CCA_Thres(struct odm_dm_struct *pDM_Odm, u8 CurCCK_CCAThres)
 	pDM_DigTable->CurCCK_CCAThres = CurCCK_CCAThres;
 }
 
-/* 3============================================================ */
-/* 3 BB Power Save */
-/* 3============================================================ */
-void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm)
-{
-	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
-
-	pDM_PSTable->pre_rf_state = RF_MAX;
-	pDM_PSTable->cur_rf_state = RF_MAX;
-	pDM_PSTable->initialize = 0;
-}
-
 void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal)
 {
 	struct rtl_ps *pDM_PSTable = &pDM_Odm->DM_PSTable;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index c2287d00aa60..259e0de93144 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -31,7 +31,6 @@
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
 
-void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1


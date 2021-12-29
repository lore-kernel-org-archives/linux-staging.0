Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D76173
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:46 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso12502851wmc.3
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qL5JcVFZ/8xE2kVZ4Z0vaz4/wps1vEerBBiGAuD/u18=;
        b=Nj6zx0EG+j9B6J72poTAUa4Wi1QDx0Kv0LATza2/OvbOdBsiPl7H/i83yojb+dEO4s
         LcmAFhmp99QpgxEhnvHHZqyrEWSfL+1UcZExXv8SPEirMWkyWx/Xjy1R3aXX6cR1WU/P
         /L5zJPsu5rYWnd0HNm9c0fuAVQFIlFAIHSQtq6572f5e+qOc7QU0Fk4u6DAli7K8qUz6
         Q3E/YBpIs39HXiKK7hkPVfBfcp5NhuCUvJlq+uV5TVMGhokAz3Mzi0zZ9oITMGkXTJ6l
         XjE0jgzlJ2vCbVTkGJkCYBDJhYrTsyNICxX89nRmeHDzcOCWJNhPiu1cFewUfimmehFk
         Mzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qL5JcVFZ/8xE2kVZ4Z0vaz4/wps1vEerBBiGAuD/u18=;
        b=nLvsBT+K7w1GRI0bQVrUDoUX6zoGxnYwp55cwEe1qSpHkkEl53JqZfFeLLD3Qf7H1c
         m4wEi7fIF+VlFtmkB2UvzzOG/zmHlnRM0DedY4MDZqJ/yGWaHo7Dwu/vpIqM2N6mqQ8I
         +4L8v+kP09GteQh5pPGZQnGzcXhW6P8rLaPXp2dc+TTBPQzZxkje73egInYBj5opclF5
         3ltC/C61OudEjL+V4Xw6krwhAwP1kVTxBSFNKhjQSUg+BI/2nAEYqTeh2iDFJu8x2uKL
         lcq2Mc1h8OHIv1SflCnWZ288SWy9x6LfqNsosE8mpTtlCEZ3aAf3PmX+cqibRg3HpeoK
         XkWg==
X-Gm-Message-State: AOAM530mb66vj9GyLUFw7g1WHwYOw4pMIHBtBTtwO7hYIP7hEkJnAdCN
	pYaG02Ls4h1/lj3L5AtWIgs=
X-Google-Smtp-Source: ABdhPJzjYWh93s2TXHpzHZ7R+sBG5Hrit9ke3BvXmXDXbY2EGTFJzxFKWW0S5pu8mr6hA9eyJy0Pmw==
X-Received: by 2002:a05:600c:9:: with SMTP id g9mr23092576wmc.127.1640811105007;
        Wed, 29 Dec 2021 12:51:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:44 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 26/32] staging: r8188eu: make odm_TXPowerTrackingThermalMeterInit() static
Date: Wed, 29 Dec 2021 21:51:02 +0100
Message-Id: <20211229205108.26373-27-straube.linux@gmail.com>
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

Function odm_TXPowerTrackingThermalMeterInit() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 20 ++++++++-----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index f2318ec812be..fc402824bed0 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -528,6 +528,14 @@ static void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_RSSI_MIN, pdmpriv->MinUndecoratedPWDBForDM);
 }
 
+static void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
+{
+	pDM_Odm->RFCalibrateInfo.bTXPowerTracking = true;
+	pDM_Odm->RFCalibrateInfo.TXPowercount = 0;
+	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = false;
+	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -825,18 +833,6 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
 	return false;
 }
 
-/* 3============================================================ */
-/* 3 Tx Power Tracking */
-/* 3============================================================ */
-
-void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
-{
-	pDM_Odm->RFCalibrateInfo.bTXPowerTracking = true;
-	pDM_Odm->RFCalibrateInfo.TXPowercount = 0;
-	pDM_Odm->RFCalibrateInfo.bTXPowerTrackingInit = false;
-	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
-}
-
 void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 92465e71b814..7150228dc8d7 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -33,7 +33,6 @@
 
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm);
 void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm);
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
 
-- 
2.34.1


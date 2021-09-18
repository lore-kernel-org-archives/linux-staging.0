Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB63FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f62-20020a1c1f41000000b0030b42643f72so3466273wmf.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgZ+hqLf0FtG7Wd9/tJWqhkp5dALrXXdBCxii4LerqQ=;
        b=Ihr1l87bWK7MTYjEuqozYrrc/Ll0WnFH4v4CZE/z23N28tp4uNtHznT/EvAUO6hpxk
         XiNwDvGP/AAjYwHPpyzZIOZgC3vWuODmimvaD1GBhMTwUsnPsa8InlM4Ko7cZewBu6MG
         ukPql6HNm/xT9sZFUzTyrFNgzP4qah+KpSRMM73rQKgVpa9O3mt6bBoO3ZT2axcBWCrH
         8QbdmSpKg03uQFwUyolSwYSYD9Uaptj5OIu1aL/++RBzVxgn3Mei1FFijFSzQ2zNn88F
         UlIcYtbJLBd4a64ob8RArzKZfBJpoeNUGBmSzjdsdW7UTZumqLK4leUcdn2vWqM4oyz8
         qa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgZ+hqLf0FtG7Wd9/tJWqhkp5dALrXXdBCxii4LerqQ=;
        b=jAsc6upA6XDqUbiT2pSQHmBsRjRFDysRDDsKbdeZDn6LDICbDS6hMWMVUh8Gopc5Ri
         Xu+EGDaEJlI827lENOCWbXNNUhG+/KfiiGMT0mxpMQQWl0nD14zMyK41XpHSZ0NwNCw6
         c3siWpjzRYfDh1Wc/75oRN9FWstO+0vagU9E/+Jzwg6OaHEUAi3bIK+H2DGZv9Sx8Hvr
         lrys/qvPDMciaNMf3fEg3lHthgoEqAEtH6mAmcyQDqhXyYUkaKdQmulNMfAPKwWwcs+u
         9+Ahm3Qalbef4JIzEz4xCWNP0NVRHENO+UawfHTOPm/QFIrOKZlrt5Sp9BBtjq18l43D
         NRDw==
X-Gm-Message-State: AOAM533fziDhX0/kuVVaHopXMT8pG2xsdIjJ9syf6KowjMJmtMWs1zkm
	pmsUYKh7ATb3C/AEHyu2cbU=
X-Google-Smtp-Source: ABdhPJy3Mq31E43QAUlrzwCFGL2vG7YyoPCfwlgYjzuKJ4jwQ+0M4zIPVwYFiu2Xf9p3aP1IsNiKuQ==
X-Received: by 2002:a7b:cde8:: with SMTP id p8mr19211053wmj.178.1631957112062;
        Sat, 18 Sep 2021 02:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 09/12] staging: r8188eu: remove unnecessary if statements
Date: Sat, 18 Sep 2021 11:24:40 +0200
Message-Id: <20210918092443.8724-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) is always false and
(pDM_Odm->SupportICType & ODM_IC_11N_SERIES) is always true since
SupportICType is ODM_RTL8188E in this driver. Remove unnecessary
if statements that check for this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 39 +++++++++++++------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index cb27edf657d9..23ef08fc64cd 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -163,22 +163,18 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 	odm_DIGInit(pDM_Odm);
 	odm_RateAdaptiveMaskInit(pDM_Odm);
 
-	if (pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) {
-		;
-	} else if (pDM_Odm->SupportICType & ODM_IC_11N_SERIES) {
-		odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
-		odm_DynamicBBPowerSavingInit(pDM_Odm);
-		odm_DynamicTxPowerInit(pDM_Odm);
-		odm_TXPowerTrackingInit(pDM_Odm);
-		ODM_EdcaTurboInit(pDM_Odm);
-		ODM_RAInfo_Init_all(pDM_Odm);
-		if ((pDM_Odm->AntDivType == CG_TRX_HW_ANTDIV)	||
-		    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV) ||
-		    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
-			odm_InitHybridAntDiv(pDM_Odm);
-		else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
-			odm_SwAntDivInit(pDM_Odm);
-	}
+	odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
+	odm_DynamicBBPowerSavingInit(pDM_Odm);
+	odm_DynamicTxPowerInit(pDM_Odm);
+	odm_TXPowerTrackingInit(pDM_Odm);
+	ODM_EdcaTurboInit(pDM_Odm);
+	ODM_RAInfo_Init_all(pDM_Odm);
+	if ((pDM_Odm->AntDivType == CG_TRX_HW_ANTDIV)	||
+	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV) ||
+	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
+		odm_InitHybridAntDiv(pDM_Odm);
+	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
+		odm_SwAntDivInit(pDM_Odm);
 }
 
 /*  2011/09/20 MH This is the entry pointer for all team to execute HW out source DM. */
@@ -218,13 +214,10 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
 		odm_SwAntDivChkAntSwitch(pDM_Odm, SWAW_STEP_PEAK);
 
-	if (pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) {
-		;
-	} else if (pDM_Odm->SupportICType & ODM_IC_11N_SERIES) {
-		ODM_TXPowerTrackingCheck(pDM_Odm);
-		odm_EdcaTurboCheck(pDM_Odm);
-		odm_DynamicTxPower(pDM_Odm);
-	}
+	ODM_TXPowerTrackingCheck(pDM_Odm);
+	odm_EdcaTurboCheck(pDM_Odm);
+	odm_DynamicTxPower(pDM_Odm);
+
 	odm_dtc(pDM_Odm);
 }
 
-- 
2.33.0


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843D3FCB
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id j134-20020a1c238c000000b0030b32367649so4752937wmj.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=bxQG6KfnTvdmoVTlN+kbBu04D0d2U9T3rPG64svVwmt+kdStWkhVMJ1N+fy9geJdbU
         Jo9Ucnn1dCuL6oiWioK022koYfJG5WrMbURp+vDvqmi57ZZRbv+gGsabGQ6Oe36X3fkf
         ZNGoKm0J2QlcZnuSVp/SkG4yDiSSaFWsFVRcUI+AH/c+HGZogB2vI0zo4PiR9KEa+sZc
         FkBh+I1qtbxr9YchGmbd/4Mqs3PZ4Q23au93LH/7NRtxv/5Jau2KvDIBoQ6fmNi6cHEB
         j3aMI+of21PbbMXm3CarqoEdqORd/kDZ6IahxJbXKJRRN4I2QuLJnw8WL3oQvGgBnxsZ
         bXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=Awx5dVQ0VT+LpxgQXmP3UYzgSYjzcuYK1q95lCaqK3ArIrPhTGd5yiYKJwfZfj4T9r
         iSNUNCWSZqmGxZqZLVnGwZUzBPmJjLYY3+VNuDrn1seV6lNZqxsgu9gYT8Q20cwMYl8p
         IRYrJAjgW6K1M/Od9MXcbM2bIwWSTF5gte3wNBcnxXKQT9iVP7Pf92zvRwLlOzBKCWuE
         gAJJWkkgZ1pyJQFaYUXE1lkXuevcdBaMsZqhy8/GbkEmsD/VK4gwEMXxZwt0KnW7L3SL
         Xd3E8deuyAUJTtqcPU2BFvn8FtVChazzZPizXnUu4uiMkFRPIEvWUsH+7CeMIf8hgk02
         NM7Q==
X-Gm-Message-State: AOAM532L8p65xm6bE+AmjM7ud/DuAkX46xD/Giwp5TH9E9Y+/ua6x878
	v84UcnYJD86qmT7j5+NYcwc=
X-Google-Smtp-Source: ABdhPJw3DN2hlGMzCxa4fRaqx0jH7UojSO2RD8CUjnBPy6U8RahU6I0X3R3OO8ybAR2V3Csk4EqBXw==
X-Received: by 2002:a1c:7f89:: with SMTP id a131mr17116622wmd.31.1631921467059;
        Fri, 17 Sep 2021 16:31:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/12] staging: r8188eu: remove dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 01:30:40 +0200
Message-Id: <20210917233048.31677-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver SupportPlatform is ODM_CE, so code in the
"else if (pDM_Odm->SupportPlatform & (ODM_AP | ODM_ADSL))" is never
executed. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 34 -------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index d23e9296a10e..5f98c797c59a 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -460,21 +460,6 @@ void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
 		pDM_Odm->bOneEntryOnly = false;
 }
 
-static int getIGIForDiff(int value_IGI)
-{
-	#define ONERCCA_LOW_TH		0x30
-	#define ONERCCA_LOW_DIFF	8
-
-	if (value_IGI < ONERCCA_LOW_TH) {
-		if ((ONERCCA_LOW_TH - value_IGI) < ONERCCA_LOW_DIFF)
-			return ONERCCA_LOW_TH;
-		else
-			return value_IGI + ONERCCA_LOW_DIFF;
-	} else {
-		return value_IGI;
-	}
-}
-
 void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
@@ -484,26 +469,7 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
 			if (pDM_Odm->SupportICType != ODM_RTL8188E)
 				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-		} else if (pDM_Odm->SupportPlatform & (ODM_AP | ODM_ADSL)) {
-			switch (*pDM_Odm->pOnePathCCA) {
-			case ODM_CCA_2R:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				break;
-			case ODM_CCA_1R_A:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), getIGIForDiff(CurrentIGI));
-				break;
-			case ODM_CCA_1R_B:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), getIGIForDiff(CurrentIGI));
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				break;
-			}
 		}
-		/* pDM_DigTable->PreIGValue = pDM_DigTable->CurIGValue; */
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 /*  Add by Neil Chen to enable edcca to MP Platform */
-- 
2.33.0


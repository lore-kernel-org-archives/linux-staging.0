Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C33FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:29 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v22so38704751edd.11
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Zy5mhgewa9a0uZy3rtygxAsubHg3zkYkDDVaK9v8Os=;
        b=WXPmJnrJs/suE95UB3aE4tw+T2VCNnSdbzC/DY1wvxq+bQUZT4QOphh2OoORH5awTT
         37VTlINpJIFpZbZlzJz5snjmbezedvcdXCkztJd8xXzupNs78Wt27Cd+iMFpXM0Tt/Lg
         UFtJQW+35uXqrExaGTO5WHiFvAKQzHk+Mhe15f4d02w5g8QrRLWsWZhfl1SQxDZxk5V1
         p+alDvKPbZvzdptKGqTY4rh2KYckYEvGzR9jXV4J2DbDLnE7NpzOS1q/uFNsoczLUlsi
         GhigLzfrnWf/iOqTIYknIM2ef0YcpwtFU9aBiprQ1eblbF/hMxuy7p9k44RlcLrMoHP+
         7qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Zy5mhgewa9a0uZy3rtygxAsubHg3zkYkDDVaK9v8Os=;
        b=zebcHYGfdHSmLFm2OJFG4dFSo6qkA0SToTnDBMRkl7wYmRsV0tYpJ5x6Cejnbh2mUK
         VvLlXhgNlfhZvx3kiZKVbg7ohWgQMaZE3zP+5O41etcW5iS4DbHPD8X+voQErsUJsL2R
         ABjFj1qOB/fYoLeTXvQnSonfnCq8KMAcoQJ55q+hQUeEjX+h/IR9HRIrC66odzafXKOp
         lBZm6s5HlvFpL2QM13RxZE8XHT02M7+QmYCq4A8B4/LQzNivxMGASA925IeM8SSNT9Rb
         2nGbtfV6BG1Qj+/pS686IGcGECWENUQ703F/idQa5wznXrR2viiIYTeY86QaAbRmwFFi
         z5Kw==
X-Gm-Message-State: AOAM530cbmwBp0wfoYducBHRjmBljG4cx3iZo4R2azpY7WeD6TEehwGw
	po9iGhscH5sHO7rUBkt7THY=
X-Google-Smtp-Source: ABdhPJzlNVsMp8NF8X0PXuDpR5nW6lEsJary2k4xFKCQ/b4hVE6mUrpAVnd0VyT8cVmRf1Er7y+Q+Q==
X-Received: by 2002:a17:906:d798:: with SMTP id pj24mr18950637ejb.1.1631989168300;
        Sat, 18 Sep 2021 11:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 10/14] staging: r8188eu: remove dead code from odm.c
Date: Sat, 18 Sep 2021 20:19:00 +0200
Message-Id: <20210918181904.12000-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(pDM_Odm->SupportICType & ODM_IC_11N_SERIES) is true in this driver.
There is an if statement that checks this. Remove it and its never
executed else arm.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 140 ++++++++++++++----------------
 1 file changed, 63 insertions(+), 77 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 23ef08fc64cd..1a4c2e93f732 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -739,84 +739,70 @@ void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm)
 	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
 		return;
 
-	if (pDM_Odm->SupportICType & ODM_IC_11N_SERIES) {
-		/* hold ofdm counter */
-		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1); /* hold page C counter */
-		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1); /* hold page D counter */
-
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord);
-		FalseAlmCnt->Cnt_Fast_Fsync = (ret_value & 0xffff);
-		FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value & 0xffff0000) >> 16);
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE2_11N, bMaskDWord);
-		FalseAlmCnt->Cnt_OFDM_CCA = (ret_value & 0xffff);
-		FalseAlmCnt->Cnt_Parity_Fail = ((ret_value & 0xffff0000) >> 16);
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE3_11N, bMaskDWord);
-		FalseAlmCnt->Cnt_Rate_Illegal = (ret_value & 0xffff);
-		FalseAlmCnt->Cnt_Crc8_fail = ((ret_value & 0xffff0000) >> 16);
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE4_11N, bMaskDWord);
-		FalseAlmCnt->Cnt_Mcs_fail = (ret_value & 0xffff);
-
-		FalseAlmCnt->Cnt_Ofdm_fail = FalseAlmCnt->Cnt_Parity_Fail + FalseAlmCnt->Cnt_Rate_Illegal +
-					     FalseAlmCnt->Cnt_Crc8_fail + FalseAlmCnt->Cnt_Mcs_fail +
-					     FalseAlmCnt->Cnt_Fast_Fsync + FalseAlmCnt->Cnt_SB_Search_fail;
-
-		if (pDM_Odm->SupportICType == ODM_RTL8188E) {
-			ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_SC_CNT_11N, bMaskDWord);
-			FalseAlmCnt->Cnt_BW_LSC = (ret_value & 0xffff);
-			FalseAlmCnt->Cnt_BW_USC = ((ret_value & 0xffff0000) >> 16);
-		}
+	/* hold ofdm counter */
+	ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 1); /* hold page C counter */
+	ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 1); /* hold page D counter */
+
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE1_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Fast_Fsync = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_SB_Search_fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE2_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_OFDM_CCA = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Parity_Fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE3_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Rate_Illegal = (ret_value & 0xffff);
+	FalseAlmCnt->Cnt_Crc8_fail = ((ret_value & 0xffff0000) >> 16);
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_TYPE4_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_Mcs_fail = (ret_value & 0xffff);
+
+	FalseAlmCnt->Cnt_Ofdm_fail = FalseAlmCnt->Cnt_Parity_Fail + FalseAlmCnt->Cnt_Rate_Illegal +
+				     FalseAlmCnt->Cnt_Crc8_fail + FalseAlmCnt->Cnt_Mcs_fail +
+				     FalseAlmCnt->Cnt_Fast_Fsync + FalseAlmCnt->Cnt_SB_Search_fail;
 
-		/* hold cck counter */
-		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(12), 1);
-		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(14), 1);
-
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_FA_LSB_11N, bMaskByte0);
-		FalseAlmCnt->Cnt_Cck_fail = ret_value;
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_FA_MSB_11N, bMaskByte3);
-		FalseAlmCnt->Cnt_Cck_fail +=  (ret_value & 0xff) << 8;
-
-		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_CCA_CNT_11N, bMaskDWord);
-		FalseAlmCnt->Cnt_CCK_CCA = ((ret_value & 0xFF) << 8) | ((ret_value & 0xFF00) >> 8);
-
-		FalseAlmCnt->Cnt_all = (FalseAlmCnt->Cnt_Fast_Fsync +
-					FalseAlmCnt->Cnt_SB_Search_fail +
-					FalseAlmCnt->Cnt_Parity_Fail +
-					FalseAlmCnt->Cnt_Rate_Illegal +
-					FalseAlmCnt->Cnt_Crc8_fail +
-					FalseAlmCnt->Cnt_Mcs_fail +
-					FalseAlmCnt->Cnt_Cck_fail);
-
-		FalseAlmCnt->Cnt_CCA_all = FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
-
-		if (pDM_Odm->SupportICType >= ODM_RTL8723A) {
-			/* reset false alarm counter registers */
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTC_11N, BIT(31), 1);
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTC_11N, BIT(31), 0);
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(27), 1);
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(27), 0);
-			/* update ofdm counter */
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 0); /* update page C counter */
-			ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 0); /* update page D counter */
-
-			/* reset CCK CCA counter */
-			ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(13) | BIT(12), 0);
-			ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(13) | BIT(12), 2);
-			/* reset CCK FA counter */
-			ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(15) | BIT(14), 0);
-			ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(15) | BIT(14), 2);
-		}
-	} else { /* FOR ODM_IC_11AC_SERIES */
-		/* read OFDM FA counter */
-		FalseAlmCnt->Cnt_Ofdm_fail = ODM_GetBBReg(pDM_Odm, ODM_REG_OFDM_FA_11AC, bMaskLWord);
-		FalseAlmCnt->Cnt_Cck_fail = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_FA_11AC, bMaskLWord);
-		FalseAlmCnt->Cnt_all = FalseAlmCnt->Cnt_Ofdm_fail + FalseAlmCnt->Cnt_Cck_fail;
-
-		/*  reset OFDM FA coutner */
-		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RST_11AC, BIT(17), 1);
-		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RST_11AC, BIT(17), 0);
-		/*  reset CCK FA counter */
-		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11AC, BIT(15), 0);
-		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11AC, BIT(15), 1);
+	if (pDM_Odm->SupportICType == ODM_RTL8188E) {
+		ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_SC_CNT_11N, bMaskDWord);
+		FalseAlmCnt->Cnt_BW_LSC = (ret_value & 0xffff);
+		FalseAlmCnt->Cnt_BW_USC = ((ret_value & 0xffff0000) >> 16);
+	}
+
+	/* hold cck counter */
+	ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(12), 1);
+	ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(14), 1);
+
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_FA_LSB_11N, bMaskByte0);
+	FalseAlmCnt->Cnt_Cck_fail = ret_value;
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_FA_MSB_11N, bMaskByte3);
+	FalseAlmCnt->Cnt_Cck_fail +=  (ret_value & 0xff) << 8;
+
+	ret_value = ODM_GetBBReg(pDM_Odm, ODM_REG_CCK_CCA_CNT_11N, bMaskDWord);
+	FalseAlmCnt->Cnt_CCK_CCA = ((ret_value & 0xFF) << 8) | ((ret_value & 0xFF00) >> 8);
+
+	FalseAlmCnt->Cnt_all = (FalseAlmCnt->Cnt_Fast_Fsync +
+				FalseAlmCnt->Cnt_SB_Search_fail +
+				FalseAlmCnt->Cnt_Parity_Fail +
+				FalseAlmCnt->Cnt_Rate_Illegal +
+				FalseAlmCnt->Cnt_Crc8_fail +
+				FalseAlmCnt->Cnt_Mcs_fail +
+				FalseAlmCnt->Cnt_Cck_fail);
+
+	FalseAlmCnt->Cnt_CCA_all = FalseAlmCnt->Cnt_OFDM_CCA + FalseAlmCnt->Cnt_CCK_CCA;
+
+	if (pDM_Odm->SupportICType >= ODM_RTL8723A) {
+		/* reset false alarm counter registers */
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTC_11N, BIT(31), 1);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTC_11N, BIT(31), 0);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(27), 1);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(27), 0);
+		/* update ofdm counter */
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_HOLDC_11N, BIT(31), 0); /* update page C counter */
+		ODM_SetBBReg(pDM_Odm, ODM_REG_OFDM_FA_RSTD_11N, BIT(31), 0); /* update page D counter */
+
+		/* reset CCK CCA counter */
+		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(13) | BIT(12), 0);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(13) | BIT(12), 2);
+		/* reset CCK FA counter */
+		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(15) | BIT(14), 0);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_CCK_FA_RST_11N, BIT(15) | BIT(14), 2);
 	}
 }
 
-- 
2.33.0


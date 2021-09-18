Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F443FCC
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:14 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z2so61085wmc.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Zy5mhgewa9a0uZy3rtygxAsubHg3zkYkDDVaK9v8Os=;
        b=WaToek/ZyRp/nPWh4ixxXxfttZfNAY7xm4z92mLuPv7dCnCsatp5HxbDlJMkIMjIuj
         r4yGjHO5jqsNBQtYNrmL5HmA8LjH9FCK07dorZmonDs5oDwZ+FO0VUzRaNT6Ey9T340M
         tZN2+q9GEMXR7jWOLIvBEmCNUulJzxknh9NrLdCnK0eMYl0L8X7m8yPBfZfc9OeL3TyX
         8eEuxt/ucMLLq7HC/WaJNAD88LZdb3ZB7cEZwqavk2IB3fujBgxmMPAh9PjrsF/MYYgR
         Uo10TfKGFWcUGrsg6DOAuvRhaZHc75agdcN64eZkweZLgsrz3xjyu5IFCgUcw0vq+wtV
         mCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Zy5mhgewa9a0uZy3rtygxAsubHg3zkYkDDVaK9v8Os=;
        b=NWIjjr87dxLHAVGXIiWUoTLmbEhrCk2r0jastuyKqKfgTLD/4Q5oc1ttbpqRtz9CEG
         lR/JnkebN/ObSElmEPWX+yiegH3S8DEkqFCBZpNs/yP38+f0Q1HVHKwYkMQO623aEikO
         1oT5+uEyU8U1TAC+LJx8UgdIHi/H8R9CXdVEoLiZJZLbjJxmN1cYTWSPGJhMadhKL5a+
         aziijYFrXpOPaPVqx/rjQfCbuKzpUW57vTINcUgYsyFhHXBtGIlW5x+cy4D5rFwsNzVG
         tMKSVnp/s7r0QXDNvceJrs3r093xzMy/N/xnusm0yPoM3hOEDGP+3yKNiKuviCl2aIyv
         HCsw==
X-Gm-Message-State: AOAM530IiSrvSH1jnR4b75e76h2qGbZBTMFkRPYTLlwV1wrsHH/aPDp7
	2FoTK+t1odXsP4aLkERy1BA=
X-Google-Smtp-Source: ABdhPJzISGnJqCWUjVXjvcEH+hMpvbMFR3lfVfEaM6FG59XmFSR05VJhl3kqKuGJvblRl7MCK5AxrA==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr19358267wmi.143.1631957112887;
        Sat, 18 Sep 2021 02:25:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 10/12] staging: r8188eu: remove dead code from odm.c
Date: Sat, 18 Sep 2021 11:24:41 +0200
Message-Id: <20210918092443.8724-11-straube.linux@gmail.com>
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


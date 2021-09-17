Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0B3FCC
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 08:06:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so9268257wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGibByFFKAnmoZ4Tx8w/BzTiNbMgE9jWPqkMBctkewA=;
        b=i3T5XrSJMNe6np1XMZiq2RLr/c0jTlnT6vhAM8Z+bY7EiVNxh8BvNdwol+blpiMn36
         090gd13ZSRHY5oo7fhrl2THk73IBSSbJ3FEhKeuMKM906rHIEE3Z3sdYSL5dVVRjwRxz
         /xzrNFMYDG27iydVZdoVjiImkq9KATJwVhFw4dAsLpdvgGqlW+WwvxWkcREqmrlInsh8
         pPZr4MjAoMpAC3o7iMXGF8Dw95Xf4RBO1I6nZfypOseQrh+2IBw6Y9EG/WFUhQDF18+J
         3bBh9XNM45auFTkUpBP+6inzlVR45zt8rG+Asb8ryvRjaiSIwVlOyITc9B+h4CIJi+qf
         NicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGibByFFKAnmoZ4Tx8w/BzTiNbMgE9jWPqkMBctkewA=;
        b=YbL0S6mAzw9nKT+68SuCQnOkqsUBAnlc+nmNoYem1LW/hubaGxOk31aaR+ZRpxQMre
         Oo1XqhAWq22+7vtOzVFakC6e5PJjFZ2478VfdmauGChheyKGVETZGFAVveXjwkAu/3oB
         OZewrkRc5m6fSS0AjME6l5LUCqBsbrx4FUh9hUu8tZONo+V3U07RRDDj35lN9DuDtIr7
         qlpW7q2yMeGt+ZNm63gXq/RvhW1EcPDNJS/gUDJWH+xm9adHnyg7EStFHtnYmsndvQB/
         GjFpOMbQngbp2S02iTMkG7Sxgeb0qgginIlmm/TsoWN7BcTvFiM4RPB5+mSQVh5Hgnt4
         06tg==
X-Gm-Message-State: AOAM531YcZSq+ikqQZ1Uw0OtTYjgo43oEH40ZpatNFSYOogGl82X5g+R
	lG7X0Q2gx8tWD2iagVFCELB/TXH568NFzg==
X-Google-Smtp-Source: ABdhPJztQgGs+x+7ykrjLjj53lqpu0wmLpU32mXyoCsVHFdtxUtIrxEkhB6A/qEkVmb7k0zgPrqpRw==
X-Received: by 2002:a05:600c:b41:: with SMTP id k1mr14093514wmr.4.1631865994877;
        Fri, 17 Sep 2021 01:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id r129sm5690890wmr.7.2021.09.17.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 01:06:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove switches from phy_RF6052_Config_ParaFile()
Date: Fri, 17 Sep 2021 10:06:15 +0200
Message-Id: <20210917080615.25819-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917080615.25819-1-straube.linux@gmail.com>
References: <20210917080615.25819-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function phy_RF6052_Config_ParaFile() the variable eRFPath is always 0
and RF_PATH_A = 0 in this driver. So we can remove the 'switch (eRFPath)'
statements and just keep the code from the RF_PATH_A cases.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 39 +++----------------
 1 file changed, 6 insertions(+), 33 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 63e85052cc98..2f16c0966973 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -466,16 +466,8 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	pPhyReg = &pHalData->PHYRegDef[eRFPath];
 
 	/*----Store original RFENV control type----*/
-	switch (eRFPath) {
-	case RF_PATH_A:
-	case RF_PATH_C:
-		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
-		break;
-	case RF_PATH_B:
-	case RF_PATH_D:
-		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16);
-		break;
-	}
+	u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
+
 	/*----Set RF_ENV enable----*/
 	PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
 	udelay(1);/* PlatformStallExecution(1); */
@@ -492,31 +484,12 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/*----Initialize RF fom connfiguration file----*/
-	switch (eRFPath) {
-	case RF_PATH_A:
-		if (HAL_STATUS_FAILURE == ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, (enum rf_radio_path)eRFPath, (enum rf_radio_path)eRFPath))
-			rtStatus = _FAIL;
-		break;
-	case RF_PATH_B:
 	if (HAL_STATUS_FAILURE == ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, (enum rf_radio_path)eRFPath, (enum rf_radio_path)eRFPath))
-			rtStatus = _FAIL;
-		break;
-	case RF_PATH_C:
-		break;
-	case RF_PATH_D:
-		break;
-	}
+		rtStatus = _FAIL;
+
 	/*----Restore RFENV control type----*/;
-	switch (eRFPath) {
-	case RF_PATH_A:
-	case RF_PATH_C:
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
-		break;
-	case RF_PATH_B:
-	case RF_PATH_D:
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16, u4RegValue);
-		break;
-	}
+	PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
+
 	if (rtStatus != _SUCCESS)
 		goto phy_RF6052_Config_ParaFile_Fail;
 
-- 
2.33.0


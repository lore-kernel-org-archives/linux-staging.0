Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288E64406
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 13:49:50 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-34fdc6209c6so2812945ab.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694958590; x=1695563390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRYdjuGQNQBbRwHLVIS9CbcsOB+0X2iHZbWYXo35GrA=;
        b=LFp1o+1y7dEctLhC5wsPtGD/sAHMtiY08rncEzY5RBiVCpVmmoKjA1MgYxDnexxMez
         nObh4THW2KA9GzpBBkWLdfOXPuLROIH+FPprR1Q6sLBTb5oF5YdaRn6b5NgFbwC8L842
         Xrfesf75by7ITFIvDhWwsacbFi63GWVYstZM6l7WakARHk/qrBCZsyZ8liXd4x92Hr0q
         I+XpwL4O4OR72wqoU7kP44Gx29N/tHLFN4EplC1+zPTZvVYUsNU+qHVVrHQF4di692S1
         nIK/vEsnzNTBtWTwA0yPDr91yRfg20ytwz3u3LmwhIs1zX0zdvTLJqqqiA8GFSBLVIBS
         vE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694958590; x=1695563390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRYdjuGQNQBbRwHLVIS9CbcsOB+0X2iHZbWYXo35GrA=;
        b=BEtbENCxkUscly2FGStWFk2GWlkareH7cIAHXx32auoI8l3wC/gJTyw4GqkLbVic2R
         j9Z9VDs0eJRfgwjGeRp66MNiDuWsECHHsjn2jiWIeENgYYz+jNMKw5X7ZuXUsGD4wPRy
         430jaCl/HhEUvnr6Uy4Or6u4D7XKJoSSPztx/iQT45wuFreSIWtQAuPR7UQ/FKH0WxnZ
         LVZ4cRkYT3gwM/qdrDJtwslntKZb4C36WfQ22Nq0H0Jpgz2t+rBCEToUk9biGN89S5lj
         vx6B92y/yBtDd2XKNC24QtCjyyZZKzJoM/ykrpo+p2P48Hkd9GYKeHMfM1CwKHwZd2wE
         E11w==
X-Gm-Message-State: AOJu0YxXgsPBrBDV2CjmGP+Tr1DgiFjhlmp4WH5N24GhSHtzL7daO8CC
	3hQbDi0lTo0g/twKMs6EDJo=
X-Google-Smtp-Source: AGHT+IGJBG1LGVUJs6sXYaJyvyzb4Tu7KUrYX2Ex4AGtDv2rjmgeEqYnKpYRRGnPnPklKZj8KXKB+A==
X-Received: by 2002:a05:6e02:134e:b0:34a:c618:b904 with SMTP id k14-20020a056e02134e00b0034ac618b904mr7343251ilr.22.1694958590175;
        Sun, 17 Sep 2023 06:49:50 -0700 (PDT)
Received: from brag-vm.localdomain ([117.243.104.136])
        by smtp.gmail.com with ESMTPSA id v7-20020a63b647000000b0057408a9b3a8sm4759788pgt.42.2023.09.17.06.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 06:49:49 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: hal: Fix codespell-reported spelling mistakes
Date: Sun, 17 Sep 2023 19:19:40 +0530
Message-Id: <20230917134940.2746-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They are appear to be spelling mistakes,
Initially identified in a codespell report and never been addressed so far.

./rtl8723b_phycfg.c:156: Threre ==> There, three
./rtl8723b_phycfg.c:283: Condig ==> Config
./rtl8723b_phycfg.c:328: Tranceiver ==> Transceiver

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index a3bff27af523..7764896a04ea 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -153,7 +153,7 @@ static u32 phy_RFSerialRead_8723B(
  * @Data:	The new register Data in the target bit position
  *			of the target to be read
  *
- * .. Note::	Threre are three types of serial operations:
+ * .. Note::	There are three types of serial operations:
  *		1. Software serial write
  *		2. Hardware LSSI-Low Speed Serial Interface
  *		3. Hardware HSSI-High speed
@@ -280,7 +280,7 @@ void PHY_SetRFReg_8723B(
 
 
 /*-----------------------------------------------------------------------------
- * PHY_MACConfig8192C - Condig MAC by header file or parameter file.
+ * PHY_MACConfig8192C - Config MAC by header file or parameter file.
  *
  * Revised History:
  *  When		Who		Remark
@@ -325,7 +325,7 @@ static void phy_InitBBRFRegisterDefinition(struct adapter *Adapter)
 	pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
 	pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
 
-	/*  Tranceiver Readback LSSI/HSPI mode */
+	/*  Transceiver Readback LSSI/HSPI mode */
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = rFPGA0_XA_LSSIReadBack;
 	pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack = rFPGA0_XB_LSSIReadBack;
 	pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi = TransceiverA_HSPI_Readback;
-- 
2.34.1


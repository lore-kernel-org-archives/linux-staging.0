Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C7A7B
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 21:07:49 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ss4so56603019ejb.11
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 13:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pQYkoy/qDxOSox6BoBo+SUk2rYCy0dIN6nPZeFhqyM=;
        b=XLSCgdrC+GHjNNokBBmD75ZEzXi0pdUT7fNbbLuPb/XITinDsrcsYmxIDqujGA+AJU
         afRIE05aUjMgORuQMKTln1Fz72MgI3BZQ8RKtEp0U9jZDJmsYwKOQkNgYZn7IzfjMXxf
         kt/rQLmi6JUCsmzAAbK64Kfo/0wPQobFhbwJgvWc0FoLEQmCxe9jDLfwlQ72QKWFJBn9
         mjWtL6SOV8rarUWRH5k3p0u8/GKnqh3VuDB61WiFg8MLYbBtZCdGdm1Zvtvg5eoRlIlG
         xUS6TPW+l5LpDtDGE+Fb1wy3I0b4qZlepOneZt4Xfb/XJHpNBEp+jVzSsKN9XWQjazqW
         KCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pQYkoy/qDxOSox6BoBo+SUk2rYCy0dIN6nPZeFhqyM=;
        b=dqKis23hHBotaGrpRALtcvfaYhI1ZnZwyxtlPrt4Olq+pyt3VrUucHQGycF21VARJg
         bkGh2cPT2PVc0J4dDzUAJuZjHLrzH8c9lrjxsB73xwk7g3r1c2T2YxdegNFGHCNRArJU
         5fWQpi8QUfFgzkU4HXUuFdXIJmy+8/pVwnTXDbo2GIlqKJmMKS3ZVK7elqaIGimUlajy
         RtFvDXNyIjqN6gcIQJ1kEFoxc1ARry/qqDMAvoSN8tsDnqio7N5uO5yGLy4pfuTkxP90
         V6j5Yn74SQHGiBCqA2VMfyDFdlj2pCMM1RIbMkx9Gk2x6D86q/kSuc65DvOro8eCso4z
         qcPg==
X-Gm-Message-State: AFqh2kp+dwDEJoMAu7WBsLVNKDSLd6YGb36vqokLLUznvwM6d2PJhkOR
	z1QdziJeCyurk3ZblMNLHIc=
X-Google-Smtp-Source: AMrXdXtUYXRJM8uy4LK6HOe8tQ495C8xd1k4pw0uSD3uECBWtLiY+W4oFYidKA7ZwshkZ1bhsGVeVg==
X-Received: by 2002:a17:906:f8c9:b0:870:8a70:d630 with SMTP id lh9-20020a170906f8c900b008708a70d630mr1415589ejb.17.1673816868119;
        Sun, 15 Jan 2023 13:07:48 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbb0.dynamic.kabel-deutschland.de. [95.90.187.176])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7d74b000000b0049e08f781e3sm1010421eds.3.2023.01.15.13.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 13:07:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: convert phy_BB8188E_Config_ParaFile() to common error logic
Date: Sun, 15 Jan 2023 22:07:33 +0100
Message-Id: <20230115210734.18610-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115210734.18610-1-straube.linux@gmail.com>
References: <20230115210734.18610-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the fubction phy_BB8188E_Config_ParaFile() away from returning
_FAIL or _SUCCESS which uses inverted error logic. Use the common error
logic instead. Return 0 for success and negative values for failure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 204c1c30377b..c52af93f1669 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -449,13 +449,15 @@ static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
 {
 	struct eeprom_priv *pEEPROM = &Adapter->eeprompriv;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
+	int err;
 
 	/*  */
 	/*  1. Read PHY_REG.TXT BB INIT!! */
 	/*  We will separate as 88C / 92C according to chip version */
 	/*  */
-	if (ODM_ReadAndConfig_PHY_REG_1T_8188E(&pHalData->odmpriv))
-		return _FAIL;
+	err = ODM_ReadAndConfig_PHY_REG_1T_8188E(&pHalData->odmpriv);
+	if (err)
+		return err;
 
 	/*  2. If EEPROM or EFUSE autoload OK, We must config by PHY_REG_PG.txt */
 	if (!pEEPROM->bautoload_fail_flag) {
@@ -464,10 +466,11 @@ static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
 	}
 
 	/*  3. BB AGC table Initialization */
-	if (ODM_ReadAndConfig_AGC_TAB_1T_8188E(&pHalData->odmpriv))
-		return _FAIL;
+	err = ODM_ReadAndConfig_AGC_TAB_1T_8188E(&pHalData->odmpriv);
+	if (err)
+		return err;
 
-	return _SUCCESS;
+	return 0;
 }
 
 int
@@ -497,7 +500,8 @@ PHY_BBConfig8188E(
 	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_USBA | FEN_USBD | FEN_BB_GLB_RSTn | FEN_BBRSTB);
 
 	/*  Config BB and AGC */
-	rtStatus = phy_BB8188E_Config_ParaFile(Adapter);
+	if (phy_BB8188E_Config_ParaFile(Adapter))
+		rtStatus = _FAIL;
 
 	/*  write 0x24[16:11] = 0x24[22:17] = CrystalCap */
 	CrystalCap = pHalData->CrystalCap & 0x3F;
-- 
2.39.0


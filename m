Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B046BE
	for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 21:07:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x36so3681900ede.13
        for <linux-staging@lists.linux.dev>; Sun, 15 Jan 2023 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl6qXidu5WIs9nfrJNjX3YLrFPQ+UzUlEvm+lb6ejX8=;
        b=aGSmoHCRnDPbu3N95+i267CwF+b32AnPcEYIvug5tlCBNTeM1W0fglKna1UmjjojvN
         crchnx4bR1DHF+8hMK4nPuHuLaLtBd5bDrq43Ki+7s0mlvNHp05bd82W50uZzKWXDqWi
         eUdTI8NoEIyb8BZikP7ML3RywovN2V8hr6o9EeDpdxOaH+94Ev+x+Rf2PJ8KfhDYmsby
         LzKgWWj2OVxe9kbfYq+Hrtw+eR9fje64hc5a33K1qIMcbImqxqDxEPRC0LOXI5ztwu2B
         ArN5ZR2yH4iI8gi6cIo919g3GKBxp0kR3l2OJ50v8E6xcMzgx8d7zrviJwKk0071V2lO
         ay8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl6qXidu5WIs9nfrJNjX3YLrFPQ+UzUlEvm+lb6ejX8=;
        b=IWCj8h0f+B+tYh17ihs3aa7hm/G4xs1JocG5cbC0DU8T7u6gvmHf5u/XMsUOQ2cjJv
         KF1XZwSHEzxdDWocHG1O0aJYo3CkklQxALAey46AAdQ8fLecoj79TL6snz0w5vPILc2k
         b1Dg7lPqvRKo2HkNgOl8YL7zKMNJ/rEHVcuyS1eZMYAO9zeaO70z0rgiKIeACaJs2y0F
         Cls4iSzR0p9Y9eDhGhkt6VZbTHcx76kcTbAvZbo+8FLMN/5dkszI00DoRXYpe4vr0tiF
         QuwD18WbbP/m14nV+0VAZWXpVdRK/DjglbhyuSMJw5Wrm09cplIqUt3+LtxdT+GMr2F8
         xByw==
X-Gm-Message-State: AFqh2kpV7rRrzNYBqsO7Y7cs7a81kzS47nyoZhrDe1iTuBK9XPa35YSR
	1gpesyXswCC5DrvCTcCRmHE=
X-Google-Smtp-Source: AMrXdXufqCOOueR+Yc/0f6cIbPCMMF9bsP5YeESLYnR0rHZm/SLRRRVF1ctzhqOi0jfj9Yy6Sg22Yw==
X-Received: by 2002:a05:6402:380d:b0:47e:eaae:9a5b with SMTP id es13-20020a056402380d00b0047eeaae9a5bmr76135871edb.42.1673816867306;
        Sun, 15 Jan 2023 13:07:47 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbb0.dynamic.kabel-deutschland.de. [95.90.187.176])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7d74b000000b0049e08f781e3sm1010421eds.3.2023.01.15.13.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 13:07:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: convert phy_RF6052_Config_ParaFile() to common error logic
Date: Sun, 15 Jan 2023 22:07:32 +0100
Message-Id: <20230115210734.18610-3-straube.linux@gmail.com>
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

Convert the function phy_RF6052_Config_ParaFile() away from returning
_FAIL or _SUCCESS which uses inverted error logic. Use the common error
logic instead. Return 0 for success and negative values for failure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 7 +++----
 drivers/staging/r8188eu/hal/usb_halinit.c     | 5 ++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index e5ec6e563fbd..1988fb6e780a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -371,7 +371,7 @@ int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	struct bb_reg_def *pPhyReg;
 	struct hal_data_8188e *pHalData = &Adapter->haldata;
 	u32 u4RegValue = 0;
-	int rtStatus = _SUCCESS;
+	int err;
 
 	/* Initialize RF */
 
@@ -396,11 +396,10 @@ int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/*----Initialize RF fom connfiguration file----*/
-	if (ODM_ReadAndConfig_RadioA_1T_8188E(&pHalData->odmpriv))
-		rtStatus = _FAIL;
+	err = ODM_ReadAndConfig_RadioA_1T_8188E(&pHalData->odmpriv);
 
 	/*----Restore RFENV control type----*/;
 	rtl8188e_PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
 
-	return rtStatus;
+	return err;
 }
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 9ba6a526e90d..cb36b42c5ecc 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -610,9 +610,8 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 	if (status == _FAIL)
 		goto exit;
 
-	status = phy_RF6052_Config_ParaFile(Adapter);
-	if (status == _FAIL)
-		goto exit;
+	if (phy_RF6052_Config_ParaFile(Adapter))
+		return _FAIL;
 
 	status = rtl8188e_iol_efuse_patch(Adapter);
 	if (status == _FAIL)
-- 
2.39.0


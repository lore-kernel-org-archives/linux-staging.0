Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DC3FCB
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 07:40:19 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so34328099wrb.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 00:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zUoYPrdsXVCfbzQ591b/2xnz2JhbpgrLtyixMju3BfU=;
        b=JgTWNgML8CCG9X/ioFZCJuF4ADZDlgFQ6WFCxzjM4MUHDxULwnQZOOBU8eRZbzRcW0
         PfewMfMEhLogP4AfjaKTdwYSZUihvRwymPxLusSatfDV7OA33X/GBk+O8oQkRirb5Ccb
         wfybw7VWLrKq/UdPdu9DUzu3ixdSgUzFt3kfnrMNH5MLTM0W1FmPra3GZkydjZimP79a
         VOalmmHp+MFihh765UOhLQP5bMsp1sxmPlDz3ePscVFa4rvq9yJui5TaWyF0Xhz1AOWK
         FdW4baHWumeRgYbHPdPd68/acoQS200Dwt3TKvSmeQm+F5y0Ultgre1KLovbr/GfnSr1
         Hc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zUoYPrdsXVCfbzQ591b/2xnz2JhbpgrLtyixMju3BfU=;
        b=ghaxSCxM03TKO9WcHQfOqrEeYKtWbX2n1t1z4ZimL3Luvda914+13Ba+IlbqvcA4Nz
         2hNMKSlWGqialo988AMQTef1qhs2wQfZAcaOy3T4ZENnWXFPYrSvxTSKsbH0cq99Dvks
         tHvaKBYurjSWOTSxZkrxf3y7yg3ahng0ojA+ug0B05EX2q8g8uQEnzIshxPqEmIC+wiu
         ggG18KRLwqOP2Q3/dWD2f/XSdl4McrsKLpHtr/nqizueVm6dh/aVQvcngQxGQh2rUS1x
         ZMr8LNjCMp/MMmWSsskt7Y8kSKbieZIyueg3M9aFBFA94/FfqPM1blghs8BYWiD9SyaJ
         vkyQ==
X-Gm-Message-State: AOAM531EDjUoVwq3Qfmh9300mKIZv9/VfZYshsaWsMi1Elh6xgGsLDi+
	3loOSy1PvywtZxANhR6gBi8=
X-Google-Smtp-Source: ABdhPJynZRqMQpXwkL44WXWe7A68HlzQIzz3d4ASIFGZaRcsxh7HZf1upHkFZSWa9szCLqhJToPlng==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr15833269wry.364.1632555618376;
        Sat, 25 Sep 2021 00:40:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::dc89])
        by smtp.gmail.com with ESMTPSA id i187sm11343897wma.0.2021.09.25.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 00:40:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove ODM_CheckPowerStatus()
Date: Sat, 25 Sep 2021 09:40:13 +0200
Message-Id: <20210925074013.14693-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ODM_CheckPowerStatus() returns always true. Checking its
return value is not necessary. Remove the function and related code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 34ca1d0066e8..f01ee3cd8795 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -627,24 +627,12 @@ static void pathb_fill_iqk(struct adapter *adapt, bool iqkok, s32 result[][8], u
 	}
 }
 
-/*  */
-/*  2011/07/26 MH Add an API for testing IQK fail case. */
-/*  */
-/*  MP Already declare in odm.c */
-static bool ODM_CheckPowerStatus(struct adapter *Adapter)
-{
-	return	true;
-}
-
 void _PHY_SaveADDARegisters(struct adapter *adapt, u32 *ADDAReg, u32 *ADDABackup, u32 RegisterNum)
 {
 	u32 i;
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(adapt);
 	struct odm_dm_struct *dm_odm = &pHalData->odmpriv;
 
-	if (!ODM_CheckPowerStatus(adapt))
-		return;
-
 	for (i = 0; i < RegisterNum; i++) {
 		ADDABackup[i] = ODM_GetBBReg(dm_odm, ADDAReg[i], bMaskDWord);
 	}
@@ -1074,8 +1062,6 @@ void PHY_IQCalibrate_8188E(struct adapter *adapt, bool recovery)
 	bool is2t;
 
 	is2t = (dm_odm->RFType == ODM_2T2R) ? true : false;
-	if (!ODM_CheckPowerStatus(adapt))
-		return;
 
 	if (!(dm_odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
-- 
2.33.0


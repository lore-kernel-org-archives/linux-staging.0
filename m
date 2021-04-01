Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A7171
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:17 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u21so1805159ejo.13
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sImYT5a31VugEjaDWHwKVvdnq1RG+mL1lH4qbjS+quA=;
        b=uNeo/uc545h+45KS9V7naJiTIO8ui7aX+XNyLC7sKtLJnTW0wNb5WbrJP6YvJ9k3i9
         3Dhk2MHSafXP4EQU9vwXcZ/bKKCeKuZAa1/RbqTaFSm6EIBWA9/VU+9wgRQLf/wJwdk2
         mC7sDqdG7xWVv1vSqSbAU4MOrG4DmPfi/aJcx+SND0INIxKlgE8LNGHyYFeP8Nj/HS4Z
         PEYfD5rRjBq9JhTy2Zl6oMROD9vhN3F43pKplQRCBxLmgZCHao3UnWS6sSfF5y1si0y7
         twDaNPjwAtApVqaAZ4xXVqhFJ+xfOQGfmpwg6iaiPJiiiqtfoOrbb/TycWajLCC7+fJ6
         bpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sImYT5a31VugEjaDWHwKVvdnq1RG+mL1lH4qbjS+quA=;
        b=hSmLVbpoHqHzWeSCA+5m8hmdiUtUk2uJsLuP1TNMrheLrXS+NVhTy58KFDvqpALEOy
         d7tW7PNvTD5g6+hhlBUEEQDKYdQTXT9kJm75CwIiq870Row8zOZCTn3eSgiJ2k7neuxg
         6EUKlwrVnB+l+FqCmFLC9+oQfdXVWuvBY01jjE49bnKDLItasmzkJB8F6+r+aeDKoP0E
         +VO93A8LP7o7kwcs//L0gHTU8Tgle3Hoae4Wb5MTYVZBoe590v93prjSFl1IJFnfEGbZ
         0cwgbq4Gkv01oy1w2cugio4TaSWosXQjZBPDsBVTGKPRIMEmEdiYksu8Fqdu+vifGtO5
         txCg==
X-Gm-Message-State: AOAM533BegqABA5HdYuUN93/bor/zx4dmouLEv0WyBw7cM49mfqehuWi
	LGnCO9nOEt6CpIqXDPoXngM=
X-Google-Smtp-Source: ABdhPJzA/fmJ4th/UNh5DcSYK3AoK4Yve+KH+bZmOGiJflq9srHEfnOS+HneHgkVjAEZQxg5p/z4jA==
X-Received: by 2002:a17:907:78d9:: with SMTP id kv25mr8251472ejc.415.1617268936183;
        Thu, 01 Apr 2021 02:22:16 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id b18sm2522428ejb.77.2021.04.01.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 32/49] staging: rtl8723bs: remove RT_TRACE logs in hal/rtl8723b_phycfg.c
Date: Thu,  1 Apr 2021 11:21:02 +0200
Message-Id: <f908d37bcf7fd970da1bf1cef03bdb8132cd2dd5.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 32 ++-----------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 2abff4673be2..2b9254000526 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -551,7 +551,6 @@ void PHY_SetTxPowerIndex(
 			break;
 		}
 	} else {
-		RT_TRACE(_module_hal_init_c_, _drv_err_, ("Invalid RFPath!!\n"));
 	}
 }
 
@@ -604,11 +603,8 @@ void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
 		RFPath = pHalData->ant_path;
 	}
 
-	RT_TRACE(_module_hal_init_c_, _drv_info_, ("==>PHY_SetTxPowerLevel8723B()\n"));
-
 	PHY_SetTxPowerLevelByPath(Adapter, Channel, RFPath);
 
-	RT_TRACE(_module_hal_init_c_, _drv_info_, ("<==PHY_SetTxPowerLevel8723B()\n"));
 }
 
 void PHY_GetTxPowerLevel8723B(struct adapter *Adapter, s32 *powerlevel)
@@ -648,24 +644,13 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 	u8 SCSettingOf40 = 0, SCSettingOf20 = 0;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
-	RT_TRACE(
-		_module_hal_init_c_,
-		_drv_info_,
-		(
-			"SCMapping: VHT Case: pHalData->CurrentChannelBW %d, pHalData->nCur80MhzPrimeSC %d, pHalData->nCur40MhzPrimeSC %d\n",
-			pHalData->CurrentChannelBW,
-			pHalData->nCur80MhzPrimeSC,
-			pHalData->nCur40MhzPrimeSC
-		)
-	);
 	if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_80) {
 		if (pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 			SCSettingOf40 = VHT_DATA_SC_40_LOWER_OF_80MHZ;
 		else if (pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf40 = VHT_DATA_SC_40_UPPER_OF_80MHZ;
 		else
-			RT_TRACE(_module_hal_init_c_, _drv_err_, ("SCMapping: Not Correct Primary40MHz Setting\n"));
-
+			;
 		if (
 			(pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) &&
 			(pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
@@ -687,27 +672,16 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 		)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPERST_OF_80MHZ;
 		else
-			RT_TRACE(_module_hal_init_c_, _drv_err_, ("SCMapping: Not Correct Primary40MHz Setting\n"));
+			;
 	} else if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
-		RT_TRACE(
-			_module_hal_init_c_,
-			_drv_info_,
-			(
-				"SCMapping: VHT Case: pHalData->CurrentChannelBW %d, pHalData->nCur40MhzPrimeSC %d\n",
-				pHalData->CurrentChannelBW,
-				pHalData->nCur40MhzPrimeSC
-			)
-		);
-
 		if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPER_OF_80MHZ;
 		else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 			SCSettingOf20 = VHT_DATA_SC_20_LOWER_OF_80MHZ;
 		else
-			RT_TRACE(_module_hal_init_c_, _drv_err_, ("SCMapping: Not Correct Primary40MHz Setting\n"));
+			;
 	}
 
-	RT_TRACE(_module_hal_init_c_, _drv_info_, ("SCMapping: SC Value %x\n", ((SCSettingOf40 << 4) | SCSettingOf20)));
 	return  (SCSettingOf40 << 4) | SCSettingOf20;
 }
 
-- 
2.20.1


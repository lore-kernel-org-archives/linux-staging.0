Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B083D74
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 14:43:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id x92so4415322ede.9
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 07:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O+dr3jl5gDyh/hm3RWAslgURxfqQlnNRpD5jykGjHFc=;
        b=UWAfkNXJmZSXjk3jAT9AIhAo3LsFU0ZtlgIahUUNIoPa3XTJHqklTJsE9Y9SvaB6Ct
         BwNq1NanHi52y2TsJ73xJbl92w1bORPCyPc7VFHtcloopM1hyBfFDoh+Bvoxv8HRPdBV
         bTDZtNG9aDKL+Syv1f0IhB7m+KitFrHdp+pOYp67eLsTDnWePO29ysU0IscbWHsEgPCa
         0vVemr1UmFnyhU/OpjF4mjE5dXI1tAdymtFW2MeNft9G1/Dsqa3Eg8ToF5lbOtnBXckl
         ogipwACn1Vl7AuO1ASIxOqkrKx4dFFqKKyuXqrkaYiE4p14W7n/vUsChvxrD5YdbKrlm
         m+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O+dr3jl5gDyh/hm3RWAslgURxfqQlnNRpD5jykGjHFc=;
        b=2Wtmr2NgN89q1KEBQlnqkOOe3IDY8xNiZ6KZwMo2IDTfQzhpXOvkDhaTkhhrqWHweM
         lFNgDlM+QGNIZGfvfT1K7ZoV5H8GLhkNNjrxpELjcWJ0HUohUksM80zkIPxmevWxP85Z
         ZU1HLtnwN3cGHb2WCuitBOhOJKInaeOznk8B0wilToSmUvvNGzTs85rsY4HsnR2/TpHv
         A6Hw4drUZPen8KThax5Hf0SYDi22zWPeAgh72T0bJLBVf+y701xik6xa9Y2Ma3cY/FBj
         lszOddePCrlmYA/2T/C0733IEzOB4FNkVjOnLqZcsgLQvZwBnHBrdL4x8uPX7UqrFW6H
         1Oog==
X-Gm-Message-State: ACrzQf0rJoUgvWICg3puLzBwJ4UrNR1LX0/bau9HMag79c12W8mjO+Cn
	WX9tVTtR7b11+gsHcDfiMEk=
X-Google-Smtp-Source: AMsMyM7XI0TKigLfWw76HQyG9NSSOojQ3ZlGp2cIohJwVNCl38fh5TdQknBto3q1igRhZh1otKXMxA==
X-Received: by 2002:a50:fc13:0:b0:457:1075:42de with SMTP id i19-20020a50fc13000000b00457107542demr20807256edr.310.1664376215473;
        Wed, 28 Sep 2022 07:43:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb59.dynamic.kabel-deutschland.de. [95.90.187.89])
        by smtp.gmail.com with ESMTPSA id u9-20020a50eac9000000b00456c6b4b777sm3456973edp.69.2022.09.28.07.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:43:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: convert ODM_ReadAndConfig_PHY_REG_1T_8188E() to int
Date: Wed, 28 Sep 2022 16:43:22 +0200
Message-Id: <20220928144323.13164-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928144323.13164-1-straube.linux@gmail.com>
References: <20220928144323.13164-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ODM_ReadAndConfig_PHY_REG_1T_8188E() has return type
'enum HAL_STATUS'. Convert the return type to int and use common
kernel error logic. Return 0 on success and negative values on
failure. The goal is to get rid of enum HAL_STATUS in the end.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c     | 9 ++++-----
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c      | 2 +-
 drivers/staging/r8188eu/include/HalHWImg8188E_BB.h | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
index a4eb2879b77e..8d60eee7ab50 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
@@ -473,7 +473,7 @@ static void odm_ConfigBB_PHY_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32
 	}
 }
 
-enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
+int ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32     hex         = 0;
 	u32     i           = 0;
@@ -483,7 +483,6 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 	struct adapter *adapter =  dm_odm->Adapter;
 	struct xmit_frame *pxmit_frame = NULL;
 	u8 bndy_cnt = 1;
-	enum HAL_STATUS rst = HAL_STATUS_SUCCESS;
 	hex += ODM_ITRF_USB << 8;
 	hex += ODM_CE << 16;
 	hex += 0xFF000000;
@@ -493,7 +492,7 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 		pxmit_frame = rtw_IOL_accquire_xmit_frame(adapter);
 		if (!pxmit_frame) {
 			pr_info("rtw_IOL_accquire_xmit_frame failed\n");
-			return HAL_STATUS_FAILURE;
+			return -ENOMEM;
 		}
 	}
 
@@ -575,11 +574,11 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 	}
 	if (biol) {
 		if (!rtl8188e_IOL_exec_cmds_sync(dm_odm->Adapter, pxmit_frame, 1000, bndy_cnt)) {
-			rst = HAL_STATUS_FAILURE;
 			pr_info("~~~ IOL Config %s Failed !!!\n", __func__);
+			return -1;
 		}
 	}
-	return rst;
+	return 0;
 }
 
 /******************************************************************************
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 7bcaddc9128b..f31c1b7a469a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -455,7 +455,7 @@ static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
 	/*  1. Read PHY_REG.TXT BB INIT!! */
 	/*  We will separate as 88C / 92C according to chip version */
 	/*  */
-	if (HAL_STATUS_FAILURE == ODM_ReadAndConfig_PHY_REG_1T_8188E(&pHalData->odmpriv))
+	if (ODM_ReadAndConfig_PHY_REG_1T_8188E(&pHalData->odmpriv))
 		return _FAIL;
 
 	/*  2. If EEPROM or EFUSE autoload OK, We must config by PHY_REG_PG.txt */
diff --git a/drivers/staging/r8188eu/include/HalHWImg8188E_BB.h b/drivers/staging/r8188eu/include/HalHWImg8188E_BB.h
index 8270fdbc2844..787fd2cf8d4e 100644
--- a/drivers/staging/r8188eu/include/HalHWImg8188E_BB.h
+++ b/drivers/staging/r8188eu/include/HalHWImg8188E_BB.h
@@ -16,7 +16,7 @@ enum HAL_STATUS ODM_ReadAndConfig_AGC_TAB_1T_8188E(struct odm_dm_struct *odm);
 *                           PHY_REG_1T.TXT
 ******************************************************************************/
 
-enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *odm);
+int ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *odm);
 
 /******************************************************************************
 *                           PHY_REG_PG.TXT
-- 
2.37.3


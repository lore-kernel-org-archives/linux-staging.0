Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5317F9
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 08:54:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id o22so4840145edc.10
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 01:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=meuYSHAo/A5Ok1qkNjeYNT8E0hFFDPVG1zV7y+jAVHY=;
        b=eSvTxLLnbqMqzFWxm8LILKoYi6s56iLyYyvrkQ2ukU/qwcp8JaFQpXGELAIriB3IJH
         odgFCnwXhQfDodM5kQWxcVYCg1O0fgpXLNyhuxU5k0xIhooBjXO/te4V865nbOS6vNkE
         JqSQxvEyzRndr5lNY2aBx+kOfZaLq//1y1uSZyt6WkhLUvN1IyR7oc1kibfsI/Klx4by
         kwkOAL00NvqV++L7wVrd0IqPm/g0JI3C8Uyo/FLRSMMS6hidJva0+Rvo2IJR4VAamI13
         F1tHlSfqj1vKXO0zdReoGHkQqu96stlHswn9T1+qMxDJJK1kLm/DeDlD9wF8w2Pzxhu1
         /FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=meuYSHAo/A5Ok1qkNjeYNT8E0hFFDPVG1zV7y+jAVHY=;
        b=MQfYaS5FhRd3rxY2JPAI46r2uCQtESDlqE7mFw0xF+1Y/eV8opDN4YU9NXbzphXC4Z
         qajfloKiS4AYcvkU/7JQaPN7QZI2bUSlSVAkIP8UtZw31wzrob8qgScsg/FeBT92pkOQ
         x67Q7+U3Z/PfgHZWqLfkowVpghbpi30fHvPCczW/xEqU9G4zO2PIWBHlCbUIT2Oaf9wb
         +4D9NExSEubiqtQE8TAmLZe9Qi2Ka5HHh2J+3MmJiJw1tAtc3hFFP6H3t2ULJbKHi62I
         XVVrRbaCT65BdnP5Q2TQOKFn/dp2BjRwrYGBHMUZTcLtfOyzRH8yqoo5laa4dXlMCaZ1
         9aKg==
X-Gm-Message-State: ACgBeo136z20AUzXMRTquproPfaBxP1vSpdxSdv78V4vqVKuwSh519Bd
	QcUuNERgQQnzulO+RWL72Kg=
X-Google-Smtp-Source: AA6agR79aExTGcwUe0On9Ih0n7/GYqU12C75vM3DTcu6b2iWtvI6OXm+nczfqnQPU6fHrMYxyFX8NQ==
X-Received: by 2002:a05:6402:540c:b0:434:d965:f8a with SMTP id ev12-20020a056402540c00b00434d9650f8amr5352222edb.30.1660899250356;
        Fri, 19 Aug 2022 01:54:10 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id b9-20020a17090630c900b0073c9d68ca0dsm1084261ejb.133.2022.08.19.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:54:10 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Subject: [PATCH 6/7] staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
Date: Fri, 19 Aug 2022 10:52:56 +0200
Message-Id: <24c3baa696adb7633d643258b60bba9bcd18b953.1660898432.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660898432.git.namcaov@gmail.com>
References: <cover.1660898432.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because this function is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_odm.c    | 18 ------------------
 drivers/staging/rtl8723bs/include/rtw_odm.h |  1 -
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index ec8406c18b03..2cba7825c9b3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -129,24 +129,6 @@ void rtw_odm_ability_msg(void *sel, struct adapter *adapter)
 	}
 }
 
-void rtw_odm_adaptivity_parm_msg(void *sel, struct adapter *adapter)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(adapter);
-	struct dm_odm_t *odm = &pHalData->odmpriv;
-
-	netdev_dbg(adapter->pnetdev, "%10s %16s %8s %10s %11s %14s\n",
-		   "TH_L2H_ini", "TH_EDCCA_HL_diff", "IGI_Base", "ForceEDCCA",
-		   "AdapEn_RSSI", "IGI_LowerBound");
-	netdev_dbg(adapter->pnetdev,
-		   "0x%-8x %-16d 0x%-6x %-10d %-11u %-14u\n",
-		   (u8)odm->TH_L2H_ini,
-		   odm->TH_EDCCA_HL_diff,
-		   odm->IGI_Base,
-		   odm->ForceEDCCA,
-		   odm->AdapEn_RSSI,
-		   odm->IGI_LowerBound);
-}
-
 void rtw_odm_adaptivity_parm_set(struct adapter *adapter, s8 TH_L2H_ini,
 				 s8 TH_EDCCA_HL_diff, s8 IGI_Base,
 				 bool ForceEDCCA, u8 AdapEn_RSSI,
diff --git a/drivers/staging/rtl8723bs/include/rtw_odm.h b/drivers/staging/rtl8723bs/include/rtw_odm.h
index ea9c4de0f284..be0d47413fd2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_odm.h
+++ b/drivers/staging/rtl8723bs/include/rtw_odm.h
@@ -19,7 +19,6 @@ void rtw_odm_dbg_level_set(struct adapter *adapter, u32 level);
 
 void rtw_odm_ability_msg(void *sel, struct adapter *adapter);
 
-void rtw_odm_adaptivity_parm_msg(void *sel, struct adapter *adapter);
 void rtw_odm_adaptivity_parm_set(struct adapter *adapter, s8 TH_L2H_ini, s8 TH_EDCCA_HL_diff,
 	s8 IGI_Base, bool ForceEDCCA, u8 AdapEn_RSSI, u8 IGI_LowerBound);
 void rtw_odm_get_perpkt_rssi(void *sel, struct adapter *adapter);
-- 
2.25.1


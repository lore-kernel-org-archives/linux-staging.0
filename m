Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13F3217
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:34 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u15so237301ejt.6
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=meuYSHAo/A5Ok1qkNjeYNT8E0hFFDPVG1zV7y+jAVHY=;
        b=Z4XSZdUv/W82vjjUKWk23bwYPDMs2hA9znu0oVMhJxFkrcG6OacVqQGvEhj4USVcUn
         ZongS/OaLR1dkS17omnxqK0iUh6mT9SCkWnrjC8ug9p7Cu3gb2d2HutVcseqa5zsol5G
         XroXWis1BsCNrLATfB7k2h5uhhffRd/mfER2E/W2YG4yoUEWAyM3ifyHpTtRWuSfC5Rq
         MFmF2qdG3hY3kku0mdTBtptd+dkB0paBmrqlZO0IfhtGSIVX8LC3ztfi7VIHK0OqWd8d
         cRM/szOyAN70EkOynNPhRKF+8SVFUEi7x/eUb4M2whmN9QD8ud73Rf0gGnl9AjVl1jZc
         6wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=meuYSHAo/A5Ok1qkNjeYNT8E0hFFDPVG1zV7y+jAVHY=;
        b=OUUOb9BlQ7KxEOp5i/6074AbC/WnMR87SeQcPe5CQwEmOr9Q3CQ10GnqkIKQweursJ
         txpX5ZujO5Ra/0gSKketVFxBLRdzLAsYAdeoD+SKAl7hqVgHqU0efA/toEkt5uk3H6ml
         tP54061SoC8qb+J6t/fBX24k0/7D7qQi7T3L+PVsFMafT7gxlE3VQZb+Z8zP1N4qtBCA
         XCQyRHqqdiXcdHjiL9bbwpgNZ+5VWr4Hm2cmaZjcyFMeXhTwMByPEHPSLQ2SgaiQcfCg
         aOFqfNIjbPDO5jfVn6/O7McLXqZeYfCqa9/dsIibo7MNWKrqVz31yO/bg1t0fVnkOgRH
         IRLg==
X-Gm-Message-State: ACgBeo0F7yiLJYL2z+vN4aI1yM1v2pxWwrxhrbkqkmKUA0YJTEBMk8OD
	CKRn9YHFunK8Gro6OCLZAWQ=
X-Google-Smtp-Source: AA6agR7oqC9dIg09hMfcQf7XSrdrIl5Yr/TGCrz96da051ZK0Vyt6/1Bogz7/eL6O+By3Rkc9eeIAg==
X-Received: by 2002:a17:907:6d06:b0:731:5809:ec67 with SMTP id sa6-20020a1709076d0600b007315809ec67mr4962544ejc.195.1660917033170;
        Fri, 19 Aug 2022 06:50:33 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:32 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 6/8] staging: rtl8723bs: remove function rtw_odm_adaptivity_parm_msg
Date: Fri, 19 Aug 2022 15:49:40 +0200
Message-Id: <24c3baa696adb7633d643258b60bba9bcd18b953.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
References: <cover.1660916523.git.namcaov@gmail.com>
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


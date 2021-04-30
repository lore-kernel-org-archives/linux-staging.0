Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAA92F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:18 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id zg3so24044373ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=VL9d4OW7Ec+AxC0j591mngRP1Zhir8y5RQ525/Z4ws7TQXKjxQ8YnsXynR1SEXHpQ6
         y74dcPFpsgUfGPmE3iB+vixdmSiDUyYOuirHC+xyomuVF+P2BktwX8Ll+nrtuJpamfq1
         g2Tt7OBuBxzRck3Jv8c8eHUX1IzVP+JyfKQvgmEBqwkZ9UO1T3qnXsWmMiNXXu14EZIV
         RXHG41erkWG5QGqxGRaieYvkk1OTe9yX21UzovDaWKAEvbSbMyFXgy3+HJBXka47vwAa
         +PdowRtbtIiPMAa0q4K3on4LHOkR8SUtfoVdj783WqfdhsFOcXMS41Sjqw/ORXVAH49p
         kggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=jzIDWuwZ8XovFc+msw6uBbYfWE7DtrPzpFN1Ycc6fP6cN1zSzbHKnHsHY3nGH3I9/L
         9VMVqn7p6FRg585AruI0aacBhd0/2Gv3hDJd0LVo/PORrWwy4VZJlNSZ3k6cRYc+KKCK
         8GMHPAap+YLeB5EPpQCH73vBsCfvpkP+YbuKgOPDqwU8nOf2zXmf8hvav8DmrF7OHD2d
         C/gJdEYTS8CXMrS7VN62cR428WJAkzQrf9B4TGPPcsycILNgZ9Ky/gz+vXsk5LKcX/ny
         GJ/sOTDguHVXNI6dLnpGEE/F87mv7e2lo4zcotiL/yzJbDvSv8umVyoWHE8r1KEnpdWZ
         SKaA==
X-Gm-Message-State: AOAM532Cez1K5UmjXD0jKWXuIdVlnkAVLmk8bY6RLGdWBu1l9qurXusu
	x8EQ5kmuVAN5+Ahn2M9onaU=
X-Google-Smtp-Source: ABdhPJy4dPXkx8/vy3AQ1bgikAlV9uZU1ChSgjFpuMoWiUBvHa5hJc0rO/68AU1Z4WBlLFHZVSAUMA==
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr4711371ejb.91.1619793916980;
        Fri, 30 Apr 2021 07:45:16 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id bm13sm2091592ejb.75.2021.04.30.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:16 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 42/43] staging: rtl8723bs: remove DebugLevel member in dm_odm_t struct
Date: Fri, 30 Apr 2021 16:44:12 +0200
Message-Id: <dd309268a37747559728335a4b4ce8108e538030.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove DebugLevel in dm_odm_t struct,
remove private debug level tracing.

remove unused variable as well to suppress compiler warning.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 4 ----
 drivers/staging/rtl8723bs/hal/odm.c     | 3 ---
 drivers/staging/rtl8723bs/hal/odm.h     | 2 --
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 8d1a18b5f914..5eb3bd45a959 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -1159,7 +1159,6 @@ u8 GetHalDefVar(
 )
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
-	struct dm_odm_t *odm = &(hal_data->odmpriv);
 	u8 bResult = _SUCCESS;
 
 	switch (variable) {
@@ -1176,9 +1175,6 @@ u8 GetHalDefVar(
 				*((int *)value) = psta->rssi_stat.UndecoratedSmoothedPWDB;
 		}
 		break;
-	case HW_DEF_ODM_DBG_LEVEL:
-		*((u32 *)value) = odm->DebugLevel;
-		break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)value) = hal_data->odmpriv.SupportAbility;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b867629a577b..fa275138c983 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -1172,9 +1172,6 @@ void ODM_CmnInfoUpdate(struct dm_odm_t *pDM_Odm, u32 CmnInfo, u64 Value)
 		pDM_Odm->RSSI_Min = (u8)Value;
 		break;
 
-	case ODM_CMNINFO_DBG_LEVEL:
-		pDM_Odm->DebugLevel = (u32)Value;
-		break;
 	case ODM_CMNINFO_RA_THRESHOLD_HIGH:
 		pDM_Odm->RateAdaptive.HighRSSIThresh = (u8)Value;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 6b9865f5f283..950e7850bac2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -709,8 +709,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	enum phy_reg_pg_type PhyRegPgValueType;
 	u8 PhyRegPgVersion;
 
-	u32 DebugLevel;
-
 	u32 NumQryPhyStatusAll;	/* CCK + OFDM */
 	u32 LastNumQryPhyStatusAll;
 	u32 RxPWDBAve;
-- 
2.20.1


Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F922F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:17 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id j28so17490215edy.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=BC6vKBS+h6XM3Y5viRelBP+RHX23Q57MTTWaYERsDlSpnfF6w7iB924a8n0ew+Q2tH
         nGqk6R6eU4PcyxnhJ5FHVpKZA+MKYIUHo2g1BSRciP0vH+neJyd0xqdqLRq+hhn2O0TB
         TjX9DgeOI2JZDvW6zR1/njRj4nWMGw9aJ/uNijOqZqIWu6yzFIuzIUgjxCUhbBEbsp2E
         c0leGZj8V0TwC1Zn0W9PJanQNBiaNMvbdHILzW3tt7mkIXvxxwA2PAJ2M7G0vtrg6Lkd
         byc193NX2EFxgUey8WarYbTHS+sO2B9udHjAZOdOrXEkK1LbifFQoFfPzhVbKjCESjnY
         LS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=bE/j/iHlOFzoArvrBR7o67lubXNymp7gDB3HhrLgDX0wBvLCh0R9wU1pEov2GAXKTb
         77fy++DozMLYZtz/4mJ14weyusJ5JWJoXMKKoGlTUL3bFz8xHqvL4GykGwa08sqsmWP3
         VNHJ4rXkPtI3SZjGcBxkd8tHUVvAbbj7cliMN1aiEr+WuuCOgKwvqhtZcQPhmUD795lX
         KlENr2iucKOqmEjPd6FZMj+wug7gIU/OjlOSGx4kLGH5xlReGTSXbCD1V2MLsLPTXSA+
         K0Q0sfyF9XmRON76qgIBFObY7O6zhD8hYpmY/mvD+rYH/ZgAv6/NXxQbotm+a0mTWAg1
         4wTg==
X-Gm-Message-State: AOAM530z4uAaK8+XN92rlQlGljzBnETqNFpVxm3XdzwPFURZfm5I+o9p
	mrLI0yFF2o/Xk0PmNQbdDd8=
X-Google-Smtp-Source: ABdhPJwUQ8wKL88ODO6ABT1EDbcGjdzfFu9wh3ut3pM/iZRWAdcczP3D1QBZ9ozk+oFikho42/g8pw==
X-Received: by 2002:a05:6402:35c8:: with SMTP id z8mr4336751edc.210.1619768716025;
        Fri, 30 Apr 2021 00:45:16 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id n17sm651810eds.72.2021.04.30.00.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:15 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/43] staging: rtl8723bs: remove DebugLevel member in dm_odm_t struct
Date: Fri, 30 Apr 2021 09:44:00 +0200
Message-Id: <fac0a882d453f24e423ccc76e494d09207ff9ccd.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
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


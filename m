Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FC2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id l4so105671725ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=MxohnjtG4Zit/GrLrEHFDEM30Ex/Y29dnnNb6kclsj47wQVh7406niOegbn/m9s5Fx
         M4bd51RPknWNqmnFTKBgeIFttqGpxJM1qUUe1H8Hc04dZ2wkWpoJLhUOjeJlNxokwZbC
         dEoJEFVV+x2uG8MyL8RXRJ2fbx/PUWqvLFhz5+alg+o5P+5tUTFxhDIhG8g4BqOB/453
         GHqmwD0q+kdfcs0CU8QWLYEpmRwGF11oV1DcXOxoPW+Qtp3yD2cTFovny3quGAtPkEFD
         4eFXctnkVdUullwFoz2zQplEReWxRevEAUlf6L4DU6M7IFY33YPsEl0JE7mZlnFH8I/i
         T8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O0vgVpcNkS4mAjfiGNcrsQkfchPH8sG7BBuJp5aFS/s=;
        b=TIUjfCYUglmh2Gypdq5bebml6B/DQG+qTND8lvG4pqMOGDCadAqHHeMvNDOziX6JQG
         zFPBE9diJtYcURs/h/Bds/npx/9k26TtXp3bpMtAySX03MKbbCZsAKxuol3s12wKNDwo
         JKjKmgLtfVvCEwe6neZ/StLqN7c80jaxD+hjOP5iIt1bF9Wzf3DAMeeo9avSd+zqMMVX
         DZ2jA2MbJU6PER7i/Zmyp6SOqTmtDU/rjtMERRFGs+enOQ+Cubf+8GW1Fa5Aq4yV3SeQ
         kJyp40hwxjWGCoF+CFJcsAcA4Ig5PQx4ogzx6fHdLAdnDUe2fg6AMRIsL+NIg3XHR64n
         rJHw==
X-Gm-Message-State: AOAM532ENcF34DYATGgxzes7CG7NBMhgCw8QEqMt6pIZwBNyw5fq7F9s
	IZNs897zlrZEfGmfjibfA+o=
X-Google-Smtp-Source: ABdhPJxjGJ+Cca5lrtlEYXQLOBZWEVo/PjN4r1xsZLkefMs/OfhcBqgjJ36e1XF8a95Mupf7xlBJ+g==
X-Received: by 2002:a17:906:1e44:: with SMTP id i4mr4826580ejj.61.1619794695142;
        Fri, 30 Apr 2021 07:58:15 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id mp36sm2014260ejc.48.2021.04.30.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:14 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 42/43] staging: rtl8723bs: remove DebugLevel member in dm_odm_t struct
Date: Fri, 30 Apr 2021 16:57:04 +0200
Message-Id: <ac4afb00f904511e0cbb23136f8e7a3e204ad7ed.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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


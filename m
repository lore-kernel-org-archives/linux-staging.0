Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630042CA0
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id o30so8747052wms.4
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuaztYvPHWrZ6c/Uw5eoLffstSdeo51VPiTo6JhL6Gw=;
        b=pNHP90HtuH/0E6Tyzikwa3xEmGdz37G4XeMVnHumnNqdwDpSN1gcm7ylk66aGjaB/Y
         EHjL/tCsNUOu+mdvWGAdQYwzRq3oIKVFEL9Tp56EXHUr2c491E09zPjbBBc32BGI5SEM
         MUcdIhXyvE72HTCfSO+fGUNad9TvZaDy5xvQcYCx3BzfP7sOjoRSk7gBjNbbOiXJzBZT
         0oLSStY5amVq5n1MZkoMJ139GEMhoFrhHeAAw/+5IoJiUwLLFFdDrTn/dqgLI2gDfCPR
         5mPnOSycAUnoaNEc37+9N9Kn+IoB9KZAx6/kAFv85ebwYTi6LiWZicdWILx3HFz3bjuD
         W9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuaztYvPHWrZ6c/Uw5eoLffstSdeo51VPiTo6JhL6Gw=;
        b=LS56s1MRNWpQRvPLN+ZCWuSS8c6MtqEYB8j04cEsl2UaSo8DeqM7hHG8K5StiWEznM
         f98D/Ucd24nZDNLIVLdFcIioDReqgyKpTcmBLGzrbaumyG+MskDc+w667Ysc81TuaUfE
         T79wTRm5fZmq0u3rfxt+QtOXbgNOVYm6Ug+6fUhcmEVFqxIH2pRH4dY965+X3Nu4F/sA
         mcOP3PiUm9fjezj8NWgxAildSSwdDpuiyMUXbUFfZLFB+KXTQeAqwWzn++t4lHMQ6wLB
         KV6rRpc7HXlScTp2i1S+OhD0TA5NXW2l5LN0AoZzf+1h037p8RWG3jGAeB67M+UlbCfE
         5smw==
X-Gm-Message-State: AOAM533I3xjA/Dm3PKNEZDbP4/AItIA30aIRHrGcPCiBqpsqibStEmJ9
	xnvrAKscaY0V2Gt3pGJEY5Q=
X-Google-Smtp-Source: ABdhPJxNMozG3p9MRQ8D/blBHymENSelCHy1aTypedvv2Fij5RJsOROZb5bTsCoJULhmYXTlC/skfA==
X-Received: by 2002:a05:600c:2f01:: with SMTP id r1mr17018955wmn.153.1640686303912;
        Tue, 28 Dec 2021 02:11:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:43 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: r8188eu: DM_PriCCA is set but never used
Date: Tue, 28 Dec 2021 11:11:11 +0100
Message-Id: <20211228101120.9120-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228101120.9120-1-straube.linux@gmail.com>
References: <20211228101120.9120-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field DM_PriCCA of struct odm_dm_struct is set but never used.
Remove it and remove related dead code.

Acked-by: Martin Kaiser <martin@kaiser.cx>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c              |  1 -
 drivers/staging/r8188eu/hal/odm_RTL8188E.c     | 15 ---------------
 drivers/staging/r8188eu/include/odm.h          |  9 ---------
 drivers/staging/r8188eu/include/odm_RTL8188E.h |  2 --
 4 files changed, 27 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 7a42687b3128..a820bdc26fbc 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -152,7 +152,6 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 	odm_DIGInit(pDM_Odm);
 	odm_RateAdaptiveMaskInit(pDM_Odm);
 
-	odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
 	odm_DynamicBBPowerSavingInit(pDM_Odm);
 	odm_TXPowerTrackingInit(pDM_Odm);
 	ODM_EdcaTurboInit(pDM_Odm);
diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 8af45c7535ea..34530fcd00d8 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -260,18 +260,3 @@ void ODM_AntennaDiversity_88E(struct odm_dm_struct *dm_odm)
 	if ((dm_odm->AntDivType == CG_TRX_HW_ANTDIV) || (dm_odm->AntDivType == CGCS_RX_HW_ANTDIV))
 		odm_HWAntDiv(dm_odm);
 }
-
-/* 3============================================================ */
-/* 3 Dynamic Primary CCA */
-/* 3============================================================ */
-
-void odm_PrimaryCCA_Init(struct odm_dm_struct *dm_odm)
-{
-	struct dyn_primary_cca *PrimaryCCA = &dm_odm->DM_PriCCA;
-
-	PrimaryCCA->dup_rts_flag = 0;
-	PrimaryCCA->intf_flag = 0;
-	PrimaryCCA->intf_type = 0;
-	PrimaryCCA->monitor_flag = 0;
-	PrimaryCCA->pri_cca_flag = 0;
-}
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 19e859b989ad..306640e92e6f 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -81,14 +81,6 @@ struct false_alarm_stats {
 	u32	Cnt_BW_LSC;	/* Gary */
 };
 
-struct dyn_primary_cca {
-	u8		pri_cca_flag;
-	u8		intf_flag;
-	u8		intf_type;
-	u8		dup_rts_flag;
-	u8		monitor_flag;
-};
-
 struct rx_hpc {
 	u8		RXHP_flag;
 	u8		PSD_func_trigger;
@@ -487,7 +479,6 @@ struct odm_dm_struct {
 	struct fast_ant_train DM_FatTable;
 	struct rtw_dig	DM_DigTable;
 	struct rtl_ps	DM_PSTable;
-	struct dyn_primary_cca DM_PriCCA;
 	struct false_alarm_stats FalseAlmCnt;
 	struct sw_ant_switch DM_SWAT_Table;
 	bool		RSSI_test;
diff --git a/drivers/staging/r8188eu/include/odm_RTL8188E.h b/drivers/staging/r8188eu/include/odm_RTL8188E.h
index 96e50c9224aa..85a0d7ec7378 100644
--- a/drivers/staging/r8188eu/include/odm_RTL8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RTL8188E.h
@@ -29,6 +29,4 @@ void odm_FastAntTrainingCallback(struct odm_dm_struct *pDM_Odm);
 
 void odm_FastAntTrainingWorkItemCallback(struct odm_dm_struct *pDM_Odm);
 
-void odm_PrimaryCCA_Init(struct odm_dm_struct *pDM_Odm);
-
 #endif
-- 
2.34.1


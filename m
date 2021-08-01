Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464BC29D6
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 21:04:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id l34-20020a05600c1d22b02902573c214807so7094537wms.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 14:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q60uXeQTP2Txfa0NFG78DG60WBiDi0/WKw762Gg42iM=;
        b=kSjbo0aNgF7p31Zy2G0sMg2MXD//HBQNueCr8rIRLHtr8llYsteoY1Fw3V5Pmhs+wA
         UODX86lQRtUmIp7yWEX4IfvIT923V/fP72LnX+QFYBZdUMEJReK9/rKWTjiN5T3lLkfd
         WQCLlQ0YU9TxWt/Bui+hcLdMd3OtaKzl+72chJL87Ahe3JB9N/qa5yyVej/vhhCBixYZ
         zw5bj0KZENtO6JeAmq5Rnx3GCiBswj0pqNRZD6yC6wseIYGHF3Prb+vtV97u7FnqS9wu
         GGIf5r873blKED3ndE2wiHkxEMxdbyUxLfolEsoC90bEHQ79kZf5ZaF30hbhpzbYuxyo
         PcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q60uXeQTP2Txfa0NFG78DG60WBiDi0/WKw762Gg42iM=;
        b=fWrQDkYvFoFJxp0WRKT2GGru/wPDww7llHgLpXZYsjKM/wrn7ubd3+GJtD3CbQq3zM
         tM7/Ud7GTDTNuhjT8ABxelAnXmOc5wy0rqYPsyNktZK+5yVwN6ay8+17AhzELe2t4elT
         /PcEBA2YyhfoDMb6Jf1A9w1gFqbMcPHFTjqbgKHIMQNRGwHlBc+RH8qbvZWyP5YKWoHv
         TOMtITwA4hCITPmj5XUC7WDvAW3U70i91Ea0ORVac6fdDXoyw0FpnlwQDUPShRvhW3uX
         1xC+jQfxGML5vysyuwluGmpiPpmQ1S1zr3fJGKjjdzzjYT+3MjgQ3V6DaL1TBUIeEnCi
         lAlA==
X-Gm-Message-State: AOAM533DJZOjZ3lNJHWtnxDvJ0H+s6jxUtQx5FnMi0EP09GVA4qQD3Nf
	Q+8KKWYAX05ILDr2UZFTh7M=
X-Google-Smtp-Source: ABdhPJxY8AmkJlB+piBlfcZnffkEreQvzhidAaoVuKzLFVwqaqSs8jNZtSsKDOe+mIsRdKQK1FqCpg==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr13774388wmk.124.1627851873717;
        Sun, 01 Aug 2021 14:04:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id f15sm8629709wrp.12.2021.08.01.14.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 14:04:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove empty function odm_DynamicPrimaryCCA()
Date: Sun,  1 Aug 2021 23:03:54 +0200
Message-Id: <20210801210354.25218-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801210354.25218-1-straube.linux@gmail.com>
References: <20210801210354.25218-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_DynamicPrimaryCCA() does nothing, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c              | 1 -
 drivers/staging/r8188eu/hal/odm_RTL8188E.c     | 4 ----
 drivers/staging/r8188eu/include/odm_RTL8188E.h | 2 --
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 0bc836311036..08ec1e18b3f0 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -211,7 +211,6 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 	odm_RefreshRateAdaptiveMask(pDM_Odm);
 
 	odm_DynamicBBPowerSaving(pDM_Odm);
-	odm_DynamicPrimaryCCA(pDM_Odm);
 	if ((pDM_Odm->AntDivType ==  CG_TRX_HW_ANTDIV)	||
 	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV)	||
 	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 03fe29e16f1d..792284eac01f 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -342,7 +342,3 @@ bool ODM_DynamicPrimaryCCA_DupRTS(struct odm_dm_struct *dm_odm)
 
 	return	PrimaryCCA->DupRTS_flag;
 }
-
-void odm_DynamicPrimaryCCA(struct odm_dm_struct *dm_odm)
-{
-}
diff --git a/drivers/staging/r8188eu/include/odm_RTL8188E.h b/drivers/staging/r8188eu/include/odm_RTL8188E.h
index d6718186f2d6..776a8a6dab68 100644
--- a/drivers/staging/r8188eu/include/odm_RTL8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RTL8188E.h
@@ -35,6 +35,4 @@ void odm_PrimaryCCA_Init(struct odm_dm_struct *pDM_Odm);
 
 bool ODM_DynamicPrimaryCCA_DupRTS(struct odm_dm_struct *pDM_Odm);
 
-void odm_DynamicPrimaryCCA(struct odm_dm_struct *pDM_Odm);
-
 #endif
-- 
2.32.0


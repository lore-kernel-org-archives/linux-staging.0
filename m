Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC202C95
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 13:51:46 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i12so47792054wrb.7
        for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ok68sRc2xOIfCvTBrCJZswQdaMM1ovxmj3Sg5Olbf3c=;
        b=e/vQ8OpNsvfaGotJlFLTgx6var/MTxcCatXICfK6E5blUuPFGygomPgaUZ0NXyuepF
         Yhvo+L5BPULwjPDbaZwLpCffrDjiMUqY5+NtND8oKzWdFQ5hPteTUu1BeHiQda9pM8/m
         G5tDbVYFJJkn4r0e93Ltv389u4Yp/IX9PkBDeVCjZIaFMlvzK73gc/C+Ig9jrrnYWjf7
         5bnQlKVjVO1BzJnEr1C5nzW2TSLBHCw/2+2eAo+3YrVpigsdbUv25lAlmBei04DvH0Gp
         VDcYBYSZvuOxIGKsNWxq3LUaVBqgXaJ4JQzbER+7F80dCpfzrzMzvIfG5UoINyDEDIo+
         dEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ok68sRc2xOIfCvTBrCJZswQdaMM1ovxmj3Sg5Olbf3c=;
        b=MTPEMJkbSiaiLVepCeYjYeQNq7M3Q/ATK91zkXrlveGEVxPwjVJuHINpJvGJRi8Ooo
         gJYSaZqpOc6dMjBmZm1DdWnwGzs59syNu2Yqtoa2VI9WpUQKxaqH6EVeOBoOX8DhL/a+
         rcUCga1p4pBT+dV7vl4kChssD9Urkv8m0Nr5+eRzYngcpV0nAbPd6CrzsjiadI72h3Qv
         ax0DmSJ39EG7f8haCrbplYGbhxyc/0uldbRhRC66f3pJgrnCAkquDhrFCiZRsMGeCCFn
         UYZzSf2HEfeh91NjFdqHKyzo8h5K1ZCzssEtHnf9MxFJZ7AcEJOmBi/v+O+a56fPbiPA
         z7Nw==
X-Gm-Message-State: AOAM532sVdq97FSMC+2Gv6c4TL1u4Frregg13ZM927yb3o5dVdTL5m1X
	ko+ciqBLKqW3dnDe0I0za6k=
X-Google-Smtp-Source: ABdhPJxI5tXOwAS/0+QSOzjvfJ4wOUNEcAE9QKwg3PIhaf9BXN9yKQDpW/DxgF19mQl37H9cb23EQQ==
X-Received: by 2002:adf:9784:: with SMTP id s4mr45905989wrb.277.1634651504774;
        Tue, 19 Oct 2021 06:51:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id i203sm2280699wma.48.2021.10.19.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:51:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: r8188eu: rename ODM_PhyStatusQuery_92CSeries()
Date: Tue, 19 Oct 2021 15:51:33 +0200
Message-Id: <20211019135137.9893-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211019135137.9893-1-straube.linux@gmail.com>
References: <20211019135137.9893-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODM_PhyStatusQuery() is just a wrapper around
ODM_PhyStatusQuery_92CSeries().

Rename ODM_PhyStatusQuery_92CSeries to ODM_PhyStatusQuery()
and remove the wrapper.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 4772c2c0d50d..3125886e6731 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -362,11 +362,11 @@ static void odm_Process_RSSIForDM(struct odm_dm_struct *dm_odm,
 }
 
 /*  Endianness before calling this API */
-static void ODM_PhyStatusQuery_92CSeries(struct odm_dm_struct *dm_odm,
-					 struct phy_info *pPhyInfo,
-					 u8 *pPhyStatus,
-					 struct odm_per_pkt_info *pPktinfo,
-					 struct adapter *adapt)
+void ODM_PhyStatusQuery(struct odm_dm_struct *dm_odm,
+			struct phy_info *pPhyInfo,
+			u8 *pPhyStatus,
+			struct odm_per_pkt_info *pPktinfo,
+			struct adapter *adapt)
 {
 	odm_RxPhyStatus92CSeries_Parsing(dm_odm, pPhyInfo, pPhyStatus,
 					 pPktinfo, adapt);
@@ -374,14 +374,6 @@ static void ODM_PhyStatusQuery_92CSeries(struct odm_dm_struct *dm_odm,
 		odm_Process_RSSIForDM(dm_odm, pPhyInfo, pPktinfo);
 }
 
-void ODM_PhyStatusQuery(struct odm_dm_struct *dm_odm,
-			struct phy_info *pPhyInfo,
-			u8 *pPhyStatus, struct odm_per_pkt_info *pPktinfo,
-			struct adapter *adapt)
-{
-	ODM_PhyStatusQuery_92CSeries(dm_odm, pPhyInfo, pPhyStatus, pPktinfo, adapt);
-}
-
 enum HAL_STATUS ODM_ConfigRFWithHeaderFile(struct odm_dm_struct *dm_odm,
 					   enum rf_radio_path content,
 					   enum rf_radio_path rfpath)
-- 
2.33.1


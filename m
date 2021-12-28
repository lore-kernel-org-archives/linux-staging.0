Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F32CA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a9so37312565wrr.8
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g7uqoTKpq+D1932lWi4R+j2Cpn0lqrO7AJ2oZ+FkUIc=;
        b=GVkRRsSBZH2Sx4dnkSf9dBo6SlxUShXBGtS8qUAdFiXZZ+xmSe7WnC2sX5jtrULMbw
         +bLvgEw42GmGznPX7mv3VID/g327UuY4Ob8RD9z6Ha6eP0ynmryPR3ijmhCp+bOymr5L
         3w/O8n1L8Bp7IRvpn6iyzVdude+y64Q5FRzgiGCDRYN71l5NzXvagqlynxsRBc5QJXtO
         Isat7StxIgJEeIEqnF0mv+eswcfar7gx/jp7oxxrVijZ00JQKVSSBejzIqosuPlUuKnO
         iDMQ1/CZNKaP7JxPhAzl/3FbsX/LuTyyW4MXl8oyauEflw2ESiifR/AhMGtejk6JLO7m
         hJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g7uqoTKpq+D1932lWi4R+j2Cpn0lqrO7AJ2oZ+FkUIc=;
        b=HotPWO9OstbXP8ymoHcub0d2huQrdyuueruaUPxiaaZRJQ8Lj06aNo32HqLkjOkYCJ
         JaId7a3aa/mmzAl5jbJpQk0+cVCN9sXWcQeR2xfxrP4Wb4rEmHTBQ2Mi3DtHKIAt5U/a
         lUbKtgfQgSf5cBAe7AYj4+W17VCCy5D0px8a5UckMKFjUKesPWbFVaxh9v6hoh64MRWn
         JELpQr4BMCQEs/yPV+xzeLoc4b1e8REOrLtVYEakliiqVnkmGrxsWnzSBCtdLrXU6Pm7
         UL87YKb67BICKQ6xO3dlekBNt4HFPj8l4UJwJGPfqp8O4TaLJU5OTprFwOuwmyMz5tWx
         5+yg==
X-Gm-Message-State: AOAM530mIEuukjaM9AVhiu/qla7uVa1/hRDRr9ARwT2hbNk5sKH9t+ka
	HV/u19tUuztc9gFSnG2t0tEbFhDJboU=
X-Google-Smtp-Source: ABdhPJxVq0Q+bBVGVIxyuuOEesl233rv+pQay35hHKJCZos2FL9Sr2unQc1PxiLvwdVzSO4bkmZk9g==
X-Received: by 2002:a05:6000:18c6:: with SMTP id w6mr7844132wrq.449.1640686307485;
        Tue, 28 Dec 2021 02:11:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:47 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/10] staging: r8188eu: FAT_State is always FAT_NORMAL_STATE
Date: Tue, 28 Dec 2021 11:11:16 +0100
Message-Id: <20211228101120.9120-7-straube.linux@gmail.com>
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

In this driver pDM_FatTable->FAT_State is always FAT_NORMAL_STATE.
So the check 'if (pDM_FatTable->FAT_State == FAT_TRAINING_STATE)'
is always false. Remove dead code that is executed only if that
check is true.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index 1fb2d9a16fea..9de16383cb2d 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -251,15 +251,7 @@ static void odm_Process_RSSIForDM(struct odm_dm_struct *dm_odm,
 	isCCKrate = ((pPktinfo->Rate >= DESC92C_RATE1M) && (pPktinfo->Rate <= DESC92C_RATE11M)) ? true : false;
 
 	/* Smart Antenna Debug Message------------------  */
-	if (dm_odm->AntDivType == CG_TRX_SMART_ANTDIV) {
-		if (pDM_FatTable->FAT_State == FAT_TRAINING_STATE) {
-			if (pPktinfo->bPacketToSelf) {
-				antsel_tr_mux = (pDM_FatTable->antsel_rx_keep_2 << 2) |
-						(pDM_FatTable->antsel_rx_keep_1 << 1) |
-						pDM_FatTable->antsel_rx_keep_0;
-			}
-		}
-	} else if ((dm_odm->AntDivType == CG_TRX_HW_ANTDIV) || (dm_odm->AntDivType == CGCS_RX_HW_ANTDIV)) {
+	if ((dm_odm->AntDivType == CG_TRX_HW_ANTDIV) || (dm_odm->AntDivType == CGCS_RX_HW_ANTDIV)) {
 		if (pPktinfo->bPacketToSelf || pPktinfo->bPacketBeacon) {
 			antsel_tr_mux = (pDM_FatTable->antsel_rx_keep_2 << 2) |
 					(pDM_FatTable->antsel_rx_keep_1 << 1) | pDM_FatTable->antsel_rx_keep_0;
-- 
2.34.1


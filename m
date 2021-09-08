Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D03FD5
	for <linux-staging@lists.linux.dev>; Wed,  8 Sep 2021 23:10:16 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q26so5580914wrc.7
        for <linux-staging@lists.linux.dev>; Wed, 08 Sep 2021 16:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UZtUkA8uA7tyAnR1JQv0hvRBLsmltUOtKeKYLbxIW8c=;
        b=CqZQgiOgLva3wRn6rcX+rsQbs7Aihl/+1pSGLWlq4AcBHLL/c1D/xAq5P+E0T55R+9
         o9S3P6t25cjtHKTJMRTx9bxjYc0YelCDwox/bNZAtgQM2biglVLHQCJ3Bjm1p2frULep
         3axycg5ILdeRvg8YBG/FCyPdPwK/d+xpLgxnhjKnzrcomBhyI8G2SdguMkS8z0ZInJ6L
         C+n9tJDdmKY/NUNL5KBgWi8MEwNyW9M3oHGz3NLk22fcrs7xQ7SmSVxAS+VkMHvJJKg1
         IvmZ9Dc+E0kK0VEfgy7y/WrS1OvTnShW5UWJL6fEkgfubdCgFR6vV+v9N/1sWNMu/irp
         FlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UZtUkA8uA7tyAnR1JQv0hvRBLsmltUOtKeKYLbxIW8c=;
        b=J0ZffggraAJCjpzapUAMnTnJyZJieAXDmSo026NRs49gFdD831Jax92MX2Gb6+jFSc
         dNEyvx1KMmGYDj8QdDhobF26d6/U+FDSNLyHrbkCteZfCisAT90o1okt5UR0RYN5b1Bc
         UnvsxVs3NoI0S7bovoS/0uW8UOWKD1LfF0Ku0xpyHXUR7POuUeXzgNKzgdXrfBnNZbRD
         a+TpctNncVHbvQT2WZXvkWx88ecU4KuvL+xBdwVsEj2v70+phCQ+Ss2HShLAESQ+3cg1
         MQEQnbu/9xeuz7NHzRFxFBsbM6+doal9zdrx1UQwGqzCU5jJUZX+SL8OaQYolhqU5/Be
         Cy9w==
X-Gm-Message-State: AOAM530hjeoqcchSL9x4sI+SnUvbgxevoFYvFWmZ5SW5TxPF+58aoi2r
	S4J5Sk4XXD8PDV7R7hUm6jQ=
X-Google-Smtp-Source: ABdhPJwmbUd4K2WLg6p3JTv6MNdyVrJy5d1p4iVIYgBaZ8pfF54JFOCfZZmlSTF2Xw8Lv2Oc8WHkwg==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr65857wrn.418.1631142615093;
        Wed, 08 Sep 2021 16:10:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id l21sm348393wmh.31.2021.09.08.16.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 16:10:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused odm_Init_RSSIForDM()
Date: Thu,  9 Sep 2021 01:09:52 +0200
Message-Id: <20210908230953.16931-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908230953.16931-1-straube.linux@gmail.com>
References: <20210908230953.16931-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_Init_RSSIForDM() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_HWConfig.c     | 4 ----
 drivers/staging/r8188eu/include/odm_HWConfig.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_HWConfig.c b/drivers/staging/r8188eu/hal/odm_HWConfig.c
index ada22a526fee..db4c072ec6c5 100644
--- a/drivers/staging/r8188eu/hal/odm_HWConfig.c
+++ b/drivers/staging/r8188eu/hal/odm_HWConfig.c
@@ -356,10 +356,6 @@ static void odm_RxPhyStatus92CSeries_Parsing(struct odm_dm_struct *dm_odm,
 	dm_odm->DM_FatTable.antsel_rx_keep_2 = pPhyStaRpt->antsel_rx_keep_2;
 }
 
-void odm_Init_RSSIForDM(struct odm_dm_struct *dm_odm)
-{
-}
-
 static void odm_Process_RSSIForDM(struct odm_dm_struct *dm_odm,
 				  struct odm_phy_status_info *pPhyInfo,
 				  struct odm_per_pkt_info *pPktinfo)
diff --git a/drivers/staging/r8188eu/include/odm_HWConfig.h b/drivers/staging/r8188eu/include/odm_HWConfig.h
index 9b2ab3bcf992..790ab4d1eff5 100644
--- a/drivers/staging/r8188eu/include/odm_HWConfig.h
+++ b/drivers/staging/r8188eu/include/odm_HWConfig.h
@@ -89,8 +89,6 @@ struct phy_status_rpt {
 #endif
 };
 
-void odm_Init_RSSIForDM(struct odm_dm_struct *pDM_Odm);
-
 void ODM_PhyStatusQuery(struct odm_dm_struct *pDM_Odm,
 			struct odm_phy_status_info *pPhyInfo,
 			u8 *pPhyStatus,
-- 
2.33.0


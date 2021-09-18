Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E472FB6
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:57:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y132so9153238wmc.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BOVmXisC9Kf5hDyUsyWtLHig+wyv3YkaN9lOjzZc4oY=;
        b=igFpQY9euEUiSZkhPcKISese4z1KDicyU9+lAWaVLPDnSKk27lPWcF1ePBJahIdsv7
         tx8HJpijUrWj96wQVRoivZKYAEqC3tb2za2wQHP8XoRuOEPWjHTvYdW8c2i500vAD1nY
         S6ztO6LAQ/DLI1w7GStA/EXHH0W1VOHH9FLdrd9zKGHYzdpbvJPC8nHCvurSWrW17q++
         kkd/wUgrjcef4qKu5WvNR8Etm3+nLL8iyQCk1ORrQvV5dmGB5rwtBgF5Tvwhskas6XFU
         GUJ0MGuj/p92Q67bXZWC2sC6Z4D96WzQ3crXXmSciGuvGIngA+9zuc64BTVtptLVIgxk
         OgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BOVmXisC9Kf5hDyUsyWtLHig+wyv3YkaN9lOjzZc4oY=;
        b=Q4KI97rjeoSCm8mDaTLgEwUqHpOG9R7Q51E2Mc5d0BgUheyuKjklRW6o5HjNsvIZVD
         XrxbrogNAVtLzsoGlUaMGjV3Kciizc0m1rRYefujdgXZWRaQoJh7ZbGD4dBzl4PyyULn
         /AU+szQ1ecF0SJ1Or4eCtA7K2Z8pTF+PO+yt1+JLpWOviuwLUp34W51gBO0zWEzdGHuK
         C2eQHSxeXgvgF97LBH0tClLxTViPCNM3uj49ALR5pDiyrT7znaHG+x2FEyAp8iwkA2ba
         jmiKxa54qvjDmpXi4aTmxjc9eLyWZaeyUNrqG4Ej1t0ZxsX3D0a7cQ0c/zf0haJ2Js1T
         7ZjQ==
X-Gm-Message-State: AOAM530zq3QjNqbCds/6ZJksNjxtgoAJ95+EQb3cZGW6Sj4nC/4GBr/A
	w2VLvAIUau6bA9xFU8GnRzAvJUFPVs8DUg==
X-Google-Smtp-Source: ABdhPJxkxYgUiqcHePCYMycRsrvFc/+fQF1+klsgENTs3yBPlMZkzygOvZQcf0yKDnlz4I5U9RghiA==
X-Received: by 2002:a7b:cd0d:: with SMTP id f13mr1899552wmj.183.1631959076606;
        Sat, 18 Sep 2021 02:57:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:57:56 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/8] staging: r8188eu: remove odm_ConfigRF_RadioB_8188E()
Date: Sat, 18 Sep 2021 11:57:20 +0200
Message-Id: <20210918095727.13591-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_ConfigRF_RadioB_8188E() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c     | 8 --------
 drivers/staging/r8188eu/include/odm_RegConfig8188E.h | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index 1bc3b49cd67f..5f6f0ae5196e 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -34,14 +34,6 @@ void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data
 	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, RF_PATH_A, Addr | maskforPhySet);
 }
 
-void odm_ConfigRF_RadioB_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data)
-{
-	u32  content = 0x1001; /*  RF_Content: radiob_txt */
-	u32 maskforPhySet = (u32)(content & 0xE000);
-
-	odm_ConfigRFReg_8188E(pDM_Odm, Addr, Data, RF_PATH_B, Addr | maskforPhySet);
-}
-
 void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data)
 {
 	ODM_Write1Byte(pDM_Odm, Addr, Data);
diff --git a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
index 86b5b2d24210..634454bffdb6 100644
--- a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
@@ -10,9 +10,6 @@ void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data,
 void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm,
 			       u32 Addr, u32 Data);
 
-void odm_ConfigRF_RadioB_8188E(struct odm_dm_struct *pDM_Odm,
-			       u32 Addr, u32 Data);
-
 void odm_ConfigMAC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u8 Data);
 
 void odm_ConfigBB_AGC_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
-- 
2.33.0


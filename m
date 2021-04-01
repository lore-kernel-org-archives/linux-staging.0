Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC5071
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id o19so1167269edc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hM+Yde17Zdskg7zytVje3fm23lmUvElHVdMsmjIgn/U=;
        b=PyxaMyX+0l6pefqOOZhM2RfksB7zsbY+16qwKPV3O4BSMwf57q/eruJNE9Nh13KOkE
         9HHAiFNPrZx2UgHpG4x+t151H9FsyrXcViAbysVXpGxbaMCNlJqTcB3V1FdrQy2DYiF7
         mYYHIQgzLfrxhU8kfkmJw+idBcdNTfh8H9QYHiB1BANGJP6XkFSoEyl7S/sjpx8ohYso
         12UnCJTVOp8dHEUUZKe5hpRXfnsIi15M5W+uzMnTVTPtZtRcfZPHUEcMbw1Q9sleQba5
         J0FNoTBw1Uad+3KT4GrSURR2vGS24a2+KS+R2HrngrQOpjX6UeyxMtugAKoFApfVldlw
         dvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hM+Yde17Zdskg7zytVje3fm23lmUvElHVdMsmjIgn/U=;
        b=bAbLY1XW2fRs+MceXXJeChTM7skHwX8soS3tUh6P05xP2Ms+XQHMgWz8zKNpiMQumG
         FbnX+IayySegLC88mQNpMQ/qcR4JkKh+D2v1JrWJLAW/CUCO8D3Y6RzwJiqt4Yy5rKJB
         E+pIowQnQWOz/3Qvn5W2xYIjWhB8gfVNg8lJkfeIppOzgi6qIOguAjrY6FEFDsDOowNW
         UPfHFK8/Xsjtn7r8cNKpTwIjJgBXdCLis7iOxLW8cbAgNH3nhe4yXnIHPO53TUrqDg9e
         N/qyqYCSboRclZltcm/uLh6ZhoDuN0GfB/jKs3T/BCVFkP4P6rlwnF2MP2YXyRlXrZ8S
         pydA==
X-Gm-Message-State: AOAM531ti2q1c1WxurVNVaFclyMCA98ms3Dryr4I2Z2xcKJaZ+OKcTnr
	idl29pcC0tDZh+LJ/BDZ0q4=
X-Google-Smtp-Source: ABdhPJwCZocLXSE5ugKLapKC5x+a7wEvYaP7HQ/21h8xxTk7dbz8DpyGUDA/317TuEogqcRINEVKbQ==
X-Received: by 2002:a05:6402:3592:: with SMTP id y18mr8594052edc.360.1617268929876;
        Thu, 01 Apr 2021 02:22:09 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id p3sm2538709ejd.7.2021.04.01.02.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 28/49] staging: rtl8723bs: remove empty if blocks in hal/rtl8723bs_hal_init.c
Date: Thu,  1 Apr 2021 11:20:58 +0200
Message-Id: <aff7710e7a36e99348eab7aacac525ab796c17fc.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty if blocks after RT_TRACE deletion

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index fbc6ef0cfe0c..df15b9c206f3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -64,9 +64,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	blockCount_p1 = buffSize / blockSize_p1;
 	remainSize_p1 = buffSize % blockSize_p1;
 
-	if (blockCount_p1) {
-	}
-
 	for (i = 0; i < blockCount_p1; i++) {
 		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
 		if (ret == _FAIL) {
@@ -82,9 +79,6 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 		blockCount_p2 = remainSize_p1/blockSize_p2;
 		remainSize_p2 = remainSize_p1%blockSize_p2;
 
-		if (blockCount_p2) {
-		}
-
 	}
 
 	/* 3 Phase #3 */
-- 
2.20.1


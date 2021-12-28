Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181F2CA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:50 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k18so649298wrg.11
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yX6WsvFj3mzN8+krDEd2nQc532OtlqFbEGHYa+8owtg=;
        b=CHqtD85QiJVOrksiY6idhWxmYujhHyOhKTQI7XM9wP4NbStnJumSS2PoIywdrz2tWB
         0TuCLwFgOPv3VrjrwEvgEQ8JNungyWnloDxjZYXoENP6jgfRKZPNaPivRm/3xNJx1cj8
         iV0U8R2xJE+2Fvb44pUeapqDxTLd+EVVX8DMT8QBSutSX+uSYhISEJkT0ry5AQu6UKXT
         QCO9uIuk+I424oHn3wQ3Fjv+wkd5UA9nhJDLXU9u48I3WNkkynQQ3/HHNMlpgdkfbtBh
         l7SMuwWRtytA6//x5XOXmnON450PNLk7FmXlkdFhvTaJFSBR8z8SgTA6E1QmfSHLkDdF
         LyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yX6WsvFj3mzN8+krDEd2nQc532OtlqFbEGHYa+8owtg=;
        b=whs/FxEuXhYHmK73oJ0I2tjpNWCrXpf5hVAAscySroZHDN7Z/WT08Bjz5rD/N2i2DT
         n5o22OvwTP1VyQ299tXDQXOg2gjrvlpY+wu0RTBaBBpI5feuVGKO3PvMa6G2vbWxwso+
         1bjaA7EgIXuv2pw0VU+BsxPMUiBcZkbANQ2XQOSrRakPj7UnyBRZhVexuDpVeQa3MnQe
         pROATqUFiEpcpsPKe/jJTXp3dV7l6P910uBsr7UBp4bqEN4lRJBg56m2oGJTbVUuIVVY
         3BXUaxzgqJoWXhIBpSmq/JatlaNs1DWA3akOHA09L+y97OaqhJ/rik+gHghqOZ9YhI6D
         8jOA==
X-Gm-Message-State: AOAM531FMAGlfFijTxkgT6EwFRueZXzKk3pnLJQpuVR6rCkaQEfm1fpH
	a7oQkMFfmFmLh9yPqiVi0cI=
X-Google-Smtp-Source: ABdhPJzegxx5hMNs0p3/9iYzdbhROmlLk6Bx1Oc3qbdik5CJOyuzgGdLldW4RGhoSQXoAcHfbacrSA==
X-Received: by 2002:adf:ea8c:: with SMTP id s12mr15894183wrm.342.1640686308890;
        Tue, 28 Dec 2021 02:11:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/10] staging: r8188eu: TrainIdx is set but never used
Date: Tue, 28 Dec 2021 11:11:18 +0100
Message-Id: <20211228101120.9120-9-straube.linux@gmail.com>
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

The field TrainIdx of struct fast_ant_train is set but never used.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RTL8188E.c | 3 ---
 drivers/staging/r8188eu/include/odm.h      | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RTL8188E.c b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
index 1dcdf6a131fc..eefa448d2002 100644
--- a/drivers/staging/r8188eu/hal/odm_RTL8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RTL8188E.c
@@ -57,9 +57,6 @@ static void odm_TRX_HWAntDivInit(struct odm_dm_struct *dm_odm)
 static void odm_FastAntTrainingInit(struct odm_dm_struct *dm_odm)
 {
 	u32	value32;
-	struct fast_ant_train *dm_fat_tbl = &dm_odm->DM_FatTable;
-
-	dm_fat_tbl->TrainIdx = 0;
 
 	/* MAC Setting */
 	value32 = ODM_GetMACReg(dm_odm, 0x4c, bMaskDWord);
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index db72eea83382..a037d7b863fb 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -387,7 +387,6 @@ struct fast_ant_train {
 	u8	antsel_rx_keep_0;
 	u8	antsel_rx_keep_1;
 	u8	antsel_rx_keep_2;
-	u32	TrainIdx;
 	u8	antsel_a[ODM_ASSOCIATE_ENTRY_NUM];
 	u8	antsel_b[ODM_ASSOCIATE_ENTRY_NUM];
 	u8	antsel_c[ODM_ASSOCIATE_ENTRY_NUM];
-- 
2.34.1


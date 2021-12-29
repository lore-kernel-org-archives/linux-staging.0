Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8D2CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:38 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id a9so46504542wrr.8
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IOo319fzjEUISZs5YH9GJVr9iNceoSjpl9nm5JKLpLQ=;
        b=TAbOBgbUuQTficM757lP2hK188zm8Dm3LZ72aLeoAOG6iq3W3TAf0oKmNmSGcu67FZ
         zuhrAXwMYNQdzJwZ6w3yA9ys0cJS8YAU1Ukjlh6N6YEhTCDHz43vQvyUbzYZd7cqipgH
         y92YVNo/n8eh6XQRPNgomORSexiVQxOrmqNybdmDVqOjfyV52gQaEkw/DIaYj36/kjk2
         fbEJ1VdWk2F2ufe7lPpkIBEqP6c7Qi4/j5W9cJgi1TYb9mePmxY0mmH0IJDx/0Dhn10J
         t4rBXft1YF9ZIF2XwSTjhUUbpZz0nt2LyI79HuFg2rbIndFvMc2WsL0cATWcS3ajjSLF
         agrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IOo319fzjEUISZs5YH9GJVr9iNceoSjpl9nm5JKLpLQ=;
        b=D5v3Rm5HqrdslJSRnF/xT4D/rO1bjHI7JuxytEqJ7PPLoq7pSHm4fvXjiz6cN1tY2v
         jk9/Os77NtbBr4bW5WhkqKxr/6n2HlHzumkix8tfVy/Nv6GrtNfazkXKXxiWbm+tACKD
         pRrfvLAkTQz5EQYes8mZLmktLMX6K2JESFOvkCnrYRGg+dVrnuSdKLW6s2TwDUGSc/wD
         ceWrGObCgAtL7iO4OlvcKf/YCRB1H0JqaC7zB/8AdZ9ceq0SyR3mFBspcfET+nJCDvv4
         B+0OlP67vLYx2TZeOvEu9lOfzD7ZLL4Cfkv7TEImYi9wiwrVOMUje6Kt3zoI8IOx/sGL
         dNxw==
X-Gm-Message-State: AOAM530Y//DST6wl4+kxPzROMowCZgXlzqzntcY+pyZgyQMbLoZ3qmgu
	jdCODcHBR2SkpJt3MNNzl9M=
X-Google-Smtp-Source: ABdhPJwp0yJzthg0rlbGx92oO4njXNnCTWGOCf2HKFqEwWwnheMmgOSW8MysMWgcihKXHkCTUje2gQ==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr22246992wrb.455.1640811096455;
        Wed, 29 Dec 2021 12:51:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/32] staging: r8188eu: remove unused prototypes
Date: Wed, 29 Dec 2021 21:50:50 +0100
Message-Id: <20211229205108.26373-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused function prototypes.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h          | 2 --
 drivers/staging/r8188eu/include/odm_RTL8188E.h | 4 ----
 drivers/staging/r8188eu/include/odm_precomp.h  | 1 -
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index c07dbf763903..793068778833 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -558,8 +558,6 @@ extern	u8 CCKSwingTable_Ch14 [CCK_TABLE_SIZE][8];
 void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI);
 void ODM_Write_CCK_CCA_Thres(struct odm_dm_struct *pDM_Odm, u8 CurCCK_CCAThres);
 
-void ODM_SetAntenna(struct odm_dm_struct *pDM_Odm, u8 Antenna);
-
 void ODM_RF_Saving(struct odm_dm_struct *pDM_Odm, u8 bForceInNormal);
 
 void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm);
diff --git a/drivers/staging/r8188eu/include/odm_RTL8188E.h b/drivers/staging/r8188eu/include/odm_RTL8188E.h
index 85a0d7ec7378..3c6471f1a893 100644
--- a/drivers/staging/r8188eu/include/odm_RTL8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RTL8188E.h
@@ -25,8 +25,4 @@ void ODM_AntselStatistics_88E(struct odm_dm_struct *pDM_Odm, u8	antsel_tr_mux,
 
 void odm_FastAntTraining(struct odm_dm_struct *pDM_Odm);
 
-void odm_FastAntTrainingCallback(struct odm_dm_struct *pDM_Odm);
-
-void odm_FastAntTrainingWorkItemCallback(struct odm_dm_struct *pDM_Odm);
-
 #endif
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index a0d5e870c11a..7f08f2d0a671 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -36,7 +36,6 @@ void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
-void odm_SwAntDivInit_NIC(struct odm_dm_struct *pDM_Odm);
 void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm);
 void odm_FalseAlarmCounterStatistics(struct odm_dm_struct *pDM_Odm);
 void odm_DIG(struct odm_dm_struct *pDM_Odm);
-- 
2.34.1


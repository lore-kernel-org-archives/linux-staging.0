Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3B22CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q16so46591153wrg.7
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gZnd6cWt7MVYERmaH5u+uHWZ+MW0YO45dvPr1gOum30=;
        b=QSxRh+0cp+AwBfATOeNjzKsu35QTIOcbXXcNyDmQEfyuJ8yKmYfI6JhHyz7+zYjqRr
         iMSLl0Mv8L1TSoSXJD96wn1mRg8YiPDFVlSAqdXmO4fmO5xKquLn63h0PQJVLhYr5a6y
         zKi3d8qAe3a9WxkPYJAOyTgo0CoM001MmhVCJBIT0yacyqK3mb2+aJeo2ao0MjJR5MRD
         aTGs1DybfAHekq1hf0xzFxFyhxH22W1mnU6lEUayw5791hrUL1qMOMMgSFUgWm9vkfq2
         0+P4ez+ZR8ay1MeZzMwU+HFxXCSrfg6MFlP8U+WydM/rSGV3MXuSZEBX4Zfmqh0d4Q4G
         UUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gZnd6cWt7MVYERmaH5u+uHWZ+MW0YO45dvPr1gOum30=;
        b=U4Jm5hNhNuLUfcLiONMi6r7d8pozIkLzKRWbj9bJZ+mB/efMFDL1GOPp89U6C+glNz
         ynLss7Hmbk3WhCP9LSRC4NIjneeH8cDCp5iYSE+/4TcTxFR3QLe6S09JvKLNUzv9v+2f
         yTgbBy7y8xHdGyWQ7dNVYdsWt43IpBk4QpIfRTFY0AuCmTVfoArDhr4AA2Ks9pzHRQ9S
         ojyQuxseKO/XH3YMaTrPoswLXOZSQ8iBKGKsQ1Rf0zKvUKgdriivrHNvSD65Kzbot4DL
         Omml2ZOoFBOS1VQwmNkwUNcthSS9/+EQ6anjRBrn1Y6BwPArYeYull/dIR0XHSagCQVg
         9Qjg==
X-Gm-Message-State: AOAM530J+3CzMJYU3soa8BSpc1SKcal+8Hd4h+3eK/RRq0swu75Nh5gr
	VhlGUXmkC1gJ+aITqYzecd0=
X-Google-Smtp-Source: ABdhPJx4jw+xVZACcogiHz33fvceG5A+HwGrMEZpeJxhPDE7ulIBOR9rFGATRc2ALNW9lEhTQvQymw==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr22130708wri.145.1640811105727;
        Wed, 29 Dec 2021 12:51:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:45 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 27/32] staging: r8188eu: make odm_InitHybridAntDiv() static
Date: Wed, 29 Dec 2021 21:51:03 +0100
Message-Id: <20211229205108.26373-28-straube.linux@gmail.com>
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

Function odm_InitHybridAntDiv() is only used in odm.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 16 ++++++++--------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index fc402824bed0..e067e46ccf64 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -536,6 +536,14 @@ static void odm_TXPowerTrackingThermalMeterInit(struct odm_dm_struct *pDM_Odm)
 	pDM_Odm->RFCalibrateInfo.TxPowerTrackControl = true;
 }
 
+static void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
+{
+	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
+		return;
+
+	ODM_AntennaDiversityInit_88E(pDM_Odm);
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -851,14 +859,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
-void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
-{
-	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
-		return;
-
-	ODM_AntennaDiversityInit_88E(pDM_Odm);
-}
-
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm)
 {
 	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 7150228dc8d7..c3fce8b91a5a 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -33,7 +33,6 @@
 
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
-void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm);
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_PRECOMP_H__ */
-- 
2.34.1


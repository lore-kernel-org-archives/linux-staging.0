Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAE3FC3
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 08:29:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d6so8061637wrc.11
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZccAzt1xxxXzq/Q0/mhYP15uyP5RiZKfB2//wDW8cY=;
        b=mvWbX36gCST29e6vttj8Wd+a+X4DEEn1xewKjXhYnUCJeLVVDjJyOP3CdJOBhfgT9g
         EUN3xwFbxtQ7C58cH9EwYNuKdQRaChmlhUZLYOHkMUL2/RDvZ5/qKe51CxRPJ5YqV/AV
         A6RgQKoFX5fQE2POGIkopqyiG4RCiOJEEIwSOVZEnCh0gQ0WYyvnQM+WJxgZw/S+gXDT
         1tXebLWkyQxx3kgKOHfQlYIUYnR3r0lDlK6qZrMt+zwOGoUzj+bl2LyrJylCNPxjt7Tb
         tPwXhFfjUFGbUkpKLoMxYIZKUXk/eZuNGuNxYtglpGeHuEo2NUsc5BdcYvWMEG4ZbhMx
         lYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZccAzt1xxxXzq/Q0/mhYP15uyP5RiZKfB2//wDW8cY=;
        b=V4aMTxIxWpJFyK1Cyz0lu8hTMNB3vZAkrCj2zcSaGhzi7xFtDB85BePGnApXByIdYc
         WpkvD6pR+8Lrw+KVpeP4/x3Cq6rC8Z1K/YLzc+gTngu0TFvTvUUe8j79RRVJfU4VTwnv
         5GN/w/pVBDDJZD+p7zBHUQXwvshyWSf+c7miwA3iHAwcVbOk7gBdmrDDsxXF2gsVRRCs
         TPqC8C1xsqi4uIujvnTRO+Vt/fp3KCjVVZhjbEdHHEQiAm+HBuccsbsPa11ihrM8Zo/h
         9VPFk1qjBiBfdnYnjBvhMbM3+6leAStohoDA90i0M4CRImJMrnjEwNXM4JNfHaiBYwxd
         OHBg==
X-Gm-Message-State: AOAM532qRLWLHRFz0fYcs6OpZ94/iY7uN8oXNcb+4wLyUQD0cAcHzASz
	95xG7HwBSzlZjVTSt+2O/eM=
X-Google-Smtp-Source: ABdhPJyR2DRZ7H5uDZ7Bb89R90sHWZlhRwRAKCyUa7W2osBroCZ8dH10oEGaFUlrNPyw2c5pbBq5Vw==
X-Received: by 2002:adf:816f:: with SMTP id 102mr4571518wrm.368.1631780955905;
        Thu, 16 Sep 2021 01:29:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id d129sm7458079wmd.23.2021.09.16.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 01:29:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused ODM_RASupport_Init()
Date: Thu, 16 Sep 2021 10:29:05 +0200
Message-Id: <20210916082906.25294-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_RASupport_Init() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c     | 10 ----------
 drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c b/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
index d873672feb27..8a6cb18b0f29 100644
--- a/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
+++ b/drivers/staging/r8188eu/hal/Hal8188ERateAdaptive.c
@@ -471,16 +471,6 @@ odm_RATxRPTTimerSetting(
 	}
 }
 
-void
-ODM_RASupport_Init(
-		struct odm_dm_struct *dm_odm
-	)
-{
-	/*  2012/02/14 MH Be noticed, the init must be after IC type is recognized!!!!! */
-	if (dm_odm->SupportICType == ODM_RTL8188E)
-		dm_odm->RaSupport88E = true;
-}
-
 int ODM_RAInfo_Init(struct odm_dm_struct *dm_odm, u8 macid)
 {
 	struct odm_ra_info *pRaInfo = &dm_odm->RAInfo[macid];
diff --git a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
index d5ced507a648..20d73ca781e8 100644
--- a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
+++ b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
@@ -37,8 +37,6 @@
 	LE_BITS_TO_1BYTE(__paddr + 6, 0, 8)
 /*  End rate adaptive define */
 
-void ODM_RASupport_Init(struct odm_dm_struct *dm_odm);
-
 int ODM_RAInfo_Init_all(struct odm_dm_struct *dm_odm);
 
 int ODM_RAInfo_Init(struct odm_dm_struct *dm_odm, u8 MacID);
-- 
2.33.0


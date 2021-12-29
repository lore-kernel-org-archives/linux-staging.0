Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343602CA0
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so12311710wmd.5
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wOhkadV2itJwAv/GvEQUKWrwh58wZeAOeButqgCJq9Y=;
        b=c49B6FA8VAaPILfJ8AynON0+ZbjnNhMHkQwrHOFum9aCyp6lBmOLjsjrQmyqMFV+t2
         5cGAlcEghP0gZlGFzs90SbxJcCiLuxgZac7kp0KC5xGmKwG+sA6eNumelSXHdSSC9/rM
         m3WwoqG5WHBm5a8mo4crPKNMnXh9+6RvK6l2xjfzAfGMvvOl/CcJ3Pk/z6/9/QuD4FRA
         xZuxz955Q9Nb37O59cKT5Feovm4ESgPG5796oe+Ot2DqlSYhRZOTcElNwCNlL6xCxFow
         e/oSkQbvXeUUodWaJKYqSTUsf1XgMwBbF+rxNHoSMwLkuUjCYj9ICOhyOcjtiDzr90SF
         9dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wOhkadV2itJwAv/GvEQUKWrwh58wZeAOeButqgCJq9Y=;
        b=Km3JDymjXSrhBTTyH96yFHDUKYy3BiePiPDa52pKxaLByVmZu/pZahXePVjzGFrFmd
         922p3891EuSP7hJfvdsJqHAZqVbS1BaOhB7HJBvf2fgWxpeQBXML9z0obErwmwBxvHHc
         o1i/1dr+5izctdEnH4sFqZeU4en8AjHSPLWH4M9EoEMrNQDtbC5sCMJ2JUtUs4V4UMOc
         bZH8b4U0/AYhpsF8486ehr45bP0GYZAuyMHvhgwHQLZxh52mcFTK5B1hhhrwzcC+5EVw
         hnikixnI4VH0gctEtmp6UYBmZfZhb0i0LPuweJ8pIVRc6msh94djEwx9CCn+5ZqcrHqc
         rnIQ==
X-Gm-Message-State: AOAM530QKt+kC9CYTPJ5U9Nwf1Y6I6d2XKr+l8F88pwRkCe8q5ZXajgC
	oS/3iwG0EbWrPfUTk72fy4k=
X-Google-Smtp-Source: ABdhPJxt+fgvQCT/26rtHFS8bWw32/PoNWSnjBgMOF7+QXZND6MlMKkARfKgDfQy/emWLHr04koofQ==
X-Received: by 2002:a05:600c:4e11:: with SMTP id b17mr22973958wmq.66.1640811095717;
        Wed, 29 Dec 2021 12:51:35 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:35 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/32] staging: r8188eu: make odm_ConfigRFReg_8188E() static
Date: Wed, 29 Dec 2021 21:50:49 +0100
Message-Id: <20211229205108.26373-14-straube.linux@gmail.com>
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

Function odm_ConfigRFReg_8188E() is only used in odm_RegConfig8188E.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c     | 6 +++---
 drivers/staging/r8188eu/include/odm_RegConfig8188E.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index 3f1e30eb1a15..a74c05cd97b0 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -3,9 +3,9 @@
 
 #include "../include/odm_precomp.h"
 
-void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
-			   u32 Data, enum rf_radio_path RF_PATH,
-			   u32 RegAddr)
+static void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
+				  u32 Data, enum rf_radio_path RF_PATH,
+				  u32 RegAddr)
 {
 	if (Addr == 0xffe) {
 		msleep(50);
diff --git a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
index 634454bffdb6..683fa4a07956 100644
--- a/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
+++ b/drivers/staging/r8188eu/include/odm_RegConfig8188E.h
@@ -4,9 +4,6 @@
 #ifndef __INC_ODM_REGCONFIG_H_8188E
 #define __INC_ODM_REGCONFIG_H_8188E
 
-void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr, u32 Data,
-			   enum rf_radio_path  RF_PATH, u32 RegAddr);
-
 void odm_ConfigRF_RadioA_8188E(struct odm_dm_struct *pDM_Odm,
 			       u32 Addr, u32 Data);
 
-- 
2.34.1


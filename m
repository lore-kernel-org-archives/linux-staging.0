Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE42F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:21 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id l4so105603347ejc.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=XXxZS+Z7Ypr9xzn70/A9s61xGFF3f+eaDxkfhnGgVDxqkW8v/wn2f3r5J9PPnnKIWe
         UwXw+pS8MIw1HfzCzUiNmPppaan8H8wCyhirfqjkcUJtBeU9mZN+GUF8oAvRwvbLWexI
         V45OuxGkd/oi519sqvm4uiV+RETXTU+4gyLXtiFFDw3AEvTS3aL7hEdjJSqZrVPLetNr
         niE31dU8zV04h1v9yEryL7BPuWY9v2FLUr9UxUoZpNEcB+p4rXqsAKMhjHrQRMtdh/E7
         iDHAb8/rItc30eaT94MNS00mAte28YOFAt68/atORqe6V23E5vqo69+/2ZaXpr/pSvJb
         WIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRDjGF5wjUwRiaPQw2H+cRKReTA8UwpiAU5+UbMDALU=;
        b=uDwnQ5o4oOfwlZMI8XMcOO2m5TmiUISMi6Nz0sykW6hQtZSOtKgw67q/xCEzk3NI73
         ct5cVGLgmvhQNd0dAzPVqZ1z60blHAiw16Yz9oIBbMk1UxZjqPqubPgnzh8qiN50MdEV
         4BEmjjbxvQayEo33tpVJrGBee+ZD6yRQxPJP0X4GJ7ftWW4WtgIbWWfF37e5DILlLBxa
         1FIiMXwzrCeIL+hLdBGOBwnICaxX947+XkQRE+Dq19f+vK6VKp6hq+HpbSu0taqKJ3c9
         b6zEjDC3huFHsDr3z0cLN60i1sxaVUhXwRfwCgmk0oPKY0SuI92UGuYB0VvOoo+QS5cW
         SA0g==
X-Gm-Message-State: AOAM532RASb1yZ5+e3jTdFMRHc+voybKD/TEvBxXCjlGlJXJxjvrhFN0
	1fNRHGFZrQa6W1gqT+SGLYw=
X-Google-Smtp-Source: ABdhPJydPnDG0ac7a/7cVdMPdo6C09G6PY8Bo7KWkb0WW1iQ3g1SJA0Fg6O0MmL/jqTQaj9qa9dGRA==
X-Received: by 2002:a17:906:3544:: with SMTP id s4mr4804801eja.73.1619793859816;
        Fri, 30 Apr 2021 07:44:19 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id l7sm2201099ejk.115.2021.04.30.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:19 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/43] staging: rtl8723bs: remove empty functions
Date: Fri, 30 Apr 2021 16:43:33 +0200
Message-Id: <1430232d3b907ee4d286cc495429230a0dd4dce2.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove functions left empty after ODM_RT_TRACE deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c         | 4 ----
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index a9f8d6a4a62c..73068a1681a9 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -807,9 +807,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 
 	ODM_ClearTxPowerTrackingState(pDM_Odm);
 
-	if (*(pDM_Odm->mp_mode) != 1)
-		odm_PathDiversityInit(pDM_Odm);
-
 	odm_DynamicBBPowerSavingInit(pDM_Odm);
 	odm_DynamicTxPowerInit(pDM_Odm);
 
@@ -857,7 +854,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 
 	odm_RefreshRateAdaptiveMask(pDM_Odm);
 	odm_EdcaTurboCheck(pDM_Odm);
-	odm_PathDiversity(pDM_Odm);
 	ODM_CfoTracking(pDM_Odm);
 
 	ODM_TXPowerTrackingCheck(pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
index bedce2c10b22..1a2e367bb306 100644
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
+++ b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
@@ -7,10 +7,3 @@
 
 #include "odm_precomp.h"
 
-void odm_PathDiversityInit(void *pDM_VOID)
-{
-}
-
-void odm_PathDiversity(void *pDM_VOID)
-{
-}
-- 
2.20.1


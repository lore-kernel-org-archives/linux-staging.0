Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C572CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v7so46497514wrv.12
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQA7LVKqvDnPuelUA4+jyIgMnVTumcfi5D4swJ7Rfsc=;
        b=WGfUfO1AnVZ7NSvH0OFn8WnlyWFfF2yfaz2YzBA4fsrflsJew8AM+U1OoNCikBkzFu
         V5Ach7yGWVUcpyeCRlKc8bUoLuH9LKf18T2HRruvPYR9NvaMwa7tbuNJX2UkKCqhc/ub
         0BIglehDFz/7q6sC+5vDtYvejHX4gILR55AiuITD0xaatxFZM9/mTNpQWmG57m1Ur3Rv
         C3QBIsII+LRPNG/ZxP6nTyfysXHyqYK9Yqe8DrXAmC8s7FrNrx5sfA+xe8CM9GaxMf9x
         x2nNeRv0Aj3WCZpiYUj87lQ8h55/5gnOhbNZQ3JKl+2oypF/x9PADjFqraTK0JtxZM/E
         HbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQA7LVKqvDnPuelUA4+jyIgMnVTumcfi5D4swJ7Rfsc=;
        b=iVKslpnkQWm2Vnmk6pz8EO3gmmHRJzcxuIfJAXIWP8eIx6dPv0fmvSlxxk/6op4qyN
         kKu4MWPmxVQAfwtBpR3RdW/9nhlqPiQ8Xh+PG7l/ETFnpbK0xHo31Tq6L9QICHnr9oUp
         rNPJRMJWY+RgFoRiWTI9qfOY/tE/mkQIkOndO1wjzXWq0swqt+k4s3Ncv59dj3s2jb8d
         lz3U+eHc7XX6BDHKBIIsGHvhngvJofEooWVE5tyvAc6GndzGnRCVphhN+Sw9w9D5Nm+g
         djqpdv/AWlqBJxdGyG24i/a4sYUYNkOgwhzGz8Fy3E4B6ao1Rx7EWyyPrkiJrWLFx0xy
         ohNQ==
X-Gm-Message-State: AOAM5332d3RDa2iO1c0alwq7XUw3iQJObpk5RU0aNSW1zcCJUM426oRA
	DWZUf1D4glNv/8rk2pxmFOxBhk7kIDw=
X-Google-Smtp-Source: ABdhPJyfNgwEjgNdz35ANn/DxnLLKaRPAHpm/FDEr5rVs/GBVpn/vfQOzM7YkksIHsuQuJVQsbXkmQ==
X-Received: by 2002:a5d:4dca:: with SMTP id f10mr22545866wru.595.1640811107208;
        Wed, 29 Dec 2021 12:51:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:46 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 29/32] staging: r8188eu: make ODM_EdcaTurboInit() static
Date: Wed, 29 Dec 2021 21:51:05 +0100
Message-Id: <20211229205108.26373-30-straube.linux@gmail.com>
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

Function ODM_EdcaTurboInit() is only used in odm.c. Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 18 ++++++++----------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 14020a3e67d4..9afd9ed10432 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -552,6 +552,14 @@ static void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm)
 	ODM_AntennaDiversity_88E(pDM_Odm);
 }
 
+static void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm)
+{
+	struct adapter *Adapter = pDM_Odm->Adapter;
+	pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
+	pDM_Odm->DM_EDCA_Table.bIsCurRDLState = false;
+	Adapter->recvpriv.bIsAnyNonBEPkts = false;
+}
+
 /* 3 Export Interface */
 
 /*  2011/09/21 MH Add to describe different team necessary resource allocate?? */
@@ -867,16 +875,6 @@ void ODM_TXPowerTrackingCheck(struct odm_dm_struct *pDM_Odm)
 	}
 }
 
-/* EDCA Turbo */
-void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm)
-{
-	struct adapter *Adapter = pDM_Odm->Adapter;
-	pDM_Odm->DM_EDCA_Table.bCurrentTurboEDCA = false;
-	pDM_Odm->DM_EDCA_Table.bIsCurRDLState = false;
-	Adapter->recvpriv.bIsAnyNonBEPkts = false;
-
-}	/*  ODM_InitEdcaTurbo */
-
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index fdd0e2355c69..d6046cf9645a 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -31,7 +31,6 @@
 #include "odm_RegConfig8188E.h"
 #include "odm_RTL8188E.h"
 
-void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_EdcaTurboCheck(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_PRECOMP_H__ */
-- 
2.34.1


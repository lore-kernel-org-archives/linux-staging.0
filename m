Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CA3FC0
	for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 19:47:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g16so165333wrb.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Sep 2021 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=czrP6QE0oWPp2IhYAOngMIyhTl+nVLIjWbQ3m00v7QA=;
        b=m5Sos2iGL079vJXKEZQ0e8MA2dClwVyjJsPWI16owIYwRZRYxP0mSFZ+Zqrt488qX3
         RShZ0A/GdtU548amVYVZox2QpsA7NZxcEXvWzZLZUBs1ypUCamBBAiWfG65nkwzHCY8N
         1yUWubXS1qRm89HH46cpWc29DxdjIDtl8xm8z1R292CDOUKzer89p6fSAcovP4RktQM3
         x2KjEnnTlTVzIVzC8ZeqIdZDu6MZMA7fuoqriDmhn4HWBuKgbHyimhV4tRZoxuqaodoM
         Q9hUqOhPfCXgPfyanRxSWP8KpM+qIqOKsE0anM++A9H1tfamXtALllAcWtYJBrgGS2fa
         HJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czrP6QE0oWPp2IhYAOngMIyhTl+nVLIjWbQ3m00v7QA=;
        b=UuWuL22AuS2ti/rfrfA99i6W9QAIoAASL9fLi+6s8IekREgVU/Gu9gVQo+yiulYDpU
         n+ttQimfFRma9YihaNmhoZ1FWQd5SOZ5WBnYgg/O2KjipEh82GC46kFGbZZtjXvIZ/8f
         cbDp9H3GUpQ7UQpDM6085Gygatzu094Xv2i3fi3hw8PSqdx4a1gxcOcLJO1EGekJG2jZ
         8FTLhO8XmAQMeKeTVG6fctoEkB9JfrT3EeTL49Cxb3rJ77nYPK2j8T8azZZY/hn5fLqL
         g+1aFX0MKsdAsAiy5UeOkTqlzRLRnJtd8jxkFXtS2nHH52lbFBpe60i5kVybVtAL2Z0R
         8xJg==
X-Gm-Message-State: AOAM533FjAzMBAHBa7txm+c605PUtV3lvoxpHOH+aO8DEJI0+VKuPm8R
	M6x3lRKUO0XMWDggUq8p6Qw=
X-Google-Smtp-Source: ABdhPJxkceAbiZL5yL+cUubPZ6waOHIV41xb+da3h9eEMnjG+MNWp72+nz8wjAGBs6osjSG1Br8pfw==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr37449901wre.50.1632253649256;
        Tue, 21 Sep 2021 12:47:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id s13sm3891243wmc.47.2021.09.21.12.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:47:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 8/8] staging: r8188eu: remove odm_DynamicTxPowerInit()
Date: Tue, 21 Sep 2021 21:46:58 +0200
Message-Id: <20210921194658.10654-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921194658.10654-1-straube.linux@gmail.com>
References: <20210921194658.10654-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function odm_DynamicTxPowerInit() is empty now, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c             | 9 ---------
 drivers/staging/r8188eu/include/odm_precomp.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 87f0ea84819a..e0784e38e083 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -165,7 +165,6 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 
 	odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
 	odm_DynamicBBPowerSavingInit(pDM_Odm);
-	odm_DynamicTxPowerInit(pDM_Odm);
 	odm_TXPowerTrackingInit(pDM_Odm);
 	ODM_EdcaTurboInit(pDM_Odm);
 	ODM_RAInfo_Init_all(pDM_Odm);
@@ -1174,14 +1173,6 @@ bool ODM_RAStateCheck(struct odm_dm_struct *pDM_Odm, s32 RSSI, bool bForceUpdate
 	return false;
 }
 
-/* 3============================================================ */
-/* 3 Dynamic Tx Power */
-/* 3============================================================ */
-
-void odm_DynamicTxPowerInit(struct odm_dm_struct *pDM_Odm)
-{
-}
-
 /* 3============================================================ */
 /* 3 RSSI Monitor */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index 43f8e6849a45..6b3800894bc6 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -36,7 +36,6 @@
 void odm_DIGInit(struct odm_dm_struct *pDM_Odm);
 void odm_RateAdaptiveMaskInit(struct odm_dm_struct *pDM_Odm);
 void odm_DynamicBBPowerSavingInit(struct odm_dm_struct *pDM_Odm);
-void odm_DynamicTxPowerInit(struct odm_dm_struct *pDM_Odm);
 void odm_TXPowerTrackingInit(struct odm_dm_struct *pDM_Odm);
 void ODM_EdcaTurboInit(struct odm_dm_struct *pDM_Odm);
 void odm_SwAntDivInit_NIC(struct odm_dm_struct *pDM_Odm);
-- 
2.33.0


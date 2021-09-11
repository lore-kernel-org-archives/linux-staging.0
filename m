Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806E3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:09 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id u16so6845622wrn.5
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJCyfTokEhHfgTnnxy1BvdGBBwQkrjyqqQqN2UOJMyQ=;
        b=SAyvh4z1InkWKE5hDuLpivAu1WOHSDW8H172/yWzZDCRiyycHfBI06oM6n5JuDcZiT
         mV2iimi4ahD5sxTdJXPINhIv8s55Q6Hynv0Nt0GzuoerIO3aybPZI+ueW9rrdKkXUFqG
         c44DH3AcY5lWifwbvHbg7bMao28nMoKNx6ryKrI3nkJRjNHc1otUzkuwkf9CIJ4UoqZb
         B2YxZv90vrHrKMtCuciVT1zXLmijkmvKDjsCjZqHKi65HIUI+vPciNn4cz2pul6wDC/C
         TDwT5KZa04OOccSgH9bCC9wlSYgpfWpe7Fzf2u6rs1aLR2UABrXmsRxdctzIlMm2XdFR
         2vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJCyfTokEhHfgTnnxy1BvdGBBwQkrjyqqQqN2UOJMyQ=;
        b=0geVMigiqZPbMMDyp4MOkgKBYCHQ6ryvfHp7qXixtp6ypSb5mZne28pIQSTItyDztA
         O1idQpwa6rLVxKIfu9v6g6IH7tbqIN5Y+XmP4QKo7Hl/D9gsydqeNOovf9KuEaj2bcYs
         KBamk4I2AbRDLLVZDjfV0Aq+n4zjBqPwDSKx6E18V5edACnx9r/IxfB2wziczf9TkuKG
         35CkyvHrotpVM7ZhoHGu2RMXiahQiFXky6VdFhsJCqS9YFEw/xX2VXmm3gsJYcn3Kiyy
         8VOdFcvwEskcTn39EYkbDPIuF6GNblfvrOlOt4nSp+9uqvzI1AYYTjxC9Mouvo04bGG2
         pcMA==
X-Gm-Message-State: AOAM533ZgTaf/ECOgH/iPOdro68uB9Q7WWtXuNHxUXJfpC3W1tu2b/bp
	s0kwIfXxm+niatef1Q4WdV0=
X-Google-Smtp-Source: ABdhPJzvJD5tsyX1j9spggdroPR2PXRbz7fBRJoh/OZZGaC2Oo2Efg5Zk/zF3+SEl2EQzNh3iexbjQ==
X-Received: by 2002:a05:6000:34a:: with SMTP id e10mr3212280wre.421.1631366827593;
        Sat, 11 Sep 2021 06:27:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/18] staging: r8188eu: remove unused ODM_ReleaseSpinLock()
Date: Sat, 11 Sep 2021 15:26:20 +0200
Message-Id: <20210911132635.30369-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_ReleaseSpinLock() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index ab9100d4b1e1..d45eacabfbd6 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -93,11 +93,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 	return !memcmp(pBuf1, pBuf2, length);
 }
 
-/*  ODM MISC relative API. */
-void ODM_ReleaseSpinLock(struct odm_dm_struct *pDM_Odm, enum RT_SPINLOCK_TYPE type)
-{
-}
-
 /*  Work item relative API. FOr MP driver only~! */
 void ODM_InitializeWorkItem(struct odm_dm_struct *pDM_Odm, void *pRtWorkItem,
 			    RT_WORKITEM_CALL_BACK RtWorkItemCallback,
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 7eccf459b636..4769087b9412 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -95,10 +95,6 @@ void ODM_FreeMemory(struct odm_dm_struct *pDM_Odm, void *pPtr, u32 length);
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
-/*  ODM MISC-spin lock relative API. */
-void ODM_ReleaseSpinLock(struct odm_dm_struct *pDM_Odm,
-			 enum RT_SPINLOCK_TYPE type);
-
 /*  ODM MISC-workitem relative API. */
 void ODM_InitializeWorkItem(struct odm_dm_struct *pDM_Odm, void *pRtWorkItem,
 			    RT_WORKITEM_CALL_BACK RtWorkItemCallback,
-- 
2.33.0


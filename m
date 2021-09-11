Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E333FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:18 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q26so6849775wrc.7
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ow6H/nlu5TCk7P1uMwYJuJQQnJkQmKfjZydPQVpAxiM=;
        b=eIKV1ksU+EMWsofo9meCIQJNUKFeyAFcimZEtAQEJxSB75GXF0o7Myyn19P9HaoS1K
         GYvQ6ZW2j0oMPo7oM3/UWmWmzcQDNzGhTRO/v9al1zY3oZQoj5UjGgrVnKn0IrvFSn8d
         yvYlwPjbcSMQFiKVzITnQy2Uy1PwSNgawzwIOWmdCygXW95KqiJ5oI4L2TJzGipb1RCz
         Lk/xwkO+fBPibRPO9WpeU/ESnb0syaB6tNF6Hq4kPMKMs7ETI6wHNosbfgGTsCOKnTPb
         EE4EyqOyNdNX3MSZfJalQ325/Wv8F+YpcNMFd8YmWNSdKJPJXARr6hLUz73RAzDIBOmR
         ywKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ow6H/nlu5TCk7P1uMwYJuJQQnJkQmKfjZydPQVpAxiM=;
        b=RO/9vL/AA/L8/ZdDAXOB9ZVDdh46tLfjFe4m1BlJ2fhSAmicG92LrC+YRJza37uvsI
         j3BeKWPonChTilV9VGmL5bJZcX6s54ZuCiQBMJxgmRsrDqPwfVhwibNWhocxa5yUNzuu
         bXnYiyrot+GSJhIpYErjoZXgChohlWtHdRUDuOUtEJretzlotfm+6+fmnRu8rA5V/9Wt
         5z6X/vRYPjlMzdArdQNtk8nZiui33LQ03WcCTtUBsf/JlZChilZ1gZfKOe0qk/zMtsGs
         wt37lgvd0IkmbkBvI6+PUKdmcP90XoA+Zy0vupA4Vc9wAYOTB1N3OF2x3z1ugDVw+50F
         0/5A==
X-Gm-Message-State: AOAM532cpbtVF/XMWYaKM86qK2yElxwkOJPTWkVrg0s/gSSubbWgn7Lp
	A+tSX1no0TIpD35ymjxDpII=
X-Google-Smtp-Source: ABdhPJyv/XpgMaihQE47lvPbRh8lngApF5917HNqcfp3+N8WSsLYdfU103he9ctJ/EXGE0kV1Xd82g==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr3168878wre.26.1631366837289;
        Sat, 11 Sep 2021 06:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/18] staging: r8188eu: remove unused ODM_FreeMemory()
Date: Sat, 11 Sep 2021 15:26:31 +0200
Message-Id: <20210911132635.30369-15-straube.linux@gmail.com>
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

Function ODM_FreeMemory() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 6 ------
 drivers/staging/r8188eu/include/odm_interface.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 987fad541337..bbbb11b6cc58 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -76,12 +76,6 @@ void ODM_AllocateMemory(struct odm_dm_struct *pDM_Odm, void **pPtr, u32 length)
 	*pPtr = vzalloc(length);
 }
 
-/*  length could be ignored, used to detect memory leakage. */
-void ODM_FreeMemory(struct odm_dm_struct *pDM_Odm, void *pPtr, u32 length)
-{
-	vfree(pPtr);
-}
-
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u32 length)
 {
 	return !memcmp(pBuf1, pBuf2, length);
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index e87ee60005c8..a50b874fc2d1 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -88,7 +88,6 @@ u32 ODM_GetRFReg(struct odm_dm_struct *pDM_Odm, enum rf_radio_path eRFPath,
 
 /*  Memory Relative Function. */
 void ODM_AllocateMemory(struct odm_dm_struct *pDM_Odm, void **pPtr, u32 length);
-void ODM_FreeMemory(struct odm_dm_struct *pDM_Odm, void *pPtr, u32 length);
 
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
-- 
2.33.0


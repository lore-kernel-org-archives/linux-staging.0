Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA313FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d6so6831490wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cYeMGLf/paO1aMrb4LJnUFnTTu3xI65XWSWcy7ds8yI=;
        b=q4eL2IrB4POMj+LK/sURlezK8xxh+rT/RkWo2MSbF9zadn+PeRCqu5d5SlDwVTLLca
         5M1rx2t+usicWFM0amxn01pNCQQ0WZxAgpj+tnXCA3PCjqsqCH35xdTS5+OxyvBLcqtd
         bBtbBsJJgjtiQwNVMHdmmI3qhkVH9H2vSNYbidr6xNI400BCB2HyIST4gqLEjVWSi3OS
         s8WKFaknVSqlBavTNLLojt2hTTnQQbavbT6kc/Pq4rB4gSs+7JEYBFncD3QhXkETwgAT
         H3XOIpim+jmHDgpIkxXJwaqj8gWKiCbfHBNTaEZgFCoDZ+a7xc0ZiH5Cxr68vfQDWxBJ
         LdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cYeMGLf/paO1aMrb4LJnUFnTTu3xI65XWSWcy7ds8yI=;
        b=oz5+TOFMD72UG7bIRG6nR/fFWubBbhOhUikJ2bAudSdGs87v3zicybMhOne3TqYNdg
         oaFHmVuoXX3Zo3oerhnts9gYPaS+mReos8XG+OfAs/TCMp7JQsUTRVVfNOSg+dsrZ98w
         BYBBjwIhFuSVeLMxBEJ8aQzPhbs0Men0Leiud3x9K/tLQFhMp06cJWgZc49Ypzr8GWaS
         J+OYNNKLI1WIYTdf2OAl8KEDCbogcNspDLLydS9ZZU2i3qyotPr3e2sgaTp7FbERvk7M
         ZlBpyOgk++rO4MOCi4LQ12v0k7cxyElaIw5XjOsyUAFNyF8ujegIrtnh7x1tbRkh+Z/+
         2IGQ==
X-Gm-Message-State: AOAM530HBlBFAn6JylltFFustUSfrRx2E+ewumGJ+e5hwL1BKr/omOD5
	dtca6LI3EIhQrF6Pz1P30xk=
X-Google-Smtp-Source: ABdhPJwLPE27AEY9hVhH4pXrc08jCKY7oTPMCKm1X+48YTcBcJnsDgkZzi+Rn2WrPOosKcEoKJEZmw==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr3010285wrs.273.1631366833597;
        Sat, 11 Sep 2021 06:27:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/18] staging: r8188eu: remove unused ODM_ScheduleWorkItem()
Date: Sat, 11 Sep 2021 15:26:27 +0200
Message-Id: <20210911132635.30369-11-straube.linux@gmail.com>
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

Function ODM_ScheduleWorkItem() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index f3b6fb886550..c4ab858db29b 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,10 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  Work item relative API. FOr MP driver only~! */
-void ODM_ScheduleWorkItem(void *pRtWorkItem)
-{
-}
-
 void ODM_IsWorkItemScheduled(void *pRtWorkItem)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index dd14f465e4d8..65749c213cb9 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,8 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-workitem relative API. */
-void ODM_ScheduleWorkItem(void *pRtWorkItem);
-
 void ODM_IsWorkItemScheduled(void *pRtWorkItem);
 
 /*  ODM Timer relative API. */
-- 
2.33.0


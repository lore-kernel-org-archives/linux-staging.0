Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634E92C85
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 16:35:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p21so2988067wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ii0Rcd1OZY6A9ngAd7PfH7oobRIoZ+iXSEW5dgc0Nk=;
        b=UAkFY1k6VH0Y86E6yqm+bItm1aM0dLrGTPRKFDeiZJkjKFFId39ODi0QYihmhNmlIN
         zLJJJYvo5tB0LYFrDLsCWWiuPIqe5BSBqKJ0JMTJhaSqbKrp6l/LybW9bA06Z1vQ3286
         DYohQsT2DlW55FWGdA50w6I/JfaJqvkubQpCPjFOwP3jdEdGe8KeGqW3yNIrVUYwJ7SK
         gRNe88KZNZZQ1JfhihfNkBliXLRzDb6ZGWSpWLJGyUNRAOfOMsg37HxQo2XnP2PhwxNI
         WPryKdwC4nu0BOF7JbKUaook+R7Ve9/WDxNqf7qXoN9k1+mNLvHrcfwOEYqlmk0C+otq
         oy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ii0Rcd1OZY6A9ngAd7PfH7oobRIoZ+iXSEW5dgc0Nk=;
        b=TqEDSiHVR4hyIuXLUS/Ko+d0KYTAtC44tjC2VLIy7kDAW12w0FrFDhRD5drBrq3EFq
         FBD6A9SAgjnoOGQWtRPlxYrZShfGmPq10WkXWRzpkDmOYWN6ACGbWFMInVVmh9bvB6u5
         uoVf5WcBgrTyP6OdDGEHB1000z273N+Vw+KpJJeJTn4pLZ+ISoL151zu6SGfnsR5etA7
         ZNjecH37Rh2Qv3eu0T8xeub6kyJZ2P3JcFmzfa5QUW3N2XXZPkfJ3YRjfnQeA2cOyrit
         RQMQN4na51Ie0kN/IegmG/xA12ZsGu8C7t3aPT4dnHW1cKct/CPni/N8hrhwE6fCgcEA
         NhRQ==
X-Gm-Message-State: AOAM533M8Lm5Akmg2M3Xbn2Fr+kGjWvN0Eq9PlsdMO/0G52s+R46R0RE
	oBqPXD5w2ZNV7t+61hf2L/hv6Lr45Ek=
X-Google-Smtp-Source: ABdhPJz2vmkpyoZjJPYupCHQ2k9dP5U4ZrDYyRLaJDSnPBl5j5vzQSQnDkc3adfriwmQBptpHfVoCA==
X-Received: by 2002:a7b:cf24:: with SMTP id m4mr27305167wmg.83.1634315716732;
        Fri, 15 Oct 2021 09:35:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id c17sm5489593wrq.4.2021.10.15.09.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:35:16 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/7] staging: r8188eu: remove ODM_SingleDualAntennaDefaultSetting()
Date: Fri, 15 Oct 2021 18:35:02 +0200
Message-Id: <20211015163507.9091-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015163507.9091-1-straube.linux@gmail.com>
References: <20211015163507.9091-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_SingleDualAntennaDefaultSetting() is not used,
remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c     | 11 -----------
 drivers/staging/r8188eu/include/odm.h |  2 --
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 627213392795..030bc7bd9905 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1190,14 +1190,3 @@ u32 ConvertTo_dB(u32 Value)
 
 	return dB;
 }
-
-/*  Description: */
-/* 	Set Single/Dual Antenna default setting for products that do not do detection in advance. */
-/*  Added by Joseph, 2012.03.22 */
-void ODM_SingleDualAntennaDefaultSetting(struct odm_dm_struct *pDM_Odm)
-{
-	struct sw_ant_switch *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
-
-	pDM_SWAT_Table->ANTA_ON = true;
-	pDM_SWAT_Table->ANTB_ON = true;
-}
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 435626f05fd2..21e08a9f8bf8 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -907,6 +907,4 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 			      u32 PWDBAll, bool isCCKrate);
 
-void ODM_SingleDualAntennaDefaultSetting(struct odm_dm_struct *pDM_Odm);
-
 #endif
-- 
2.33.0


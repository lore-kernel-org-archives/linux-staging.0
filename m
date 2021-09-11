Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1989E3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so3274626wmq.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K81N07aeMQ4yN5JOc3ofjhpo4aDsEShDa2X3/T0mFkw=;
        b=mJVud1bpL5+mCNsNgUMdSY6AQkJfEV5lf4D+kCmTB9c5l5t+RZUurqUYqMwILOK5Sx
         DyozchwAnLCOGPxPPLIt+Z20G+yuypJRtpVHHF5YDmCYGLY+K3GGRT+FgZq5I7hFckij
         7e1Z3FQ0yy/+7uyicW6hUAlgwl2rOveiMrU0mGoLz5NLnge/fSt1ePjC1dxvZIYgfFaR
         mIICwaNiMLlfZoplsrzaxL2hUtOjJ240r9tNFWC8gRxwb5biWgwhmgG02xeAFBSgFb5/
         C8k09UgyaUGNbR02KE1hXvUpm6vGWzfmP2CtOIeFvXyEUjilfBiiAeV94hDiO15qWk+w
         Df4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K81N07aeMQ4yN5JOc3ofjhpo4aDsEShDa2X3/T0mFkw=;
        b=PzascENewE4NTMbGkJBlAyP+ezEmBS1eBJVd5AF0TCSufmyar7epfkAMbqerG/Jcor
         2LDxXMoZ3shOyB+yOrjySFu62/gPjzr6fwZx231PM3yzlN6s3xwQv2kxNRb1tHc8CAr0
         v22a9b7wVnUOcoZ1kfPaNAH7D6aP+vdpF9pQ9D91WM3Q4M3cMyQIf2OTmtzTymbdReMT
         hMdk4JC/0+iE9ssUm7zxBy1N9Yq0zEJm9Srcc8xMhedSZq4JHF67tsBxq1aMcDFSb+Dk
         fFlUY/xgayxsEcRxhAqNWD4OjiiBajJI9Yt4L9D0v5Or0u2Q65baqg5IzoL1ESiF3LKj
         LANg==
X-Gm-Message-State: AOAM533eEjQYKtULZSzsPBxO0TcuqsnWiJuRrvBtcrvuOwjoPO+G9/2h
	wjzkyGVh/n0lwWseT7aPsGo=
X-Google-Smtp-Source: ABdhPJyR9cl3+3PlylS609rU04lnnhCWGdcA2gbtBWPnjdHks33G0PKp+/6hh+9DQk358tK//QBeuw==
X-Received: by 2002:a1c:7ec9:: with SMTP id z192mr2773844wmc.152.1631366840602;
        Sat, 11 Sep 2021 06:27:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:20 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/18] staging: r8188eu: remove unused ODM_InitAllTimers()
Date: Sat, 11 Sep 2021 15:26:35 +0200
Message-Id: <20210911132635.30369-19-straube.linux@gmail.com>
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

Function ODM_InitAllTimers() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c     | 5 -----
 drivers/staging/r8188eu/include/odm.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 0e5b14051ffd..d23e9296a10e 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1404,11 +1404,6 @@ void odm_RSSIMonitorCheckAP(struct odm_dm_struct *pDM_Odm)
 {
 }
 
-void ODM_InitAllTimers(struct odm_dm_struct *pDM_Odm)
-{
-	timer_setup(&pDM_Odm->DM_SWAT_Table.SwAntennaSwitchTimer, odm_SwAntDivChkAntSwitchCallback, 0);
-}
-
 /* 3============================================================ */
 /* 3 Tx Power Tracking */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 4a5a7c754008..dd0681c138a8 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -1135,8 +1135,6 @@ void ODM_CmnInfoPtrArrayHook(struct odm_dm_struct *pDM_Odm,
 
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 
-void ODM_InitAllTimers(struct odm_dm_struct *pDM_Odm);
-
 void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 			      u32 PWDBAll, bool isCCKrate);
 
-- 
2.33.0


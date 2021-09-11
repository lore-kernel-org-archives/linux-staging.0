Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7C3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:07 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d6so6831100wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0xORhzTVO5jZPwm65fjbWfekx9AYCufbudPIhVFIxJU=;
        b=fXWb4hC2LEJ8y8XJeGsDmDGu2HmT4pZPzLz0tTXO9ZHEwkOZtI0Rga5FocyczcUHro
         45hqXY9p4mFvrusY0Xd2KJBUxNjr2eRGfI7kOJ8HmfmOWhqAIGY7A0Q18Bq8BaOY7BiD
         CoLpOeL7jtvZgFTGNZzXQkqXufl3coeZZEuaGOedr2O8bHgTEIw+TmWp0va2CpyLAK74
         N5yqU65AEe+2rETDnHtKAWDLtAeCD8veftaWAnWvQuabJCez5BW0W1+VjodNln7evql6
         cUl0pLpUwwO/06DTP6MWbtWcnrhVzZ3ePbcL3EajGG3vDDlD/oyDuVt2Iw1lmIsvcmDj
         xKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0xORhzTVO5jZPwm65fjbWfekx9AYCufbudPIhVFIxJU=;
        b=T43eLjQ2qVgsv3VidrcJMzWSIGl/R80sB0tmXD9kJn8v0MxZX6QELyqsyRfFIIgWoq
         1wxN9ih5GhzGl/n91Euunomr31Er4iUxvt1l/GVA7owA2pKN5wnn6yuVtBphocv0wegf
         zdniiTrEKIaAAm9GGL6d8JkjpR12HrmpY907X6fYlHgofyTYkcZJGC4VsjVtSo/vamto
         s2qHHyPndLxEnuJmnBLSMBN4Aa8Ko1jBKOztUnLJI96PT3ASl7eYbFgtddZ2mSajpFf7
         wT0PwSNiE/hjwkphetG7kuaGOVNM2dQratAFkAdKg4V+bEoiwbSRddlM954lwWseZPvB
         VntQ==
X-Gm-Message-State: AOAM53364mJNUP+JsWY9sfV/3YJFCFaPnHmwsJYgbmADuc5fLgsor9Cg
	YhcTgnXO/1uSeZ7JSznM8Rs=
X-Google-Smtp-Source: ABdhPJy8BfXHBBY5NI8qS39K62ECNPdIm9Hu7RGUgN23ZnKBiA4bGW/GOKnl/4Ze2kvRfNIjRYsPRw==
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr3197958wrz.242.1631366825605;
        Sat, 11 Sep 2021 06:27:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/18] staging: r8188eu: remove empty ODM_ReleaseTimer()
Date: Sat, 11 Sep 2021 15:26:18 +0200
Message-Id: <20210911132635.30369-2-straube.linux@gmail.com>
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

Function ODM_ReleaseTimer() is empty and its only caller is
ODM_ReleaseAllTimers(). Remove both functions.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 7 -------
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm.h           | 2 --
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 4 files changed, 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index f0fd88d98e95..011ebcdac797 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1414,13 +1414,6 @@ void ODM_CancelAllTimers(struct odm_dm_struct *pDM_Odm)
 	ODM_CancelTimer(pDM_Odm, &pDM_Odm->DM_SWAT_Table.SwAntennaSwitchTimer);
 }
 
-void ODM_ReleaseAllTimers(struct odm_dm_struct *pDM_Odm)
-{
-	ODM_ReleaseTimer(pDM_Odm, &pDM_Odm->DM_SWAT_Table.SwAntennaSwitchTimer);
-
-	ODM_ReleaseTimer(pDM_Odm, &pDM_Odm->FastAntTrainingTimer);
-}
-
 /* 3============================================================ */
 /* 3 Tx Power Tracking */
 /* 3============================================================ */
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 5a01495d74bc..c33ef4736ff6 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -165,10 +165,6 @@ void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer)
 	_cancel_timer_ex(pTimer);
 }
 
-void ODM_ReleaseTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer)
-{
-}
-
 /*  ODM FW relative API. */
 u32 ODM_FillH2CCmd(u8 *pH2CBuffer, u32 H2CBufferLen, u32 CmdNum,
 		      u32 *pElementID, u32 *pCmdLen,
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 7c8f082930dd..a100fdf87379 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -1139,8 +1139,6 @@ void ODM_InitAllTimers(struct odm_dm_struct *pDM_Odm);
 
 void ODM_CancelAllTimers(struct odm_dm_struct *pDM_Odm);
 
-void ODM_ReleaseAllTimers(struct odm_dm_struct *pDM_Odm);
-
 void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
 			      u32 PWDBAll, bool isCCKrate);
 
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 6b589413d56c..9109d72915cd 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -137,8 +137,6 @@ void ODM_InitializeTimer(struct odm_dm_struct *pDM_Odm,
 
 void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer);
 
-void ODM_ReleaseTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer);
-
 /*  ODM FW relative API. */
 u32 ODM_FillH2CCmd(u8 *pH2CBuffer, u32 H2CBufferLen, u32 CmdNum,
 		   u32 *pElementID, u32 *pCmdLen, u8 **pCmbBuffer,
-- 
2.33.0


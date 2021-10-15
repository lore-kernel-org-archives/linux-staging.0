Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A479C2C85
	for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 16:35:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id g25so27364054wrb.2
        for <linux-staging@lists.linux.dev>; Fri, 15 Oct 2021 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptBaQ/8TQM1EowzYMrzwxMw23j9xvcGBj+Eo0T9DNWo=;
        b=pvIUzzUjiiVxrXj+OVblyGOAbd5nK/Nr4JMFjPRPybY2m/oFwhAO8xrUTGkBpgRSZg
         bxJ+dK7xX/Fbkl9G9b9gsMuBbfFkHhSi4Vb0bCavZmUoelC2EX1SVFEM1QoDjdu0569g
         pcpA2VQvVbqNz9i+5505v0bDOVVqgu7AaietGBXWfrwTBCzBApZFsZ6FBcb/uO5J2Kb3
         NQW3n3DbanP1NncRdmd4QqlgREtVGeMrz7MSGfI+9jSqBdl0GnW0QsTstCTWH6TY8LH4
         +qmMzaq4nQPxlCPFLffi4By5ZuUezgGeMY87PrxHBbsH3GLOEO7RCq7+3XevVB+c7eSn
         DvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptBaQ/8TQM1EowzYMrzwxMw23j9xvcGBj+Eo0T9DNWo=;
        b=36Ty7VqaCSPnLxeV9HEPlSmiWlQ5TEs73kU+zeV/hNaU6oIohcXUNz8OsxVjuTSpEZ
         fSmwZehlApzE9F7rnyDGwIgr3YMFO+3+ilD+B54ZSMUqOvZ0tUC1jWaeCrnFvaSHN5cE
         6lda4AODKJS7paEdTpv8HRhIZZ24u3aemNW6DK4VzIEGdrHimlla1nfMG8+ATtdBVTFC
         NvAhG2+DZ3S9qDy0cnYWLg0aSsAB6F7KTGx7E9o+Vfli1clyct2ELR0bdHywa+77xaF5
         6oDT+2NKrjXKbOIvFrN3scGFbZqLhrAKX5d3bnUr/9/J1I72vQHuz6x6d92/R7Ttm5ul
         zoiQ==
X-Gm-Message-State: AOAM533WyntJjwkzkaSZb22kdXdOcizSYyIlRqLCTqQIuURyT9BuU6rR
	+kDtDqjtBtn8mpbeutWDZL4=
X-Google-Smtp-Source: ABdhPJy8UVIvYzmU5MByUWK2SIG1sBx2C6B4KqLZLvJwYescuQXpt2YIB8G2dDedXdkmmiXdLlb1Ag==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr2565820wrc.254.1634315718121;
        Fri, 15 Oct 2021 09:35:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ad78])
        by smtp.gmail.com with ESMTPSA id c17sm5489593wrq.4.2021.10.15.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:35:17 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: r8188eu: remove ODM_AntselStatistics_88C()
Date: Fri, 15 Oct 2021 18:35:04 +0200
Message-Id: <20211015163507.9091-5-straube.linux@gmail.com>
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

Function ODM_AntselStatistics_88C() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c     | 21 ---------------------
 drivers/staging/r8188eu/include/odm.h |  3 ---
 2 files changed, 24 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 28bd6f36cddd..d3d13164ca8f 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -1016,27 +1016,6 @@ void odm_InitHybridAntDiv(struct odm_dm_struct *pDM_Odm)
 	ODM_AntennaDiversityInit_88E(pDM_Odm);
 }
 
-void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId, u32 PWDBAll, bool isCCKrate)
-{
-	struct sw_ant_switch *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
-
-	if (pDM_SWAT_Table->antsel == 1) {
-		if (isCCKrate) {
-			pDM_SWAT_Table->CCK_Ant1_Cnt[MacId]++;
-		} else {
-			pDM_SWAT_Table->OFDM_Ant1_Cnt[MacId]++;
-			pDM_SWAT_Table->RSSI_Ant1_Sum[MacId] += PWDBAll;
-		}
-	} else {
-		if (isCCKrate) {
-			pDM_SWAT_Table->CCK_Ant2_Cnt[MacId]++;
-		} else {
-			pDM_SWAT_Table->OFDM_Ant2_Cnt[MacId]++;
-			pDM_SWAT_Table->RSSI_Ant2_Sum[MacId] += PWDBAll;
-		}
-	}
-}
-
 void odm_HwAntDiv(struct odm_dm_struct *pDM_Odm)
 {
 	if (!(pDM_Odm->SupportAbility & ODM_BB_ANT_DIV))
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index db24678eb0bc..a8e9089433ba 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -899,7 +899,4 @@ void ODM_CmnInfoPtrArrayHook(struct odm_dm_struct *pDM_Odm,
 
 void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value);
 
-void ODM_AntselStatistics_88C(struct odm_dm_struct *pDM_Odm, u8 MacId,
-			      u32 PWDBAll, bool isCCKrate);
-
 #endif
-- 
2.33.0


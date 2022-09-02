Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D700111A
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:39 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id c59so1934140edf.10
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=h3mhTe/mjeUDsRieRFZcGAvsQDavOcg5RIWTE5zQGmg=;
        b=P3QdD0gpQHruFVJqMa7Wzvc+n78eFD5RH+hz7cX3l6rx08EFj3fZWG05QZDc1tCA/N
         tqRdJWwx9/9Udq2YSEbOvUobkWiLQKGhoYbefcfJgEmpjeV9ek/f5nzNCNIuFcWsdw51
         Ika/mTSR3k7lfAFgRUqyy2B5HPmcfTULxXoqQS/NkaFvT+8l4UV9I7Ng0DThuyouyMlc
         Arx2cZJHg3/LlIUbqyiSVtXlDLR8rYB6EsX6QqtdMJ1bN6lC4F+BnlMZGDBG4oq4Nohi
         LHM1zFvigxswzvXcx8rs+phoLDRdUZapoyRSXylO3L9ErPNxHpr/1M16YSrV5JgztBsJ
         CQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=h3mhTe/mjeUDsRieRFZcGAvsQDavOcg5RIWTE5zQGmg=;
        b=RsSuvZ6pLCchLnJREp/TqMuMtsxloKi6FR6Pgr+1mE1yS2BdCzT7ri7a0/TthkuL4H
         0OulG0BTiUUvT2RPbgK7yp65PF+fSXkbsX0bHoPJKLbK1VY9K9/rUEgMlib2lO3k9u58
         HHA2VE1qE1IC0FUZhKLh2MjRyI6FYwRsu6Ln0/i17Fk7LCHX92ZvfT1gS2AaZY3gkMD8
         KrXLOnQzOBe6UdzQoDpoVIgnr4surEtK4J6CIPVrM8NH9WaQMIOFYTS3q/cnJgv5tLjh
         ZJ52BQkrd6YYG6SV0unGIVwsMxeamv4VC/PmUaGE0V0hmVnfEX2AhjVxKdTLZhOU6Gn4
         XR9w==
X-Gm-Message-State: ACgBeo0JPOR5cux/n6mCI0/B3F+q+5EdG5p5BO/ntyPh+zszZEWsT6H7
	QFkKTtoiTdMwW4udIAzSaKU=
X-Google-Smtp-Source: AA6agR6XamPgDiGUEGLE9DLDhapoNvBAlbipZ3p2jb95dD0vAa9TTvWkK8BfBpaom1LZMB0xKqqtig==
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id g10-20020a056402428a00b0042e8f7e1638mr32624816edc.228.1662112357639;
        Fri, 02 Sep 2022 02:52:37 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:37 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/10] staging: rtl8723bs: remove odm_PauseDIG
Date: Fri,  2 Sep 2022 11:51:55 +0200
Message-Id: <274e8338398d915327d353f713b2d47e48f92ba9.1662111798.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function odm_PauseDIG because it is not used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 57 -------------------------
 drivers/staging/rtl8723bs/hal/odm_DIG.h |  2 -
 2 files changed, 59 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 7e92c373cddb..07edf74ccfe5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -309,63 +309,6 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 
 }
 
-void odm_PauseDIG(
-	void *pDM_VOID,
-	enum ODM_Pause_DIG_TYPE PauseType,
-	u8 IGIValue
-)
-{
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
-	struct dig_t *pDM_DigTable = &pDM_Odm->DM_DigTable;
-	static bool bPaused;
-
-	if (
-		(pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY) &&
-		pDM_Odm->TxHangFlg == true
-	) {
-		return;
-	}
-
-	if (
-		!bPaused && (!(pDM_Odm->SupportAbility & ODM_BB_DIG) ||
-		!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
-	){
-		return;
-	}
-
-	switch (PauseType) {
-	/* 1 Pause DIG */
-	case ODM_PAUSE_DIG:
-		/* 2 Disable DIG */
-		ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pDM_Odm->SupportAbility & (~ODM_BB_DIG));
-
-		/* 2 Backup IGI value */
-		if (!bPaused) {
-			pDM_DigTable->IGIBackup = pDM_DigTable->CurIGValue;
-			bPaused = true;
-		}
-
-		/* 2 Write new IGI value */
-		ODM_Write_DIG(pDM_Odm, IGIValue);
-		break;
-
-	/* 1 Resume DIG */
-	case ODM_RESUME_DIG:
-		if (bPaused) {
-			/* 2 Write backup IGI value */
-			ODM_Write_DIG(pDM_Odm, pDM_DigTable->IGIBackup);
-			bPaused = false;
-
-			/* 2 Enable DIG */
-			ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pDM_Odm->SupportAbility | ODM_BB_DIG);
-		}
-		break;
-
-	default:
-		break;
-	}
-}
-
 bool odm_DigAbort(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.h b/drivers/staging/rtl8723bs/hal/odm_DIG.h
index 88cfd542df16..a5b041101c89 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.h
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.h
@@ -141,8 +141,6 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI);
 
 void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI);
 
-void odm_PauseDIG(void *pDM_VOID, enum ODM_Pause_DIG_TYPE PauseType, u8 IGIValue);
-
 void odm_DIGInit(void *pDM_VOID);
 
 void odm_DIG(void *pDM_VOID);
-- 
2.25.1


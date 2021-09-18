Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C8F3FC9
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:27 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h17so43084596edj.6
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HgLgc9yM59ExKmqslgazl+TqXbR0Gqq2UFS62UlS1Jk=;
        b=XOUPgnNQPtGjTIPlZ9rZu45c5QecyapS2H4a+iGfvXsRfWn8FFZMs0xbm/mq1ytGbC
         T/CcZUmEHsJ/kIiv23PIIVfqYyifW44Fz1AVcimiIoF+BoLyOxgLiKu3S5b7tECGSURI
         wByCR8QAfCmrNNCJXyzQ8hI6yNYidfgbmRQvyHRp2TBg3OoVY+pA/troNq0DAEuxqop5
         +9S6GqbkogYf3hjBqt5wqnbBitp+rexjP2dIv0BIDbBm9z/+In895DtjyESZNicVIpaV
         V5+hguHhHX/eqapiqPTZR7Z+g2lL07GW3GOMY/RX5MyB2kbjuSUGYJI6N+PrtCmh0198
         telw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HgLgc9yM59ExKmqslgazl+TqXbR0Gqq2UFS62UlS1Jk=;
        b=8ExZhnyeam0KIx01GUMppkeqfoohvKmhxGZDWN2VpIV+rRHaW36DJgeO3qSbJO+R2E
         bD4vaw82PjoF/ZBl4IsXx+p6bYOc25XS+/RxJjRk4IQ49SIuzaMMlabyIBpdfsNv/EUm
         Qsk5SSSKhv/WMHeBnfD6ZW7uha23Rje3pQZ4nGPGTiNRYfX8oxbT2DeMxt/dvvtXuzrp
         yeNsYTWb01hMO3kLQigZttmRN7eNS4jTzouOftl5NPrigf4chZTMmAD/ZPqO7PlllWOn
         ysWbBlHNpO4921jN2p05DGmdfIJFuqnOFs69eiSvgtIfwxctAjIi3g/7InQELgnthxsa
         f7Ng==
X-Gm-Message-State: AOAM530tL4B0/TCqIxD5DqXdnyWAnm0Pr3Bjccc3YlGNqY/zB26tpJLn
	bix3CRNm2hOeiy8VYlB1ApU=
X-Google-Smtp-Source: ABdhPJzgPqQWuLNsHMlQNKPxfahh/dTerf9cBA/KDInyT48NV/OkkTrOKGgfq6yd6nzNzdiW0sMjHw==
X-Received: by 2002:a17:907:9908:: with SMTP id ka8mr20282100ejc.164.1631989165736;
        Sat, 18 Sep 2021 11:19:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 08/14] staging: r8188eu: remove macro ODM_BIT
Date: Sat, 18 Sep 2021 20:18:58 +0200
Message-Id: <20210918181904.12000-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918181904.12000-1-straube.linux@gmail.com>
References: <20210918181904.12000-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace and remove the macro ODM_BIT to make the code cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 4 ++--
 drivers/staging/r8188eu/include/odm_interface.h | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 1e2deb6cdb58..cb27edf657d9 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -465,7 +465,7 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
-		ODM_SetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		ODM_SetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N, CurrentIGI);
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 }
@@ -521,7 +521,7 @@ void odm_DIGInit(struct odm_dm_struct *pDM_Odm)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
-	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8)ODM_GetBBReg(pDM_Odm, ODM_REG_IGI_A_11N, ODM_BIT_IGI_11N);
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DM_false_ALARM_THRESH_LOW;
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index a5a7b72815f3..3af58e853828 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,12 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _bit_11N(_name)			ODM_BIT_##_name##_11N
-
-#define _cat(_name, _func)	(_func##_11N(_name))
-
-#define ODM_BIT(_name, _pDM_Odm) _cat(_name, _bit)
-
 enum odm_h2c_cmd {
 	ODM_H2C_RSSI_REPORT = 0,
 	ODM_H2C_PSD_RESULT= 1,
-- 
2.33.0


Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B93FCC
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id g16so19147548wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=CKyLlR3xnAsEYgY2ruOz6sIhAWHvSbBYThR7IVsFmVWmmVsqreCR8sXb5bkEoUGhul
         T6yiyekoREyVkEWuuTm8n2I1q0B/rDCvhCV5tRosr5SL/7x3O0oNGoNYdmU49VBDR4Bv
         ZQpHXqZxkVhlzfZVe9DYheWE3FcPgNSVEz212SytXjQoKWmKgV1kXjrIId87pD84h9Tq
         iPO2I6ovaC3Zn3GvDcGpFALM2/zomWrhFiBUKXTFGnddgh0CDtfznpEs7UG1WVytMbQm
         L/mvopUqjXJSFbtYCYJbZhtuxQBkoP3/vIpXAwlFGPD2ix1WM6F5xxNUiRexmh39LRBR
         dZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=4Lw3/7eHEU2Xgi3yeQNQz8b7tBOueqUGV6tr2FGG1loe+qjE6EW8jRIMkqaIvM/aud
         G4CkjQ49/EMzhdD396FEoMe5ielf8iNJrWFSAR0dcU5pxQ1OBh35vWQk1wRLzAfT3Gfc
         iNcAe0dm0AvnsDl7Cvtf0ge+t7hV4HUtkODw7HbTq+w80C8usoh9FLvN5rOuNpgTsfEM
         44xUUjEHGQmKEmq/wzadeu45s+NcemFyKEbjGjGKKc1pp41VUe/IhfFWJzMqhBksvbEp
         PhLmJYAl4+c4jUBYPtJqfa54/3pHRvykeY7xckFKr2c1s5xkSMMTQ+Mr/5oxXEwhatb+
         dWjg==
X-Gm-Message-State: AOAM530gHMoBN7g95ACZ5xZgC721wvwAgMpuS1Vuvp0znoyvCBxi3Stf
	0LW+8TfFyLDnPVieRtDaf4E=
X-Google-Smtp-Source: ABdhPJyW2d+o7ZXFv0NI4CzuoTCcMXgUcbx1SicCll5kGJ23KhZ1TP5kJeBt0loUw71pDHlaNOBoSA==
X-Received: by 2002:adf:e8c7:: with SMTP id k7mr17084379wrn.47.1631957107689;
        Sat, 18 Sep 2021 02:25:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 04/12] staging: r8188eu: remove dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 11:24:35 +0200
Message-Id: <20210918092443.8724-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In this driver SupportPlatform is ODM_CE, so code in the
"else if (pDM_Odm->SupportPlatform & (ODM_AP | ODM_ADSL))" is never
executed. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 34 -------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index d23e9296a10e..5f98c797c59a 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -460,21 +460,6 @@ void odm_CommonInfoSelfUpdate(struct odm_dm_struct *pDM_Odm)
 		pDM_Odm->bOneEntryOnly = false;
 }
 
-static int getIGIForDiff(int value_IGI)
-{
-	#define ONERCCA_LOW_TH		0x30
-	#define ONERCCA_LOW_DIFF	8
-
-	if (value_IGI < ONERCCA_LOW_TH) {
-		if ((ONERCCA_LOW_TH - value_IGI) < ONERCCA_LOW_DIFF)
-			return ONERCCA_LOW_TH;
-		else
-			return value_IGI + ONERCCA_LOW_DIFF;
-	} else {
-		return value_IGI;
-	}
-}
-
 void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 {
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
@@ -484,26 +469,7 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
 			if (pDM_Odm->SupportICType != ODM_RTL8188E)
 				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-		} else if (pDM_Odm->SupportPlatform & (ODM_AP | ODM_ADSL)) {
-			switch (*pDM_Odm->pOnePathCCA) {
-			case ODM_CCA_2R:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				break;
-			case ODM_CCA_1R_A:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), getIGIForDiff(CurrentIGI));
-				break;
-			case ODM_CCA_1R_B:
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), getIGIForDiff(CurrentIGI));
-				if (pDM_Odm->SupportICType != ODM_RTL8188E)
-					ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-				break;
-			}
 		}
-		/* pDM_DigTable->PreIGValue = pDM_DigTable->CurIGValue; */
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 /*  Add by Neil Chen to enable edcca to MP Platform */
-- 
2.33.0


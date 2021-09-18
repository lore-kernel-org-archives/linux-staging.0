Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401273FC9
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:24 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id v24so42957846eda.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=j/5DXP/ur2WkxRWsVu+s+8Y9Spio5fSB/8VPrJ5y7OcEGAmLut7uc9OQ3QjW2yuqQe
         /FmiLkSP+yFf9efBCcLT0cj8N0vZ7j4kbPIC///0HEZk0fL9rndQIllD5aE2VhHmPmFE
         RT0QOCD/mcDl9jdtiQqHbSs48Q5My7GKtZMTrQCJCrvOLIj+7yJ7yFM9HCcFsZ/mC5TI
         pMy7ZwvUaRx3yZKFevL6yv/XbldgGPX8SwNcOy06v0Xv6eOt3uI4zH5wq0RxaSuoClfo
         Gkn9aE7/5QR/SRux8p1TnVXXa+Xy/Ww4Y+wlbDe6HL4uSN7V0MTOZsV2c9CEyplo8XUF
         0dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nh/WmLCbKtUynZDayAfXG6y9ApWz2vlF+iZiOm05hgM=;
        b=L4USmxnQ5I/H6c5iCmiJGFIBQlCKQU9LTsqr7dK/ycvvI+oBEObA/dDNWXkBmG2BuR
         o7vamK9R2rdnvyKZz6mnUaEe1TLncPDdBeTKDh4qqxWs91gk/cBDZRIlGjZ/0yNUpOwy
         E5IJhnFdo9Qaee7RRM0i4thxS/okdaNV1/2A5UUfkWX1j4CQoNHynX3k4cKTEZ4hUq7Z
         SskRxpwvjgQUFsy3F36gqKxlKF1SVIPT3OVpkigDWXNC4iDkT1xKPQDRvNAp/iHTbBTi
         /ssFFrU+cWWSCi+y5L3kwooTsNwtkewn+sGRYwebBontA9KPyRJejr9Wkc7w7XM9ZBay
         BEXg==
X-Gm-Message-State: AOAM530/gXoZOGi2kiztzR40ULHQ3UXXJMteHJITj19+Jvs9Oi7kkGps
	pv8shGp4dFlq/RsrEmoRLe8=
X-Google-Smtp-Source: ABdhPJzR3DopE7bB0zOgANKRJHIaQi2zyIYdfGCAFGZRSNDw8+5EKBgLuvtVcYhTNPOk6t6V/SvMxA==
X-Received: by 2002:a17:906:95d7:: with SMTP id n23mr18563187ejy.479.1631989162690;
        Sat, 18 Sep 2021 11:19:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:22 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 04/14] staging: r8188eu: remove dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 20:18:54 +0200
Message-Id: <20210918181904.12000-5-straube.linux@gmail.com>
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


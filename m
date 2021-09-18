Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D59E3FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:25 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id n10so42275693eda.10
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=IjAOonNcxGUtuI1FvVBWz2NywLVRBrbOWHDoCdkoByXq2GP8VMK5Ziu3bdz5fFqprm
         Yx8DUNODVLVl6u9z3D1RaV+b9PdUMR0+WRS9R8qMJGDqYoZZfqFtlqUKCegoHgiKynoo
         XScrW9/nXM1ADOI6J4qZx7s8mn4XQ8NP1+j9o1AGINhwfJJIBnIyP24rJObRp/qjd3Of
         roUUArauJWaltiWJaJCw+OIRKofdiwofPcLbFy8aTJdQ7YOHTIKzhbiFY/Re++vIH3In
         rK7lD83sx4ZAfh5HcNL5aGY5B6yLdGHkcRyIoEq+4m1twkQlr/KVfpxK8cPPbRpS+Sf/
         S2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=eCGEM+nRDmPayWPA9uRHJrKwnlGhTEDeYM9vkMOn7bPDMEy948nEk2Q5CNS1PZWPL6
         /wrCAU8bNpU9KRCkZtJhTbfqdXfUdBkJXy72E1/78eyEbU0/fNm12cAHfXq2C7P/GUpX
         up84qOY7TJH8f7JySKWzwLGtXAZ71s19srYU7tivalRwx3LcGzblcf4rRo0hvOnzRyaQ
         ZzuQKwQTUsNHk+/EBF41CVUaYFm+Yncd/1reampqcq227g+O8ocVunMpb1JM3BXuJzDF
         Ukb85J32NqSC1B9HkJ2/lfXUfpws6YhWppvT6jZzFUs//sukH6ZusoJ6yJ1ucdi5B7lr
         npDA==
X-Gm-Message-State: AOAM533sDOc2DZ5EfJnRXGOTbvzw7in/OnMvNztOTV+O54L9X6PvlDUJ
	uSy1zfEZ0lsnj597EUSUSC4=
X-Google-Smtp-Source: ABdhPJwYa8zWwOZxps/DyLr7Mv8Fs+A8bgd2KgyGDYX5xOYAQWhUlzINikOIJixIXEaWUj6fBbx12g==
X-Received: by 2002:a17:906:8981:: with SMTP id gg1mr19515105ejc.95.1631989163462;
        Sat, 18 Sep 2021 11:19:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 05/14] staging: r8188eu: remove unnecessary if statement
Date: Sat, 18 Sep 2021 20:18:55 +0200
Message-Id: <20210918181904.12000-6-straube.linux@gmail.com>
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

SupportPlatform is ODM_CE in this driver. Remove an unnecessary
if statement that checks the SupportPlatform value.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 5f98c797c59a..cac4f8ff7b63 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -465,11 +465,10 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 	struct rtw_dig *pDM_DigTable = &pDM_Odm->DM_DigTable;
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
-		if (pDM_Odm->SupportPlatform & (ODM_CE | ODM_MP)) {
-			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-			if (pDM_Odm->SupportICType != ODM_RTL8188E)
-				ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-		}
+		ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		if (pDM_Odm->SupportICType != ODM_RTL8188E)
+			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
 /*  Add by Neil Chen to enable edcca to MP Platform */
-- 
2.33.0


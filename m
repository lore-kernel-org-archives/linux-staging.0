Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C03FC9
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:09 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so11148435wmc.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=fPG4Cv5Uhb/qiJ7VRWXsmhMrkbmLDVXB7W3cDnvR942kiqFdhxvwhAGFFTQp/V2rnu
         34xsJIldCIXwhnCse40Uh90/9112mUB76L5ncWa6fkyDU8wMM8it4REkYqSehw4M07K5
         JdOASLhJMEgsFasyUnnpHnKl58rHjOPT1pB+gEHAM+PH6xdItzflZ2Ks2+iW/sUhM2dK
         UxpdhMQcCfPjkLrSSi4VU1Jk8vyT/g+DCIC6zGBxWCALcoaUoyV/07VYlr1T5rul1dGP
         c5OQdp2B53INTA885vmTEYdg0lp8ph66yV3ocPPAngovl1xSA0VULvhGAP8q3JVLeRaa
         kJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=vLk/y2pM8695ctvD5euUsvHtrrfl8dzP9dwUaW5VqI5npNe1djTumRHIQN44re2o+d
         I+eaKfEq5Rk4kvyqc6Cjdmt55Rt1JaBA/XOxngiFkBUzitK3sjy3zrhKCfO7+4efX8l2
         WlFjc/C25S3QN9WuszDGAXMo6pFWgViiRSK4vQxRnZ/4QMu6baIkW4ydzblUw6sCiQiD
         xDnQRIi4cYvWh6mPIPhCgde2K/J37/jvxbqkj1NaIwueQ4NYclXAJK59x5vo/8SdvB9k
         hsqNEVqcTD4KEas4YlN9PGNZfRlmCQkm9c8yDXvtQXuz1Mkh2yvMHm/F+WUAT+b6+UGn
         unmg==
X-Gm-Message-State: AOAM531BgQ8v1tKv+PIq1kF/KCDbxLZIL4SXM3wj42/gPk0rOPyCxV7L
	09eLfuvL51meAtigavi7cy8=
X-Google-Smtp-Source: ABdhPJzUSA4n/1TO2wLXj2TeUzNPrVtIJe/scbo/joTg7zWVw75geD4RA56m+SHAlcemT7Nhh3Q70w==
X-Received: by 2002:a1c:447:: with SMTP id 68mr17315856wme.137.1631921467907;
        Fri, 17 Sep 2021 16:31:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/12] staging: r8188eu: remove unnecessary if statement
Date: Sat, 18 Sep 2021 01:30:41 +0200
Message-Id: <20210917233048.31677-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
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


Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E133FCC
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:10 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 70so6172503wme.5
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=G4c5Ba7eVuJ1qFLwojui1JNnaWSwv67GLm/5CODDztRFGSCdkB112uqewEhq5we7QW
         xGwh9LiK3A5S5x4FEBKZl2gBVMJUh1X2PswDOAXETSXMjfl5EjBNtyEEiGZo1zZhtnEv
         8wV9sr7Ui2ThW2K598w/L4zHjJgs1pe/menYILZ83caIWPTv90YxJ1sgr1VQo3Kd1jBV
         /jx7MNSryn5IIu5wr85qPNsf78y5kLR6WBGLQGo0wH2oUKhAqvaWvHUpOpJjG0/Qfs8q
         m02E+AI2Ho8eZvVL4wG+pRXXGxB/G0nT3hC5df7QpUDI6Esy+Iik9PeXBHhtKadUi/w8
         5+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=gjsGstKNX18kToqyPHkUMuqwO8FQiGjbWXEMamv20Jz3nkQ1KrwjNfeSRBs9WhLox1
         osKXpb9MC5hyuJ3fjDwXlxh4d+cO7MRyFm8IpFb2xpbA/QVL6v6GH43/ANa/OoONqSEQ
         +M8fhvLYHxhX5V6f1HT03T8ERpgi9hoL9ze7EcWg5TE3ZAG5XNUC2Z+5n5x8GXAo+g/+
         HFvw6OhWDXsbu0xNjHFdj7xoIMM5du2DTTw89ZA2iLecrh6dDJJBdpF87YUqvUFjKDQl
         vqNfREPNchRLx/Z9DKvlc5bp5Qb293Q5Raiqb3LU4xJO97c2csEbtW5tOy613YI4UOHD
         wQEw==
X-Gm-Message-State: AOAM5339JTUWckLIeGOd35pN2XRR8kyEwC3FgSmkgDbiYmOZAJh29M9k
	X5wibXzBIud2Z1UPXpbIP98=
X-Google-Smtp-Source: ABdhPJyoluQQtjN/3KvKwr2YsvdbxfgxNBoQSRhBzqqeT2PUuLT+4lDn6RbiBW/HUr54tCK/ZftIpQ==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr18979651wmq.154.1631957109339;
        Sat, 18 Sep 2021 02:25:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 06/12] staging: r8188eu: remove more dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 11:24:37 +0200
Message-Id: <20210918092443.8724-7-straube.linux@gmail.com>
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

SupportICType is ODM_RTL8188E in this driver. Remove code that is
never executed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index cac4f8ff7b63..48c10b78f4a5 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -466,12 +466,8 @@ void ODM_Write_DIG(struct odm_dm_struct *pDM_Odm, u8 CurrentIGI)
 
 	if (pDM_DigTable->CurIGValue != CurrentIGI) {
 		ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-		if (pDM_Odm->SupportICType != ODM_RTL8188E)
-			ODM_SetBBReg(pDM_Odm, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
-
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
-/*  Add by Neil Chen to enable edcca to MP Platform */
 }
 
 /* Need LPS mode for CE platform --2012--08--24--- */
-- 
2.33.0


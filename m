Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCC3FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so11759054wmc.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=PAfVUWwAfKFC9k/MPdqzkVbFlRIkB9zgNuBixDd+OJBB+Debflp+CHG5YSQEUgVIrB
         7AYGKZxvUMoC59aJlBL47rFBEf7b+up/K7iGQ7ZGym6ZyAkeAdeBQviBIaWzxroBdJKZ
         AdxP0b1tkhcYhNz1wvlW1BGW7R09KlxuDCeDA5+4qoVdfHjAnitKHc747AHTD6UOgcSV
         4sKvs6TzmLLVDug0nf+LdbTnvUVtB/VSi1K8uBP93zxrGXrAgT4c3lQsslXw27MZGO5v
         dhSaOrkYi5o+NsqHmtoqvJNjdzCgsV6qV3S3VuXnM8Mr1uXmm32jVjROga9ilR7wPTtd
         1ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UmdvyLEdteIkPC5QKKxfnddWF+96+b6HOaR6hgtQ+98=;
        b=klRsHtg/r6FeeEGdWTWDoHo78g8DVqMYJUCarPmI9kmPTSTnScb4b3PJLX/RwZZLUG
         z+JoqEP4V3agWAtE7EZcSoKTrO6rzpXrubu56GFQqd+X2VH0q6vJ8SyanUjnnkOI+6gY
         YdwFOuBBc7WMDL9wY87OKZCqTiAyiokVpf0fVX7suHBJQzrIb6BN7MXa3oIuOx9BBOnl
         fyM5EHN7wHlsRSuiIY+I7EProswX6porWXC1FBPv4Sux/14FV837zXTuoq3SzpSaeqav
         5+xEcwkSe6OdyMnc0ZD6axp6FvKDu1gX28abB9tlcsselXVIXlHpne5UbAHGeNyauQy7
         3QMw==
X-Gm-Message-State: AOAM5304Nxyeg0MJ+bSVix7p1dgm7rhABogom9LAqi/fKZF54Zr46PxG
	iTrD1gH523W18R29dau2Fh0=
X-Google-Smtp-Source: ABdhPJydQyImRLwnzFLTBg+z+D1NBzDNoONwu3O0DeXLm4MKo+POprnIhGJdw8XpXBlu8Q32zYtvwQ==
X-Received: by 2002:a05:600c:4f8e:: with SMTP id n14mr4654195wmq.63.1631957108541;
        Sat, 18 Sep 2021 02:25:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 05/12] staging: r8188eu: remove unnecessary if statement
Date: Sat, 18 Sep 2021 11:24:36 +0200
Message-Id: <20210918092443.8724-6-straube.linux@gmail.com>
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


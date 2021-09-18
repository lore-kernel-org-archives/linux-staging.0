Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D73FC9
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:25 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v5so42573610edc.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=lOFwAENwRZCqB/7vN1B1bjeEVrED3ORpOrsPKE+o/8Z4jIB3JpRKP0H1llDupxUeF+
         41mwwWK/712kDacF8eWJjulzDmnuQYGAYYVT+jNkjt3VCy3DYXNNyjLzZeufEwZSFTm9
         4RfHQC1yKkBS/mf9gcgwAt+8ZPqykTBZMVtIOlqaD+GC8WD4cf6TN/qY81hS9fziHO7j
         m/i/j8cz69cwxZreLcvv93iHwSc03P1PJwxDYI6Q2OimPRo4QTypgEIxNpYGJiB9LsGy
         YkRoyzYo0l1K/tvQYtkBmOXTQFfAc+STHOh3NjGlWbRoxd0xeKgUHLKqq3C1P5XZpObi
         DXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgAFzPYLLEIZyR5p3BVXRSzgw7xSTQ9/sY8TbwA9U/g=;
        b=rwqX6U9gZgjhIxwHYUluOXUNaA6JI2qQ9jDx58jg1pVk0rSZzaqGJZUiy+2NZqPZwZ
         53ZdsgXhH4ieoBwP5RAHWzFU9FaEHLh/ZAWJ0b/DEmQSlr/2VFB4fRtg13ziQJzE24mM
         ohbh3/AXaZeCpgC1hyzn7A+ixZUGpNL+JUvJAaTaPTlBaQHxYg354O0esnjoRxLN6/hF
         bfp5WqgSf/eUa1ib8nnvQhc1chJq2VbHYQXQboFqxv5ETgCxuP3jrY/0qFTYXpVJwth8
         KZnQtcOALfjE/kvppjywFX9UfYA+eaxyI/UAvYxswSy+oxT5kxY1b3D9MoN8iwAJ07Ax
         lCnA==
X-Gm-Message-State: AOAM533pKFqF0B69mNvB7ylYMUZlFkv4G08ZSgQI1Fhr7bDvOPIrs/GN
	HayT+fHHcOGOiF3x3pO3LoU=
X-Google-Smtp-Source: ABdhPJxw7wwwCZFqHc8ef5F9ZwQp1DvPLhnD+aq2AxCoG+PfhY5+nL7+tK1+FvlzlIe3DND1M+YzXQ==
X-Received: by 2002:a17:906:9395:: with SMTP id l21mr19229580ejx.308.1631989164211;
        Sat, 18 Sep 2021 11:19:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.23
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
Subject: [PATCH v3 06/14] staging: r8188eu: remove more dead code from ODM_Write_DIG()
Date: Sat, 18 Sep 2021 20:18:56 +0200
Message-Id: <20210918181904.12000-7-straube.linux@gmail.com>
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


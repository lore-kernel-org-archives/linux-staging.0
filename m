Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9F2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:33 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gx5so11747708ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=Lj8cqDC1w71yvV68QUQjJqo1onXFIFaRvucg/ATAasvTsVH6P3WK0QRxqlBL+4rpZZ
         z0u2pphhwrQw+pggfE3FaZsWnKgjOZn7XVN8HJHULh5LJ7ozG7PXUmnulI5RpRZVbVts
         NE91jS/o4aJxpFxw3OHXTIYTPFfmdO2zjFLn9BK7nAv+2NatEs31deGSPH8TJ1jXL/gQ
         ++sXel/Ai8hYBjvC3M0Uq7kd4qD9XoKwjceEwSlY+c2gVT+HP49od0gF5kk8JP80BjC3
         ZxPAmrzw5uHq70M62uOEYDvHXrK8qiDE3gmDZAqCHWDALrg/wz+KiHCqmSnk2G4Fr2xE
         gJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=sjUZoJzEL50ryKmQjHrxImBTtruKxMPTQZAFMAvNLuDyw4H5UkUzwwLp/83Of0IMFe
         BUfXN8oCIbyMLBAopx8iPZqXRuyqckizuIX8qsUxA7VgNGJG5VSHpdltNuWHTYRUh1GL
         EzA6GBU+bUfFebP51QiV9dhu1ZJhf/O0QpfqxNvjm0OoXzMV3zcbdU+n7jXoy682JkuU
         y/cNsoZ1dvy1bFKLWk48ZiqbvQfH6MORPBb9TKSuvxZb2x7SM8eLeVPigY1Kgl2mKys8
         Fch9y1SvZJq2+oaDEKdm1siJbmVr0TXzMEAI4KwwDXasRXUza6lOyVRqMm6KUIcVHYvE
         Z2HQ==
X-Gm-Message-State: AOAM530W1FK450pfbpBsIIcEmTJU0HkjimD99BftF/gh8P8UNJZIuiVU
	8I8auNglNIfUZoCNwyYRNJqELDf7T8XCrw==
X-Google-Smtp-Source: ABdhPJyuSWLYSgujn7CLdFgci10905rObx/o86kJ5miQhpMSAjXl1UHKus+MEH3csZxB4aBNCn+/jA==
X-Received: by 2002:a17:906:3111:: with SMTP id 17mr2701005ejx.403.1619768672641;
        Fri, 30 Apr 2021 00:44:32 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id j20sm1415518ejc.110.2021.04.30.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/43] staging: rtl8723bs: remove empty #ifndef block
Date: Fri, 30 Apr 2021 09:43:35 +0200
Message-Id: <a114cc6f881315676862315228da6ad16b02a96a.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifndef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 78b9b4548dcb..3faf4da42bd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -91,9 +91,6 @@
 		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
-#ifndef ASSERT
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1


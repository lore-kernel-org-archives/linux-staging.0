Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4D870
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id z24-20020a1cf4180000b029012463a9027fso8907664wma.5
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RuGgfLKupLbilqe/abvITO4+NbqEOUhJydw5ktosY2U=;
        b=JtikVqNzCVWPhSIuj8e73hDmbSRhwxEFds6eZ14gXvou4K4Ofl0Oyxt7YUQ3aDFseJ
         UbGAUFDYHrE1m1eZvX91G9qw+KbVGh+eAAgXSn3nNv3RvQygR0aHI2UXFUnNr0jqlR/k
         ciIgU7BPJp520GTV0Jbikc+RrjrP3L4yGRmtV8ECwVzmKG2avv5ZPyNX8PIB6h+MQgCq
         vP1AG1sWZcbZBvGnIFAvcIoXZeQwsaLNH+eciP0PMRN5ari0meqdvD1RjgylPggIMCav
         WG/THW9+e74p3OSEHgHFuqHbEl1Xd9OJUeMjIu6HSSD9nFJzrgV3BK+TkVFHz8EWKurL
         zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RuGgfLKupLbilqe/abvITO4+NbqEOUhJydw5ktosY2U=;
        b=eo6E2uF0PnjPAszp4Q1b6pqGgSp+i+gv6RkqWiRlNt1xWRRpezVsKRRJWIn0mp55Gl
         znrqj1KgMVpc4LHydHTXLjA9KALFYsaH/C9glC4gZmjsD7bPvmEAIphIge8ohreZBldv
         piWooJhhG+2pGNzqHelr2qQW1HBS/J8X1XsBl5GEX1GXlNMQ5CErxdrOE6aNGBfg3RAO
         6TslQV3pFyGU9j4JB1Sgj6MlapxxxUgSXs4mP8osfKNMn1H38ImhO1W9w3+59QdlIarb
         EXvZv5Ln9ZubLOh8fcDDX9P+ieUVzLDlE9F7SX8HbzOq6smgDGiIMIP0Of8I7QLLvLEC
         qPhg==
X-Gm-Message-State: AOAM530GLkpdby3sqQzW/yR37GRnyzpRo2SzzwhT8/uuyBjdQANUE5P2
	0YvrAWvhkeBA7exiy5l1ChY=
X-Google-Smtp-Source: ABdhPJycRHRBPJxQMUKwoCFVTOW+SGfPwd2DmIislYCi1LKVxB2NjrVRpRBQnwKcFFL64J79uCnZIA==
X-Received: by 2002:a7b:c401:: with SMTP id k1mr440042wmi.48.1618325800163;
        Tue, 13 Apr 2021 07:56:40 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id v3sm2641828wmj.25.2021.04.13.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] staging: rtl8723bs: remove unnecessary dump_drv_version() usage
Date: Tue, 13 Apr 2021 16:56:30 +0200
Message-Id: <9ce6559cac69eaebfdb07206921d14e99d2b1967.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618325614.git.fabioaiuto83@gmail.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unnecessary dump_drv_version() usage.

This prepares dump_drv_version() for removal, before
coccinelle script application.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a9a9631dd23c..d5ff22ebbc5c 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -491,7 +491,6 @@ static int __init rtw_drv_entry(void)
 	int ret;
 
 	DBG_871X_LEVEL(_drv_always_, "module init start\n");
-	dump_drv_version(RTW_DBGDUMP);
 #ifdef BTCOEXVERSION
 	DBG_871X_LEVEL(_drv_always_, "rtl8723bs BT-Coex version = %s\n", BTCOEXVERSION);
 #endif /*  BTCOEXVERSION */
-- 
2.20.1


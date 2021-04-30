Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630832F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id u21so103861018ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/M0m/Y8BdrRV1bnmW/B/8hRNKy6eekh8cxZ9cNaqvFk=;
        b=LoMxfuHlN/E2VET+zlRycLb0O0Ngw3+Zw25eaV88DUcnCj+r9tIsJP12h6CDxpM8m+
         yBIBxZdXbZcH2d952Dq+QjJzQENyJF5Nu0SGMB1XEIWO4onqbFP6PCiowml9HlHkYAHc
         mO8MybxYYCLzcurYnDhV33MwvuNXEPvXHOkpZoHE24jo7hXOtgIsGU8Vi6mJlQVxS8GH
         g8PVcl2/rTo0Y8O56a0wx4YYSAZCrNyPTh6h7RvZdw6JUqXXZ3O1FJfQ4BNDFpd2W4aN
         yBiGQu1MbTMsim51xscucixe5dLBH+ucqgVLLNhGGBrX8AUB611Ps8jkOKw1BJKit8nL
         Jx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/M0m/Y8BdrRV1bnmW/B/8hRNKy6eekh8cxZ9cNaqvFk=;
        b=ciEZhEmMI+AwSRrjXQGpz1r2UqA5ZNY0uRaGpM//z/wH0McUTtsWakOFDPxtBaJ5nx
         PVcCsAHuVnGJPF0tGh+meKP+1yjHlAqC+x5zbpcVMnHEfXg+XDRQ69s/BIjxnkEEqzIK
         +H+BSNLwM3uVJRUYG4epsE9nx4Hz4vxnEiy1Gl/hMJVTMVRm3G3Yd9HXOe6JT4+r3Tqm
         H+GZFVfyGW85oLCPaJwGL95YY+cVl1Yn0jrcKoUvqqMczdnw9hjRKUEE4WyxcIpooqGn
         +YcLfociKjRfHl3ENX82jAt8ILLorra9ZMFfVvh7Xq3iwwQb+3khbJ01f5IgfRBBdtIj
         7q1A==
X-Gm-Message-State: AOAM530i3X9L9KV3Ao83f+cKBA7jxk3ncJGMuuABnLXzi7HvfPlwsM6t
	Ua/IlPKGBmbTlRR5GlA/MJA=
X-Google-Smtp-Source: ABdhPJwY9AH0R8gPpKhh4uZkeFXHr6NNpdYoYQUsGixn27ts7NlBkyr0/2gpkQCGBm6HvIUruoUnRQ==
X-Received: by 2002:a17:906:3bc6:: with SMTP id v6mr2838360ejf.165.1619768712073;
        Fri, 30 Apr 2021 00:45:12 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id y25sm1532955ejb.34.2021.04.30.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 40/43] staging: rtl8723bs: remove empty file
Date: Fri, 30 Apr 2021 09:43:58 +0200
Message-Id: <201550b342b5578d375dfb5d98d0c65a9ee6f95e.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove file left empty after function deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.c | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_debug.c

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.c b/drivers/staging/rtl8723bs/hal/odm_debug.c
deleted file mode 100644
index 1a2e367bb306..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_debug.c
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include "odm_precomp.h"
-
-- 
2.20.1


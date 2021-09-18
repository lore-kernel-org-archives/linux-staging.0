Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526F3FC8
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 18:19:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id eg28so20096702edb.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reovVjRvWVVgh0neDi2EWdAtfsrfN9OXCYPujWCZGUs=;
        b=HKfImwqMFYaXWyvS41+saMk56CfzFm2ioXn5+Z9hfCfexWI6eZKu+9RU7XccGNDgsG
         gzVYpt8r2FeYUo6i0u8OMxvuCznuGaj9FXr0X/kfq1VpT4215OOB79XxfK8lngWed1Xc
         AGYuq2IMrSQN4dthOGT1tB0XgfEr5jD2p4Ar8EudaR0j/6o1y3VbiqUE7zhGbMwBJW3G
         b5zBRINFTjO/rGbsy3GVKMmx4b9Pl1hMmLsdMfEAtKXoBr8WAop7xJ2PBAwcsUQ9YNfB
         A6Dcq+b2QkSK9LE4xiQa1lth25YfY9ozSf8bsi1Cu5UrhWFCPE22yG89b7LLVhJcwxf8
         GtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reovVjRvWVVgh0neDi2EWdAtfsrfN9OXCYPujWCZGUs=;
        b=4lFERcg5jXqV1vpwV5Bpip6DuK3zB9uolRgacGpp8Rq0/LVjFy8hMS3+9PchbU1+XV
         jNeplzorwmhJ0mc/9MWwTXcai6xlZfrIJCqnqdw5BroPqX/Am1zx19ve8ixa3vpdVAFa
         tTBB/vriyF1Jh3tjEgdiawTx0/zaLjYVTuc1N9zedhYeVl4IU+VFo/iqaAcWwuXlHDbE
         wrvFzWV4CbpGpKasG7cwn3+NGWslv70zBFYFDrzwMN0HD7RST+RkLW0BQNqB6LD7Ol9I
         qY+a4h3eKWHOQfbs3qWkQBdWKSvs/0nCdKXdak3gYcQLeLghyBIyjGuj0H7YZ7SVd+Jv
         mLQA==
X-Gm-Message-State: AOAM532krRVjqe4bSqO7+kFfxINwY3558hdTg1ZkXDAe0YFR9fn7a1dW
	Cs7L7Mz/H5nNH4FEg8GprgY=
X-Google-Smtp-Source: ABdhPJwQKHtl97wrZSF00SqANVeBp3XiYKVSvfMfFF/gPeT+nTK75EkuVfhC/c0WQzRj49jcKR4n3Q==
X-Received: by 2002:a17:906:dbd7:: with SMTP id yc23mr19177092ejb.187.1631989170033;
        Sat, 18 Sep 2021 11:19:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id t19sm3903673ejb.115.2021.09.18.11.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:19:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 12/14] staging: r8188eu: remove header file odm_RegDefine11AC.h
Date: Sat, 18 Sep 2021 20:19:02 +0200
Message-Id: <20210918181904.12000-13-straube.linux@gmail.com>
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

Finally the header odm_RegDefine11AC.h is unused now.
Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../r8188eu/include/odm_RegDefine11AC.h       | 29 -------------------
 drivers/staging/r8188eu/include/odm_precomp.h |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/odm_RegDefine11AC.h

diff --git a/drivers/staging/r8188eu/include/odm_RegDefine11AC.h b/drivers/staging/r8188eu/include/odm_RegDefine11AC.h
deleted file mode 100644
index bba7511cf244..000000000000
--- a/drivers/staging/r8188eu/include/odm_RegDefine11AC.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
-/* Copyright(c) 2007 - 2011 Realtek Corporation. */
-
-#ifndef	__ODM_REGDEFINE11AC_H__
-#define __ODM_REGDEFINE11AC_H__
-
-/* 2 RF REG LIST */
-
-/* 2 BB REG LIST */
-/* PAGE 8 */
-/* PAGE 9 */
-#define	ODM_REG_OFDM_FA_RST_11AC		0x9A4
-/* PAGE A */
-#define	ODM_REG_CCK_CCA_11AC				0xA0A
-#define	ODM_REG_CCK_FA_RST_11AC			0xA2C
-#define	ODM_REG_CCK_FA_11AC				0xA5C
-/* PAGE C */
-#define	ODM_REG_IGI_A_11AC				0xC50
-/* PAGE E */
-#define	ODM_REG_IGI_B_11AC				0xE50
-/* PAGE F */
-#define	ODM_REG_OFDM_FA_11AC			0xF48
-
-/* 2 MAC REG LIST */
-
-/* DIG Related */
-#define	ODM_BIT_IGI_11AC				0xFFFFFFFF
-
-#endif
diff --git a/drivers/staging/r8188eu/include/odm_precomp.h b/drivers/staging/r8188eu/include/odm_precomp.h
index ffc6f8ecafc0..cd8e3d2db212 100644
--- a/drivers/staging/r8188eu/include/odm_precomp.h
+++ b/drivers/staging/r8188eu/include/odm_precomp.h
@@ -18,7 +18,6 @@
 
 #include "odm.h"
 #include "odm_HWConfig.h"
-#include "odm_RegDefine11AC.h"
 #include "odm_RegDefine11N.h"
 
 #include "HalPhyRf_8188e.h"/* for IQK,LCK,Power-tracking */
-- 
2.33.0


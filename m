Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B5E3FCC
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i23so19197838wrb.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=reovVjRvWVVgh0neDi2EWdAtfsrfN9OXCYPujWCZGUs=;
        b=HclLpT5aCCA+KL2o90azu8rN/oVe2uHN0zUyJwyrfVasoG57Uk4NrUfSVnAdta/k85
         ZhISz2qCBbJ7L/CEMgvP+AYtj9DIBtRu+IjjV1mI8yvt1lQxgEiqVWll9jEcNXIDQxLS
         5YrBoL9ACEkBFWSnSKi7KLGbTmFyl9Peo0U2BPqOE7Zyjku09DFLyv1fnLKavFsgYeEy
         Xfc8yF9UQjvUSGijouizzJtijjG8JjDDXbAdsyLg2IrtbSsstlTQVgOJlkiim+xh4kwb
         ygJOi9vYpGQuirfdKttxfXWmEdKq/Lp3xtp/GO3bkj+/424irmlnMjtKrO/12sOwlDPR
         hmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=reovVjRvWVVgh0neDi2EWdAtfsrfN9OXCYPujWCZGUs=;
        b=D9QyA24NBrfZqjW2ej/mi29BjspLGX55jezqPKHk+zJ7BodkqCcjn9z2SleZt5tfff
         YFMd5XKl1PtjcYv/PTGgr084YSUDQ9fL84gwUHm/E9mtzg8oF7MGns/985oHs7aDpdov
         1SDf4C9D1/DVL+I4Xn5ZqYY0IvlPlmFXxERYZeu96wPBANsdvK/cTxjx4ReDtcjuEg/b
         FNh9TuPEo8vq73cpGmHJysNIyldVyrzXy6Ft3Si5QKoa0dejZrtVsTMZMaplkv7a/iKR
         DgwoTLOpPlExM5OpAmMSnMIIvPEn1WGRU5LyakbwEWseQH7JBjRtRVXmVyyYCTb8SK8e
         TVVw==
X-Gm-Message-State: AOAM532aYMUSBUoFQoWc3ioPxjNaawsvN+jGqMPYL7JQjsdST15Rcumd
	RAdVeUF2YdfuoXsPb+kCT0w=
X-Google-Smtp-Source: ABdhPJySEoNnyYOQtMa+y42ZBOhTvlXO2RPrn0PWLPFc2QOXOdbuTOCIcmhXc4xBS8zgSfLsHADfsQ==
X-Received: by 2002:a5d:4287:: with SMTP id k7mr8587682wrq.347.1631957114498;
        Sat, 18 Sep 2021 02:25:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 12/12] staging: r8188eu: remove header file odm_RegDefine11AC.h
Date: Sat, 18 Sep 2021 11:24:43 +0200
Message-Id: <20210918092443.8724-13-straube.linux@gmail.com>
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


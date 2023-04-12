Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EE36FD2
	for <linux-staging@lists.linux.dev>; Wed, 12 Apr 2023 17:51:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id l16so6594553wms.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Apr 2023 10:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681321896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjAgg+1rXP/ibl8SV/Shge5MrmdpY6vrV27SsO06MJQ=;
        b=NRi333288ZygCOmiAdCNJosEPjp914KSfy4zw6TQ3mpCB2NW2Oc7MLkDl8u+fxJ2F+
         lBgeTJ6H3PlMjRFGgQ7EWGxUGtJ5zd+9Q8jcFRgo2oly7eOp0UDea1KLH8wwJtrHufMT
         yOEw/VYQlWjWE5Hvjux8cq/wMUKuWlP47MVE6XZ68LzlAL0k2wvWT5a0p4NO7shZ12S3
         eWFWqYwWrF/t6EV46O22tHBrWYUXROl6BmhjQbyE0xrbHQHahqyjrhCgqD9sNntTcD5F
         6Eum7Qg/RBPgxE59ARg7HrC3/2XVqKILrev6CHuHrWMkk5O9oU3OQr1qsXbGe3cIV8ep
         FYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681321896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjAgg+1rXP/ibl8SV/Shge5MrmdpY6vrV27SsO06MJQ=;
        b=RzhHwbjX8qDhUUGhSRVpssbRbzSezeGKm4eoJvXk9ZwDy/Yiwlp3WHlhrBS/yctgos
         KKKuaLeoRHf5hQ1E41EHzSktAyl7IVqzhCq2wM9Lem0g/6gr9xs7CM0g07CqYsTO0e+T
         V3nEsVj9IBWsw2LgNK1qtTFeUJbbrpPHI2lRr6hLiZ3FV7JEYMQVIOqTbLI5uwK6b562
         2i+11MHCsa6NeQlhrfqow8FOaMyM5BNk4oBUdI+D7JvVUHDjGBi13aggJhNasxlkMmKD
         ziFfNKrvOHIPqirgz/h7Tnu4+ekLg7radAHogfgUd3wxeBcxk6Tpuc5yozE+p/YuwgTB
         YInQ==
X-Gm-Message-State: AAQBX9daGUep592Zklk4wqzo12vsic/7pDxOd6TDj0LlnnE+M8U5O6HT
	r4XJaGUib/fXhIAbQm1wq20=
X-Google-Smtp-Source: AKy350aAdus6rK7PINuCvPZWM6juWt+b37hP4pj28oYO6b0OU/bUNn3+Jc4vYAMOYLhaHLJsJGvrBw==
X-Received: by 2002:a05:600c:378a:b0:3ee:b3bf:5f7c with SMTP id o10-20020a05600c378a00b003eeb3bf5f7cmr12625430wmr.23.1681321895701;
        Wed, 12 Apr 2023 10:51:35 -0700 (PDT)
Received: from arch.localdomain ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.googlemail.com with ESMTPSA id v13-20020a05600c214d00b003edf2dc7ca3sm3056020wml.34.2023.04.12.10.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 10:51:35 -0700 (PDT)
From: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>
Cc: Angel Alberto Carretero <angelalbertoc.r@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: imx: utils: Enclose IMX_BUS_FMTS macro in parenthesis
Date: Wed, 12 Apr 2023 19:51:01 +0200
Message-Id: <20230412175101.8746-1-angelalbertoc.r@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <ZDSgWU5GXPFdJ99o@aschofie-mobl2>
References: <ZDSgWU5GXPFdJ99o@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conform to kernel coding style by wrapping macro in parenthesis. Issue
found by checkpatch.

Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
---
v2: changed commit message and description thanks to Alison suggestion
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 411e907b68eb..eb44c09071de 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include "imx-media.h"
 
-#define IMX_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}
+#define IMX_BUS_FMTS(fmt...) ((const u32[]) {fmt, 0})
 
 /*
  * List of supported pixel formats for the subdevs.
-- 
2.40.0


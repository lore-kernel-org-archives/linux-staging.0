Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC031FA0
	for <linux-staging@lists.linux.dev>; Sun,  9 Apr 2023 20:05:20 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso12746012wms.5
        for <linux-staging@lists.linux.dev>; Sun, 09 Apr 2023 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681070719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ngtqh6lY40sQa87FOJ7Q2UWB/nz6Pl08B/HLHoV4Hq0=;
        b=Xgf0dDYycuvGmqNiN2WXKEJtkoCH1kC7TyOUemxXG/tjLD+H5Y2RsKUuLQuobjFb18
         UqG2mGJb2xLrGlCxYFBRPQjOFDGR1ro46SD3osB1sT9dmfCBTgC6/FBJc2gBfMrvLqQX
         tB1HB93NwC/N17g3lUGSz0jZW3Qy5h8+nmlB1QmmaKVd1oF/iIus4aUMOpeuuxko6pmL
         Ul9sCDbAXTae8je+LQr9CnJk14+yeGfQlVLdpXbToSGJgQrVhvv7oibH37vbP9TG0cEL
         YvZscBXqppQFrYHjzJWdcgiAYrAFl4FG1TfSSYB6460xvwUgb4wG8OfXgSXFCLyZgNs9
         S6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681070719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ngtqh6lY40sQa87FOJ7Q2UWB/nz6Pl08B/HLHoV4Hq0=;
        b=cBdE2zu7t4cX3BdUFiSHAyvpOIOqX9m/m9cGI69MCtNGOJuwYcNjTPz0iF6FkZi/dw
         6KNkh2O71FIAcpiiGEZAcUTlqyKglzYqPjr0mxo2lYZKbsrU5JNdH7hY1aOV1h2ouv4P
         fsLHUpbZmtKYYGOJx7sqJy/vGKrZit2Kp+lRx5c59Dm3/bdZ5OOoZXF4Hcuv41TLXDaq
         4eJjgKYvwrBmGSP888E/pWtLRp7oa0UI+lsoRUyxTFzAIiJmZ1tEuWMeD5/HzipNb3ce
         RyksaMhml+uGkBTKfV4j3Ct4O8qZxLF1trPhfMU4tPfVSveAFUYDL3ldTZyeDWRFRw+6
         Fp9g==
X-Gm-Message-State: AAQBX9e47NLwAoZ+1iLwMndqCpOGs+X5ibnnWq22tLzU41VzF6rbvMIm
	+eokFoB7SLxb10Li4vDT4As=
X-Google-Smtp-Source: AKy350aOz9m2VO8vtaf6WmEDkfzKOZGRq9rYc5QamRJ7rCyeFNgRJMSwNWs11M97CF5BWn2A0mFDRg==
X-Received: by 2002:a05:600c:2048:b0:3ef:8b0:dbb1 with SMTP id p8-20020a05600c204800b003ef08b0dbb1mr3473794wmg.7.1681070718740;
        Sun, 09 Apr 2023 13:05:18 -0700 (PDT)
Received: from arch.localdomain ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.googlemail.com with ESMTPSA id b5-20020adfee85000000b002c557f82e27sm9846711wro.99.2023.04.09.13.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 13:05:18 -0700 (PDT)
From: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
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
Subject: [PATCH] media: imx: fix macro style error
Date: Sun,  9 Apr 2023 22:01:36 +0200
Message-Id: <20230409200135.1033677-1-angelalbertoc.r@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap macro in parenthesis to fix checkpatch error.

Tested it by compiling the driver successfully.

Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
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


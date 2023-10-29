Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A733C7;
	Sun, 29 Oct 2023 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itZiT8J0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso5989554a12.3;
        Sun, 29 Oct 2023 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698617243; x=1699222043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5EcvsKKWujXN1u8l3ldEd2sae45jZkF+al3+Z3aUziI=;
        b=itZiT8J0ajYR41vqPqBOGTl+QMEcXdGAJoVtwoZiIk8H9lLgUu1YOFo6NpEH58LC79
         6+wXQmNkDBQnsDLt2wFJIc6Vi9fMyArQAHXqrWQ1nKvhxbg/u1mOq+TbZDBkxWQU4c2d
         45GHz7lhmcOfNKlx1odKPz2M/xnFgTsUSk5TvIPr6rg+h4DgSKDWQMONSFhCFr4/6jaA
         Y0E+8kAKs5tWn67F3Kq+3uiMjb9qa2lfMSd/dodRbPgVMluzj0WHFXf4f81EgYIc7Ohl
         yGanFJZvd7DKOyRrWEnUeIWykXVMm3fV1ueogS/xisGbL3oah2pmZJM1NOEJr80INQeF
         twSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698617243; x=1699222043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EcvsKKWujXN1u8l3ldEd2sae45jZkF+al3+Z3aUziI=;
        b=vfOCohUygseSg66trc8b5heQNssb/T0+lvnYyJFRP5E8O0laA5seGUVCwTW9+cBhF9
         bcpSjrjeKLFh5z7pU5q1NiIimR6Up7dOi9hiU2enCt/ATXfXvk01/oAzUtn9ThaXW+8E
         xFMOB1F6xCq4nNafhbowR/+FPCbvO6i7vPktgzh1boStLP7qe7hnkoJSFUCzf1Ye88E9
         i3zXGB4YX8BY8ZeChWDX3oinRUlV7Zzpe8UTD+jHYv4cqaeKl5M2zeDRtNLlH/oZ1o8x
         tfFgdc7kdeXjkcnmMoEiXsJATcBxWpzMCRgclhNXB7ayymrm2Hj+vvVQftcXVc38Wvpv
         xWdg==
X-Gm-Message-State: AOJu0YxuF6X9W5rMD81MFHmHsm2ScKR8ZjpPtC/PQuIOli3e6wYWWrTZ
	Ewgq1PFgwrXvk1Ri1WmkBVU=
X-Google-Smtp-Source: AGHT+IFtGibfskZvbNGDOf/rSmu8ZBvGaUKFm8MxvUBw1WMmiZBYtPrR5i6MNHib1lIHHocKn8ExKA==
X-Received: by 2002:aa7:d50b:0:b0:53e:7d60:58bb with SMTP id y11-20020aa7d50b000000b0053e7d6058bbmr6906369edq.27.1698617242685;
        Sun, 29 Oct 2023 15:07:22 -0700 (PDT)
Received: from nancy-1-2.. ([105.163.156.232])
        by smtp.googlemail.com with ESMTPSA id u23-20020a056402111700b00533dd4d2947sm5073092edv.74.2023.10.29.15.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 15:07:22 -0700 (PDT)
From: Nancy Nyambura <nicymimz@gmail.com>
To: gagallo7+outreachy@gmail.com
Cc: nicydaniels@gmail.com,
	outreachy@lists.linux.dev,
	Nancy Nyambura <nicymimz@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Media: omap4iss: Enable RSZB and update resizer control
Date: Mon, 30 Oct 2023 01:07:09 +0300
Message-Id: <20231029220710.47063-1-nicymimz@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable RSZB functionality in the OMAP4 ISS driver. This change sets the RSZB system configuration register to enable the RSZB module. Additionally, it updates the resizer control by setting the RSZ_EN_EN flag as required. This change enhances the driver's capabilities and prepares it for future developments.

Signed-off-by: Nancy Nyambura <nicymimz@gmail.com>
---
 drivers/staging/media/omap4iss/iss_resizer.c | 34 +++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index a5f8f9f1ab16..23089eeaf448 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -7,17 +7,17 @@
  * Author: Sergio Aguirre <sergio.a.aguirre@gmail.com>
  */
 
-#include <linux/module.h>
-#include <linux/uaccess.h>
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/dma-mapping.h>
-#include <linux/mm.h>
-#include <linux/sched.h>
-
-#include "iss.h"
-#include "iss_regs.h"
-#include "iss_resizer.h"
+ #include <linux/module.h>
+ #include <linux/uaccess.h>
+ #include <linux/delay.h>
+ #include <linux/device.h>
+ #include <linux/dma-mapping.h>
+ #include <linux/mm.h>
+ #include <linux/sched.h>
+
+ #include "iss.h"
+ #include "iss_regs.h"
+ #include "iss_resizer.h"
 
 static const unsigned int resizer_fmts[] = {
 	MEDIA_BUS_FMT_UYVY8_1X16,
@@ -30,11 +30,11 @@ static const unsigned int resizer_fmts[] = {
  *
  * Also prints other debug information stored in the RESIZER module.
  */
-#define RSZ_PRINT_REGISTER(iss, name)\
+ #define RSZ_PRINT_REGISTER(iss, name)\
 	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n", \
 		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name))
 
-#define RZA_PRINT_REGISTER(iss, name)\
+ #define RZA_PRINT_REGISTER(iss, name)\
 	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n", \
 		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name))
 
@@ -116,8 +116,12 @@ static void resizer_enable(struct iss_resizer_device *resizer, u8 enable)
 		       RSZ_SRC_EN_SRC_EN, enable ? RSZ_SRC_EN_SRC_EN : 0);
 
 	/* TODO: Enable RSZB */
-	iss_reg_update(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_EN, RSZ_EN_EN,
-		       enable ? RSZ_EN_EN : 0);
+	u32 reg_value = ioread32(iss->base_addr + OMAP4_ISS_MEM_ISP_RESIZER,
+		       	+ RZ_SYSCONFIG);
+	reg_value |= RSZ_SYSCONFIG_RSZB_CLK_EN;
+	iowrite32(reg_value, iss->base_addr + OMAP4_ISS_MEM_ISP_RESIZER, 
+			+ RSZ_SYSCONFIG);
+
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.40.1


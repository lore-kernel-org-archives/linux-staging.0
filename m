Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748E71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 15:07:43 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k8so2175628wrc.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6e8KU9fk/1P7iY76hALRoVzDDpKZGRE6STiYdEDt5Z8=;
        b=tkZ3WeOnNZ/rYuTknOHdEl8iGi2/VAZhTwJWoyFipF7BHeyFfnWA2HDqWIzy+75TS3
         lzTGaBvba9eO0rcyi5pSePT0dj6mk79RfK4W1b5Lan7a1PuMVmvxchI8GBtoTAsiPuyt
         wZqrJEg3GvudG7OqfJebmoYOrbcmaD4Z2AQiAai//EI5V0wPIHvOGa+Z7ys2WFUyQM4X
         r5Kxjz38AG2xmHAmsDyDMJxXaliI7yVLNIUumcGATgynjj6nGBRD/SaUKchtYhRCtxoh
         ByMWTcPB1o1HAlnZlyZOGH2E+2ifR9nyVdT0Z2+HVrffjuXrOCOnu/iM5KiIq8Ttktpa
         I4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6e8KU9fk/1P7iY76hALRoVzDDpKZGRE6STiYdEDt5Z8=;
        b=FIfZ5j/LYuXUsVC3aLg4ch9E8u8O1nOgOcbyXAdVVEFZpFyvXegjEcHrbQMd8lsgG6
         nAPvUUDRbb4uRKfDCbKLu6JMT28zSW4wNfxAlDqZmLmocfGJJonhyOs/zBILUSj9Vczi
         7La2F28M6Lr8ffTR65/Je0OcDJiAvE+QcAIJjtJtMSz4bwX3TVdBevaRhaj9+zJwlgjC
         f9L772ZM7PudhDC3uXyX++4BOLGbj6LE8w7xrjIDsvr+kivCOudLYFi4XA/mN6xBFw4n
         anW8T6kyGXtYOeWFJSfS6KFP1Qwk/olccGc5CQLOuWR2fP1qNXu1Tw83283AVpEccCaw
         bFkw==
X-Gm-Message-State: AOAM531CBYF2GV7WOAYbr4E8zJL8SO5RKPZNar/XhX4X2W38470hRgtl
	CCLyMmgrnxQfvEONaYaGzww=
X-Google-Smtp-Source: ABdhPJx+dAauf32J5TWx3pS1+GTETRZNWc8x8kwAJZRD/qQcDdjNlf8E31TlkCFk66+mOcZtPzeAVw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr10360675wrd.156.1617289662171;
        Thu, 01 Apr 2021 08:07:42 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id n8sm9710108wrm.70.2021.04.01.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:07:41 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2] staging: media: omap4iss: Ending line with argument
Date: Thu,  1 Apr 2021 16:07:38 +0100
Message-Id: <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove checkpatch check "CHECK: Lines should not end with a '('" with
argument present in next line and reorganize characters so the lines
are under 100 columns

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 46 +++++++++++++---------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index dae9073e7d3c..e8f724dbf810 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
 	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
 		    ISS_HL_SYSCONFIG_SOFTRESET);
 
-	timeout = iss_poll_condition_timeout(
-		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
-		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
+	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
+							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
+							    & ISS_HL_SYSCONFIG_SOFTRESET),
+							    1000, 10, 100);
 	if (timeout) {
 		dev_err(iss->dev, "ISS reset timeout\n");
 		return -ETIMEDOUT;
@@ -583,9 +584,10 @@ static int iss_isp_reset(struct iss_device *iss)
 
 	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL, ISP5_CTRL_MSTANDBY);
 
-	timeout = iss_poll_condition_timeout(
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL) &
-		ISP5_CTRL_MSTANDBY_WAIT, 1000000, 1000, 1500);
+	timeout = iss_poll_condition_timeout(iss_reg_read(iss,
+							  OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL)
+							  & ISP5_CTRL_MSTANDBY_WAIT, 1000000,
+							  1000, 1500);
 	if (timeout) {
 		dev_err(iss->dev, "ISP5 standby timeout\n");
 		return -ETIMEDOUT;
@@ -595,9 +597,10 @@ static int iss_isp_reset(struct iss_device *iss)
 	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG,
 		    ISP5_SYSCONFIG_SOFTRESET);
 
-	timeout = iss_poll_condition_timeout(
-		!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG) &
-		ISP5_SYSCONFIG_SOFTRESET), 1000000, 1000, 1500);
+	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1,
+							    ISP5_SYSCONFIG) &
+							    ISP5_SYSCONFIG_SOFTRESET), 1000000,
+							    1000, 1500);
 	if (timeout) {
 		dev_err(iss->dev, "ISP5 reset timeout\n");
 		return -ETIMEDOUT;
@@ -1104,33 +1107,28 @@ static int iss_create_links(struct iss_device *iss)
 	}
 
 	/* Connect the submodules. */
-	ret = media_create_pad_link(
-			&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
-			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
+	ret = media_create_pad_link(&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
+				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = media_create_pad_link(
-			&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
-			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
+	ret = media_create_pad_link(&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
+				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = media_create_pad_link(
-			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
-			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
+	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
+				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = media_create_pad_link(
-			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
-			&iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
+	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
+				    &iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
 	if (ret < 0)
 		return ret;
 
-	ret = media_create_pad_link(
-			&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
-			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
+	ret = media_create_pad_link(&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
+				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1


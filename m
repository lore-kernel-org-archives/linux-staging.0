Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893B17D0
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 08:01:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id q64so15057185pjq.4
        for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 00:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUtj9I5DaycvSzgxtE8/kJzbgLxkG0A4qAZcb1Ik3Uw=;
        b=Iug9lggcLdqjm/57lXrkDU73hFp4XAorRNYHRpc1ewhXo9fSAMw4vrn3tkTB9UdYQ0
         H3ub98nM0ytJzbS49KOKWSqSZnlMBJnoOg4TH4ENOPzAs1KwdQ0OsG5u6fKJHnrvyE4K
         iH+87ylld7PasAUbmLTNcK8bO4AVpnIDhZOtHL40iSIXF1qx4sdXjlrWGRT3EajdEfpN
         ulSP/e5FmFb/iV+UtCCUemBRJQB+UbpO/seee2eVQdeRHXFY8IFHZj/YnbKT0TK1EKcW
         F2byNqs1dRTLYUOLgDV9iwqfMkEO+zLTvu5H+PRXVYQJfL+W1/Lea8m1CAq/Eu4jqbGO
         0ckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUtj9I5DaycvSzgxtE8/kJzbgLxkG0A4qAZcb1Ik3Uw=;
        b=MEDZ+XeAkKjrjtZajq5U+B+Z46V4UYxo9bDPQOqzQAX2FM2Edn/nN2B9hTJtsaDdIc
         6NpRM/Cbc9Jo5mh46fRL5Y1JIH1Xjg800sYoqaawR1U9HA7ZxsjI2YK7mbesH/KRMSKI
         MO14+aVI1XP6f+QtkeMZeOFZaxM4FbMJ8Bd5IFp/2dGLusU9LcFEiW5fsUQ753+u1UOz
         gJrTEme3l3S+WAhuy0gtCLTbEMVH8jbMJTgIOu3jWUSr0Unm6Cv8VTBCh3WVf1XAv47c
         GPNibd6AU8qKnB9xUN2/mjdz42XlF+km9ASjur2KoWBW4fhaydhOhUl/fvV1rasZmxKy
         QmWQ==
X-Gm-Message-State: AFqh2krC8bw/I2HEEUIrShnwcGXp6qEG/QktLhmvTANrV70O4PcI9ucu
	Ovpp47wylAwe4EDjjfddM74=
X-Google-Smtp-Source: AMrXdXviRsr5rAEHkEKrmNvUWIeJSI5k72lETUzXYeLHvw0dijkFj1J8herR+a+Oj//quo9lto3Gqw==
X-Received: by 2002:a05:6a20:b902:b0:ae:47a6:e6d9 with SMTP id fe2-20020a056a20b90200b000ae47a6e6d9mr1736575pzb.6.1673424103817;
        Wed, 11 Jan 2023 00:01:43 -0800 (PST)
Received: from gaurav-pc.bbrouter ([2402:e280:217b:6d8:bf67:b774:ee50:1dc5])
        by smtp.googlemail.com with ESMTPSA id w23-20020a1709026f1700b00189ed861791sm8558106plk.266.2023.01.11.00.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 00:01:43 -0800 (PST)
From: Gaurav Pathak <gauravpathak129@gmail.com>
To: f.fainelli@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vchiq_arm.c: Declare vchiq_platform_init as static
Date: Wed, 11 Jan 2023 13:31:24 +0530
Message-Id: <20230111080124.32274-1-gauravpathak129@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modified vchiq_platform_init() as static to fix sparse warning
> warning: symbol 'vchiq_platform_init' was not declared. Should it be
> static?

Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index dc33490ba7fb..ffa517077b80 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	cleanup_pagelistinfo(instance, pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
-- 
2.39.0


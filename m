Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B496C2CA2
	for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 07:10:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d1so11584773plh.10
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 23:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXoGqYo2y+bCVaCTIHHUoSe6xGzYWrBda92ceekLMjA=;
        b=IUI94W6n5iT79oWzjyBLQGuamO21vxqmVQMbbhrrI/ooBx6w7D0ATiQwThBpm8xtHs
         zmUPFLYuh9VEk6llfYtjR3sTqpT3fxMSFeAGuE+WY2VtExUnhBzlsO+dWrJdyQtoHoJA
         F77UARbNDFsgURHrDF0aP301QW7Nx+50r0bO9/9nUlcVzMs6oUjsqXvSlwZVApQJk1rJ
         Aiiw9NOTN8C9lltj2Z+qbNZokCa/YJDtJIcKub35lXCJ00P1zn15z2iOwLSzhFqpLJXv
         yLivBcbp1+Vc2/O9Go+m3WWPLIyphMJmRIvc+/t0s6R04l3MQu1iSpzk3hzFCSdXACQs
         tAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EXoGqYo2y+bCVaCTIHHUoSe6xGzYWrBda92ceekLMjA=;
        b=aSvdHJTn9m2vNv+R9hOTJEiVfz2iKGELWat4Eu93x69Q9FrbnSjpy1KiSyNgGMj0S0
         I1gbbNcgjDXyEoGxXAjPU5QcKMisaTGgTrQ2cxLouQaSxaKBefesaZ/EMROZ6wt0yQ4m
         9EU6n2voFvBCPP+MAFmQbowgFCeajAQfi+VD1avkLcGCAoadK8Kp5YUvh1WHfUP3AZhU
         06/Hqw8gEEk0m+uNRrQGhK/+gMBYolrVSwY6yF2J9qus4p4rRoBW/Es10JoiPZbt2+qp
         tw8OeFEowKyJUKdUCWjFaqW6Df23VJgrhy8/eGgBxWo/vJSWv2U/YA6psadf0ElitbBq
         UFAw==
X-Gm-Message-State: AOAM533Gn7J2+dzTPw59Ido8ay4BRGueI9X0azLKtoAjcxab4ZmBpK3o
	yZWTcMTc0UfvP7rlJrGhw+M=
X-Google-Smtp-Source: ABdhPJwEZXaIPTB6mkYByUXxajcLnSoq5qDsRUeG6ZEQr9iLGroanZi9GSC/0lAPmCmGeWsxxh2s2Q==
X-Received: by 2002:a17:902:7048:: with SMTP id h8mr8005725plt.40.1643613029103;
        Sun, 30 Jan 2022 23:10:29 -0800 (PST)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg. [42.60.144.185])
        by smtp.gmail.com with ESMTPSA id q16sm17404392pfu.194.2022.01.30.23.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 23:10:28 -0800 (PST)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nguyen Dinh Phi <phind.uet@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vc04_services: make a couple of functions static
Date: Mon, 31 Jan 2022 15:10:06 +0800
Message-Id: <20220131071006.1764343-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions vchiq_platform_init and vchiq_platform_get_arm_state are used
locally in vchiq_arm.c file, so make them static.

Cleans up sparse warnings:
warning: symbol 'vchiq_platform_init' was not declared. Should it be
static?
warning: warning: symbol 'vchiq_platform_get_arm_state' was not declared.
Should it be static?

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 54ab6208ddae..b1054550ed27 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -466,7 +466,7 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
 	cleanup_pagelistinfo(pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
@@ -593,7 +593,7 @@ vchiq_platform_init_state(struct vchiq_state *state)
 	return 0;
 }
 
-struct vchiq_arm_state*
+static struct vchiq_arm_state*
 vchiq_platform_get_arm_state(struct vchiq_state *state)
 {
 	struct vchiq_2835_state *platform_state;
-- 
2.25.1


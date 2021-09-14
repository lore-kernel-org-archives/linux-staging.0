Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268CD3FC3
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 21:36:57 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id z12so632771qvx.5
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udAMjuzQQXCmw/M6tlpuan4V6V3k6IzB88Y+68k1I+A=;
        b=NcDjiaFrICMq2t8AiYC0QR1foMx2X9OFceglBCdJBSFSmbw8Qa764mZRGKs/hE07+N
         qZ8gxdnLAXMJqqymPBeQ/wU1VIiQT4OYq6nW/rC9G7yNG0MxmJl1n15JwfufsxJAHYWD
         ppvCyXSETWO8I9Ijqc90AgfIp5AKCuvsPAOPUEsWkbP67Qs3ECtC5/j9QnOeovvJKWLe
         tKCmyYTJHFVCGZZkt+eJhKIu+zqOwEtYfi9HC895+ZuNUKoMMJhm3oxAyrqeAhJhAMW+
         TqvGv3ipHzryrZrGrqGfYG6DD0yXcATFLaoiFQIQ1JYT6vDqIv6XbtN482mQdKu31LBK
         QhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udAMjuzQQXCmw/M6tlpuan4V6V3k6IzB88Y+68k1I+A=;
        b=BwVdkfZsDcB/tvsm2U5zLliipcxlGrmkNOiW+nrkBv8yS8tj1oBr9/7E2NevJoxwYM
         CzeBRQdoSYw1kXCJhwWJrSgcB2uLX1B9xXIndMem6BWV9dnQDM6arzNjzzkh0KJJrmtV
         ELk9T0HuAmFJ9k88cukS7JBxghttGDuA/IOUEADq46aW2YOJJiV+xbI6bTlQeC4o8Ats
         s1qvXOEQKB/PCRQ7p2Y2cwAEdvnOI8zGSRZTpg4rYtroOoYDS4saPnJukmoQlCrEy3ZZ
         gOJzMvi/lG/+a2WHLXwUU/xT3zijaks8pOImRewY/lSVErIcNLV6ISZUoOJYFb9KJ8Zv
         x08A==
X-Gm-Message-State: AOAM533HFCvqjNrPXBnut1KZdGym5vltwQ7o8s8BIgi3G3oS9iXN/aDp
	41JB+PdNa5l7anXkQNSWFkiRj35CKYdzkA==
X-Google-Smtp-Source: ABdhPJxxXWO0eizgQx1CYU83tgTd5fvuSvlhbjAtTXF9Zcp944W2+8AW/NjkFcB1YPUHP0awC269Og==
X-Received: by 2002:a0c:8e05:: with SMTP id v5mr7695690qvb.25.1631655415960;
        Tue, 14 Sep 2021 14:36:55 -0700 (PDT)
Received: from localhost.localdomain ([191.84.239.65])
        by smtp.gmail.com with ESMTPSA id o7sm6716611qtw.87.2021.09.14.14.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:36:55 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/8] staging: vchiq_arm: clarify multiplication expressions
Date: Tue, 14 Sep 2021 18:35:32 -0300
Message-Id: <20210914213532.396654-4-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914213532.396654-1-gascoar@gmail.com>
References: <20210914213532.396654-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around '*' in multiplication expressions to enhance
readability.

Reported by checkpatch.pl
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index f8b3997125e4..bb4035f2de65 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -466,8 +466,8 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 
 	g_free_fragments = g_fragments_base;
 	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
-		*(char **)&g_fragments_base[i*g_fragments_size] =
-			&g_fragments_base[(i + 1)*g_fragments_size];
+		*(char **)&g_fragments_base[i * g_fragments_size] =
+			&g_fragments_base[(i + 1) * g_fragments_size];
 	}
 	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;
 	sema_init(&g_free_fragments_sema, MAX_FRAGMENTS);
-- 
2.33.0


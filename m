Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AE71
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:51:18 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id g4so10047480pjk.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ib+t9lVmRc47tm7LsElU1TV26Vqw/r1cOdCfq04ZSQE=;
        b=VEE7fjWiDkmeD1XofkTGTv9lFoFTZM+iHn5Kn4Xx6Xa4uUg4bU76o7Yr8jZPmE8ls7
         8/Y4uzvUSXiFJIWAQ3TsCwfOpDp+8G9YUzC5bXKzvt6KrX7TsYNxl5jvHMnJT/fPeDqa
         R6Dgw7rbVcalfIRhaO98vo/0ZeR8M3MKOPVR4Rt8DnmBQZgXrftqjElGiAqfYmoSmYYj
         LYtH9/3MG8WT0Wkixx6PAjvYikoPh3MlUVk2LhiMnLMoLhrLF60l4HYHdkLk077D8sGA
         reM8DPhCoH9yQUVtwAPPKsvN+kAj15yOz3AyqET0VlPozhF9xBqjqyESIvAiGw8gWQ69
         s/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ib+t9lVmRc47tm7LsElU1TV26Vqw/r1cOdCfq04ZSQE=;
        b=LgA7Ei9Iu2QdR8jzDWSWdHY1vFSdE7qDwlrugKMDwbMLBYri+GlHDgDUX7SdooJDIy
         2jrvmWRmatbwPXZsescf/fotKHi4uiSZDs4H0yKuPVCYTY8RIAN8nffO4tBb6al/iyUF
         TIdB062fyusxyOF8VsnAVHIuyTtiNnLDG6QC2cgMQlTURwdZttu5J1bXZfaUtOTKUDcW
         xNtbVdlg02A4RlqZwHjF/kX+7HRHLlSSAX4HGQQ0sQ2VjSBKoORl19dlKKKn8+d9yzbm
         MpqLExli9C/7FK6Hz68OzHYfCECkJzqdVClIYT/YG4lDbxIumcydG+E1iM4ZXrmXwX8m
         VCeg==
X-Gm-Message-State: AOAM530v1imcQlYVMJ2C3xAMLxDsc2IP8Bmn6qo8MaEPUCCDkXTnb3iH
	SePeOgYCg3fXhIwQiWYXyM+7xWuYLNOEmMHh
X-Google-Smtp-Source: ABdhPJyfyUFZ+vhs2TGIQqtoKDwOtSGbu0zMRWpP/QIjUMgrczLKyuRymwSAHSzj4qMzA746ctx9rg==
X-Received: by 2002:a17:90a:a108:: with SMTP id s8mr38186952pjp.85.1624283477944;
        Mon, 21 Jun 2021 06:51:17 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id j10sm15995814pjb.36.2021.06.21.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:51:17 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 13/19] staging: qlge: rewrite do while loop as for loop in qlge_sem_spinlock
Date: Mon, 21 Jun 2021 21:48:56 +0800
Message-Id: <20210621134902.83587-14-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since wait_count=30 > 0, the for loop is equivalent to do while
loop. This commit also replaces 100 with UDELAY_DELAY.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index c5e161595b1f..2d2405be38f5 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -140,12 +140,13 @@ static int qlge_sem_trylock(struct qlge_adapter *qdev, u32 sem_mask)
 int qlge_sem_spinlock(struct qlge_adapter *qdev, u32 sem_mask)
 {
 	unsigned int wait_count = 30;
+	int count;
 
-	do {
+	for (count = 0; count < wait_count; count++) {
 		if (!qlge_sem_trylock(qdev, sem_mask))
 			return 0;
-		udelay(100);
-	} while (--wait_count);
+		udelay(UDELAY_DELAY);
+	}
 	return -ETIMEDOUT;
 }
 
-- 
2.32.0


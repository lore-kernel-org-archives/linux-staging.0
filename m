Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51862AD2B
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 15:08:00 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b962c226ceso10104501fa.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Sep 2023 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693753678; x=1694358478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csKX5A9kXXALBeT5X7dLtErmAX0Hy/N1x58zC4BBgNs=;
        b=YEXr3c2L/ovHU72Il7iJRUIKaTpq1PNeTqMXUmjXwdqIG7HDsOhSDdvXb+oSJL3hw4
         lC7cA34c7uwzUGqU1W5q0Tjb0rlTL48agEm7RKDPL7L+ly9iCleiaXc4H3pH9PrKS7xA
         U8ImEDQ4fXI7qlQHFhogl96odQNynFgb4BC5e0ihSHzq7HhFiSzq8wVhF0Jo4+1zYSg0
         E58wS5DXEsH3TNEic1ytkEJubLq7eV5oehS5+PZgSxbyhq8+g3GJZCE5p+j8QeIhRSsw
         gp+9w/gYAvzvPR0X0nC+rHKC6e8Juy3z7diMkcOdexo08dXVeIf618a8Nc0qsZeu1Lia
         3kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693753678; x=1694358478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csKX5A9kXXALBeT5X7dLtErmAX0Hy/N1x58zC4BBgNs=;
        b=UzfU84pT135ANzwiu2UR2zcggD9Ivi5ZXwVayOJtHkWCrJ2LlWKZIl7GRwR21Sj9p/
         9z/OYoLk94Y1NvQRMCAToNITkUHikLKWiPdc0PbV+lh4DhhMGswqjXz4jsEOHNIQETxH
         4jqZWU6q5KEuOtWpFeiDLOQSqvyqTNo8s0LbYk5gkJ9CSxSA015nmJ8aHA6xDUjmGbQz
         DRl13220kTDDThHAqMY2cnG0Fdt3vGoP6fyIZw0sfdBCIAnvknx4oH8KDuGf4V7UQ5pt
         M8WN6GTaoHheF07zSQAs5ttz4zktCUpqYcm7UuDLv+wJTV0j1vZDqqNgltturwYHSv/2
         FhQg==
X-Gm-Message-State: AOJu0Yx66RTTEywzX0+kv4d0c9S6dYrwESkHUEVKWzVwY2klYhOa2HNn
	qPEqMv97WsYAmkECHW8p8m0=
X-Google-Smtp-Source: AGHT+IFQwplZBOYCSQvP1lfdW5q3h0qUHtTwnFzNEd19JikuePPyjZpP4PkPsrL7CBP6VpdwJcDAfw==
X-Received: by 2002:a2e:9d8d:0:b0:2bc:fd7b:8ded with SMTP id c13-20020a2e9d8d000000b002bcfd7b8dedmr5429229ljj.20.1693753677804;
        Sun, 03 Sep 2023 08:07:57 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id b23-20020a2e8497000000b002bcdeeecd11sm1547944ljh.66.2023.09.03.08.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 08:07:57 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH] staging: vme_user: Remove unused (commented) code causing unnecessary checkpatch warning
Date: Sun,  3 Sep 2023 17:06:23 +0200
Message-Id: <20230903150623.571984-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unused/commented code from vme_fake.c which was causing spurious
checkpatch warnings.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7c53a8a7b79b..9bcb89a84d53 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1009,9 +1009,6 @@ static void fake_free_consistent(struct device *parent, size_t size,
 		void *vaddr, dma_addr_t dma)
 {
 	kfree(vaddr);
-/*
-	dma_free_coherent(parent, size, vaddr, dma);
-*/
 }
 
 /*
-- 
2.34.1


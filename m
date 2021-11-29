Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D942CA0
	for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 22:50:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p27-20020a05600c1d9b00b0033bf8532855so13436047wms.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 14:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCItfQrF3pFthBv5apV+T7MQM52J5h814Lyaip/Txlk=;
        b=hb2EbMBHEZsyJScJ7KTa4Tj999QAkptzC6ntYgv37EDfJ7KQgy2uS9WgvTROZyUd69
         usKJCGM9MFQkg2rAwFGk2KdDyenWV2BUblGW/9ZLiKO/De+xMEgA4nz7k8arE/zcycMw
         bsGKT75KC1H2moROa2y8XBHaNPfJo3vd4hgD8VVEBKd8cTxytrhXmomGvM9BevuZ+mE6
         X4F13c5dxL906iVWzJW77DOqyRT9SVEziiBqsq81TNhXLSwC0ZyTdO+SRMDxVz/M1PX0
         nFjfI3I8mLe66aOVh+4je8GmxxWZ+LCizALv/1QFf0zCCQehbX4BurlpQYWVrnKd5S+H
         t58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oCItfQrF3pFthBv5apV+T7MQM52J5h814Lyaip/Txlk=;
        b=ntEhpXtEihqWlgT6WXr9kICLjE+x0KScVCEnhTbCdVHlkNypqqvm0MxtT7wk2QYX96
         Ldyh7HGQYDYGhpvwuPPUZwgbkbl3hCJcJ0Ly9ebUguzcgaXUr37qQ5zr+8iOvredT5Kq
         hSBT73rNaqkM/c9/KF2WRtIxU3+7Wgx4XvJpGA7RQGnKqXjLrQiev5EB0uPioo5Ri+9e
         BAdP9B+eiHU6jGQ+RCGrwB4yIhwLD0MyAptql7Di4qf23v1rfYBucdnIvXnTFL8Is+zC
         GNpG/+Uf1zNcGhA63iBkvKC/sI9z/QC0fTttnxgbJu6k/9OKdfl89YFwovHBqZ+IOcC9
         vVcw==
X-Gm-Message-State: AOAM530TOFudWgytSKeBOGuBsY+Z3XBAHU0t3wNji84YuUDnYXiptsd6
	4hYK7PyqLlrxxw==
X-Google-Smtp-Source: ABdhPJzUkGXOlfuxxwXQTJGUTJKT9MY35cx6i+h46PBKMoFb7jkD0GqQg0n8taYJj5JHk1LkSn6jgQ==
X-Received: by 2002:a7b:c8c2:: with SMTP id f2mr881848wml.63.1638226214843;
        Mon, 29 Nov 2021 14:50:14 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g13sm562731wmk.37.2021.11.29.14.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 14:50:14 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: make array queuetopipe static const
Date: Mon, 29 Nov 2021 22:50:13 +0000
Message-Id: <20211129225013.524016-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

 Don't populate the array queuetopipe on the stack but instead make it
static const. Also makes the object code smaller by ~50 bytes.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index f5d9e81f4ac7..364e1ca94f70 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2531,13 +2531,13 @@ static short rtl8192_init(struct net_device *dev)
 #ifdef PIPE12
 	{
 		int i = 0;
-		u8 queuetopipe[] = {3, 2, 1, 0, 4, 8, 7, 6, 5};
+		static const u8 queuetopipe[] = {3, 2, 1, 0, 4, 8, 7, 6, 5};
 
 		memcpy(priv->txqueue_to_outpipemap, queuetopipe, 9);
 	}
 #else
 	{
-		u8 queuetopipe[] = {3, 2, 1, 0, 4, 4, 0, 4, 4};
+		const u8 queuetopipe[] = {3, 2, 1, 0, 4, 4, 0, 4, 4};
 
 		memcpy(priv->txqueue_to_outpipemap, queuetopipe, 9);
 	}
-- 
2.33.1


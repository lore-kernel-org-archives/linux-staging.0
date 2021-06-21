Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E871
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:51:28 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id o21so8586866pll.6
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4wtQAn6LzmVlaCqMqizM6ab4EoyWHwZrrQCDQEZJCVE=;
        b=KsYZRBVCVKS8ZtQhhdKkCHzLAngteaWyzxZ2c3GBjC/s1xJ4Rp7Gh0K1U2kEkJ8Z9Y
         EMRilykmwbrm+E2O8hxt9xCNxuB1BC9beU9B5e56l8SXn6Od8MQYN6hQDd4QseWRI0EK
         kBpHrttwMcWFmJqlCTYFpq9rd0BXet3ySC3EpdoVxtees7G4jJy9ccgVhlaVUf3BFZvT
         kn4qdZlgQtH6rFDQwcDKoq44if7vDYEoEd5nAEGBmVZxBQ06U9sjz6bQKSxBDoql/KAg
         vor69bpxhCLEO/DvQ5EUq40ME/SYRRK+QIiXIsdeKrIztoA88lClj0C3HVwIySYhPbac
         Hssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4wtQAn6LzmVlaCqMqizM6ab4EoyWHwZrrQCDQEZJCVE=;
        b=X80T/BAdyKmUz2leT39mNyh+Rw8OmjLHpA/iwquzmvbCE62/B+E8DWIwWKkuFvtwEZ
         N+7t4Q6Ivsgg7nhec81IXkX7LuuEWhuKaY6f//QHVLxhv4c7RqOB9ea4snepyVefGML7
         iBgag6FMSVe2Of6rha+yO9ktwOPck7NU4SEEUv2Vy8ArHoUDcMbEE6uzGVdQUwQAwGmF
         gOchykZziqx8I486FsgxesH2AdAlRof/+jrcPTgL7TAzKBys2zf2n7W9A0e1Y/zf0rse
         g4IjziBVBRDH3gomDggxmLD28REBx8trC8KsF2Y8LgURIYky7gvOZ3EVeRQ9qZIin3cs
         AVRg==
X-Gm-Message-State: AOAM5335VF/JmEeop8t4oFzwiGvhVNnHrjqEbTTWdm0lRvApy7iswS0T
	w3KvH0eXjz32gJ6zva0qshRnW5xxHo/OhYIi
X-Google-Smtp-Source: ABdhPJwFUktdrr4PhLpWpymkUiqvYP8hU7ocofZpZwVOz02ZFqqxCuUbnQ0Z6AgvXGLhDIPvf4ZH+Q==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr38259386pjd.232.1624283487677;
        Mon, 21 Jun 2021 06:51:27 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id b6sm16726628pgw.67.2021.06.21.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:51:27 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 14/19] staging: qlge: rewrite do while loop as for loop in qlge_refill_bq
Date: Mon, 21 Jun 2021 21:48:57 +0800
Message-Id: <20210621134902.83587-15-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since refill_count > 0, the for loop is equivalent to do while
loop.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 2d2405be38f5..904dba7aaee5 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -1092,6 +1092,7 @@ static int qlge_refill_bq(struct qlge_bq *bq, gfp_t gfp)
 	struct qlge_bq_desc *bq_desc;
 	int refill_count;
 	int retval;
+	int count;
 	int i;
 
 	refill_count = QLGE_BQ_WRAP(QLGE_BQ_ALIGN(bq->next_to_clean - 1) -
@@ -1102,7 +1103,7 @@ static int qlge_refill_bq(struct qlge_bq *bq, gfp_t gfp)
 	i = bq->next_to_use;
 	bq_desc = &bq->queue[i];
 	i -= QLGE_BQ_LEN;
-	do {
+	for (count = 0; count < refill_count; count++) {
 		netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
 			     "ring %u %s: try cleaning idx %d\n",
 			     rx_ring->cq_id, bq_type_name[bq->type], i);
@@ -1124,8 +1125,7 @@ static int qlge_refill_bq(struct qlge_bq *bq, gfp_t gfp)
 			bq_desc = &bq->queue[0];
 			i -= QLGE_BQ_LEN;
 		}
-		refill_count--;
-	} while (refill_count);
+	}
 	i += QLGE_BQ_LEN;
 
 	if (bq->next_to_use != i) {
-- 
2.32.0


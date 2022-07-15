Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF317F3
	for <linux-staging@lists.linux.dev>; Fri, 15 Jul 2022 06:17:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id e16so3827696pfm.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Jul 2022 23:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5MLxTGie+B4QdlEZJxtbc8CtA2pcH2E4OqHrrJEXotI=;
        b=E9f19W6WnC5o6tUo39/A3LDf0ge61zcqFRst/ixdwUQESK0Kf/5v7f1M0aK6twNDF7
         HfMWGqil3gsBqmL/cYph1jmoznV1o+eZ+Ypb0oOS+fvhn44oAxJxuW0RgMxb+prc3PjX
         KcVSrk4QypCpuWy8b1O2Z2N2fCPOXnsYjCSD2K6oZwRSaSLSpP1OrtG5Ik4hkldyTdTn
         aeDwolSqATu5jzFUNeFQ9anNJa81F4iSxYoOLFP1kWBuyIwUoUmVOaaxyKyXv8+eaKXl
         57lHL/zPjxLTVDARmFpaShxytqRztVZ9rC/p1HBR8tbtZzMkK2JVYZXK+ld9b+6+ARKo
         QrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5MLxTGie+B4QdlEZJxtbc8CtA2pcH2E4OqHrrJEXotI=;
        b=Fjzf9fhLwoS6rKuJ6GPbWHpTSg4J+tTN+Pxq1IjUQoziVyYyov7fzdSTgK9r6XZ2G5
         QQivZJrlCj8KiGtyl5G5PXPE9KkkZN53HiH7gp0FUS3vWzvuQm5GYMYt3rAN35fk43Gv
         gJqyU49axDIgTab3mCfDdH8Ss01uXn0b86oxrNl0OPlKb2T3V1v6wY9iI6vAQ7SrazqP
         62D7L6zrFI76UfuQQxgWExPjixm7XwwXAJjh9vCDT2m5LtUnqIfVZaBPNnkOk5EVaZPA
         0U/hHKc4ALsJLZi9uWmpkWOM09y8ykXSZ5WEy7eHLR76GHgX8fCRwueaVc9KiNe1ujfJ
         ewdQ==
X-Gm-Message-State: AJIora9Lt6Us+s0wNpBNEfWQOuc9vkdQmfxiLRW0O0ezso1udwHrYJq/
	eR74n9zBcE9DgzTMI3YjXy4=
X-Google-Smtp-Source: AGRyM1vbxon5umiGZ4oZkOf87BbF91J8zDMFcxF6hZr5E5G93STJ3G4ZdDmaxvWUtSOobzYBNx5BAQ==
X-Received: by 2002:a63:1a18:0:b0:419:aa0d:4f9c with SMTP id a24-20020a631a18000000b00419aa0d4f9cmr7545826pga.389.1657865874986;
        Thu, 14 Jul 2022 23:17:54 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:310b:ff49:22f8:d171])
        by smtp.gmail.com with ESMTPSA id 77-20020a621950000000b005289627ae6asm2797161pfz.187.2022.07.14.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 23:17:54 -0700 (PDT)
Date: Thu, 14 Jul 2022 23:17:54 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: refine variable name
Message-ID: <20220715061754.GA6657@cloud-MacBookPro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tmp as a variable name don't have much information, change tmp to dma.

Signed-off-by: Binyi Han <dantengknight@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 4b166c66cfc5..58d1920c4347 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -2955,7 +2955,7 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 	void __iomem *doorbell_area =
 		qdev->doorbell_area + (DB_PAGE_SIZE * (128 + rx_ring->cq_id));
 	int err = 0;
-	u64 tmp;
+	u64 dma;
 	__le64 *base_indirect_ptr;
 	int page_entries;
 
@@ -3004,14 +3004,14 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		FLAGS_LI;		/* Load irq delay values */
 	if (rx_ring->cq_id < qdev->rss_ring_count) {
 		cqicb->flags |= FLAGS_LL;	/* Load lbq values */
-		tmp = (u64)rx_ring->lbq.base_dma;
+		dma = (u64)rx_ring->lbq.base_dma;
 		base_indirect_ptr = rx_ring->lbq.base_indirect;
 
 		for (page_entries = 0;
 		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
 		     page_entries++) {
-			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
-			tmp += DB_PAGE_SIZE;
+			base_indirect_ptr[page_entries] = cpu_to_le64(dma);
+			dma += DB_PAGE_SIZE;
 		}
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
@@ -3021,14 +3021,14 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		rx_ring->lbq.next_to_clean = 0;
 
 		cqicb->flags |= FLAGS_LS;	/* Load sbq values */
-		tmp = (u64)rx_ring->sbq.base_dma;
+		dma = (u64)rx_ring->sbq.base_dma;
 		base_indirect_ptr = rx_ring->sbq.base_indirect;
 
 		for (page_entries = 0;
 		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
 		     page_entries++) {
-			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
-			tmp += DB_PAGE_SIZE;
+			base_indirect_ptr[page_entries] = cpu_to_le64(dma);
+			dma += DB_PAGE_SIZE;
 		}
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
-- 
2.25.1


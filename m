Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE06971
	for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 13:51:07 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id s17-20020a17090a8811b029016e89654f93so12672158pjn.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Jun 2021 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TREWgCZWamyM+cAvFe+be+iyBQ2mM4FCIj8jAxnCWs0=;
        b=fEpcFCM2VjpxKDX6qBcqcW976jrBvNzdDnqeE7kkmCA54xvYA4tjne6uHuRPjecEbr
         JB9MtUDnrHIPae2hAflr8rrpbzIZwu5s8pvuWPRaVeAHzJDk1LtGQsAg6m0Uvv6waFVi
         IYqPOVWlKZlVSDTIDk0gj8bSXfzdIYB/avCm8m4wpaEn2vD/q9t+UWhFeXfrZF/ggsl8
         nDAMEXJNPyGYM0f7+U32sdGdLo69dfwECtTNfintPs6QIW1gs3v48Po+50q7BbBtz8u9
         5OrzIka2R+hFKvGmDHqgS+eKEfvhaXhb68CxDcOOK8JMq0xrwtATR5CHGmp6K1NMTDvq
         SKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TREWgCZWamyM+cAvFe+be+iyBQ2mM4FCIj8jAxnCWs0=;
        b=JrhOk+FaCRUHu1v3KFBM2Ep4QdUSDdlZA3yzkKraOeVyZutQhhdW2n7nXQQDFh+t3q
         bZRetGUoH+uC5RvzOyLIs3dqVFse3zNH6lnLH3qSrgJvcDr9ccK7H7qVyUVym0RGd7CT
         TkWVElszUB/oeVn9zPqFTuL65kXWEuwa/yUnahCRXYfMeFUDHiMlaxs/SxKlPIHwYmpP
         TgAZroc9Cc2PVCSM/1EW8Xu6Aze9K3DCTBNgdJ+e/7FwaZdZDWjp3qYbYqt7+SZqXxN1
         fuWTLaKH6IWu0SRmaYpSzt85Wx5XtmthH0SZGUnJiCD2sjvl8b5wTfV2Vaiw7HGAcdXh
         853A==
X-Gm-Message-State: AOAM531x+0ogt57ux7RdK9d5Gs4TGui3p/67NvtQ9MqePORkloMBHlbc
	BQDkLVe/HWAffATLclcH8nlg6k9TxJ1Hb+FX
X-Google-Smtp-Source: ABdhPJzZjS77z8PraDiF4aOCsoGOuHLIIF3lM0XWqXPAxHUs+FwCRZ91wEzksH0o6KrPa+OMPFwJQw==
X-Received: by 2002:a17:902:d4cb:b029:124:3333:9ded with SMTP id o11-20020a170902d4cbb029012433339dedmr6883227plg.22.1624283467638;
        Mon, 21 Jun 2021 06:51:07 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id k25sm15256121pfa.213.2021.06.21.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 06:51:07 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-staging@lists.linux.dev
Cc: netdev@vger.kernel.org,
	Benjamin Poirier <benjamin.poirier@gmail.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 12/19] staging: qlge: rewrite do while loops as for loops in qlge_start_rx_ring
Date: Mon, 21 Jun 2021 21:48:55 +0800
Message-Id: <20210621134902.83587-13-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210621134902.83587-1-coiby.xu@gmail.com>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since MAX_DB_PAGES_PER_BQ > 0, the for loop is equivalent to do while
loop.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 7aee9e904097..c5e161595b1f 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3029,12 +3029,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
 		tmp = (u64)rx_ring->lbq.base_dma;
 		base_indirect_ptr = rx_ring->lbq.base_indirect;
 		page_entries = 0;
-		do {
+		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
 			*base_indirect_ptr = cpu_to_le64(tmp);
 			tmp += DB_PAGE_SIZE;
 			base_indirect_ptr++;
-			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ);
+		}
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3046,12 +3045,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
 		tmp = (u64)rx_ring->sbq.base_dma;
 		base_indirect_ptr = rx_ring->sbq.base_indirect;
 		page_entries = 0;
-		do {
+		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
 			*base_indirect_ptr = cpu_to_le64(tmp);
 			tmp += DB_PAGE_SIZE;
 			base_indirect_ptr++;
-			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ);
+		}
 		cqicb->sbq_addr = cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(QLGE_SMALL_BUFFER_SIZE);
 		cqicb->sbq_len = cpu_to_le16(QLGE_FIT16(QLGE_BQ_LEN));
-- 
2.32.0


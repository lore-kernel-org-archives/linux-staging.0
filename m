Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E9E7C
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 20:46:41 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 15so13402277qki.6
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 13:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tE3FN1D8dyvNHStQKSchutVQqs+h1CQjl2plmGuD71I=;
        b=RxqHyq0JqjcYr4FuRUzHJCOM2ScB9CwEwr0cSOwlry6JfVchPSuPTRVjWc5wdvMapw
         6E5S/4UtEvmdySavjEV73tZwUgG8fOngF883Is12oMIok2W+qPQOjC7dlZWx+Dx3nimy
         3qTyA1eiKSuoBuZ/yvhUrbthQxMyeYdoqpzUIqUV3jYj+Ecz+ErZtPB3scdUrHZznlEi
         D0EUEBAcM26c+jDGra1+QzmH1roP8ebKb+VFwAB8EIAi2hs9tQv0tWHdQ/2TknunyD/X
         WK4+8fryMnr4eNeK4xf7ml65wD2c6vGNhvd2Il7/GI9kl4LPMTOQsdlTeAH1YOmdPh5n
         n3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tE3FN1D8dyvNHStQKSchutVQqs+h1CQjl2plmGuD71I=;
        b=nz9Tj7gd0qyVm8jmhjZKCE51fNtizVZyb+ryZDMSk+jChu2NSPZw4lH7+JWqECq9Vy
         zptuFHt6AFWWqm9gYWDfPJclg4iAMONouDZbw0EOIolu26ous2DXIH2FXeKcnrnAsQTu
         tg3aX7LLEINV/PpOdPTBei3zzmaz6puGvSOdXY74UlxQinLSE0Bz+1asLKJbRpxBfUa7
         uY/cYjvyq1K7y1Atmi03bU1n0Vj2UMKkU2gAjDEOGzUTGRBcGtmQZpoCV1P5LIdUGOXU
         vNFhkGD0hcJQLzsXI3iA2KgCP4/Jn5Vl2MJ5WBDgydAcLy/elFIbMU909el60Jlct4Wb
         myYw==
X-Gm-Message-State: AOAM531tfoGaTflAnFd6GEOAwurfNufYPPVfTBIW9/f5ossfN/7AEVqZ
	cnQwIe6GZM9z16z7fks3jbU=
X-Google-Smtp-Source: ABdhPJzgKcL7IHdRRhICBBwShEX+JSw4kT2bjFOL9LCQh2jqtDmZrB+T2ncO/USgZzXbpXh5267mVA==
X-Received: by 2002:a05:620a:4404:b0:6a0:51e5:ee72 with SMTP id v4-20020a05620a440400b006a051e5ee72mr28843314qkp.121.1654807600108;
        Thu, 09 Jun 2022 13:46:40 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9577w-grc-06-184-148-179-98.dsl.bell.ca. [184.148.179.98])
        by smtp.gmail.com with ESMTPSA id bn10-20020a05622a1dca00b0030501abadabsm4051488qtb.19.2022.06.09.13.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 13:46:39 -0700 (PDT)
Date: Thu, 9 Jun 2022 16:46:39 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: qlge: qlge_main.c: rewrite do-while loops into
 more compact for loops
Message-ID: <YqJcLwUQorZQOrkd@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

simplify do-while loops into for loops

Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
---
Changes in v2:
 - Rewrite for loops more compactly

 drivers/staging/qlge/qlge_main.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 8c35d4c4b851..689a87d58f27 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3006,13 +3006,11 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		cqicb->flags |= FLAGS_LL;	/* Load lbq values */
 		tmp = (u64)rx_ring->lbq.base_dma;
 		base_indirect_ptr = rx_ring->lbq.base_indirect;
-		page_entries = 0;
-		do {
-			*base_indirect_ptr = cpu_to_le64(tmp);
-			tmp += DB_PAGE_SIZE;
-			base_indirect_ptr++;
-			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
+
+		for (page_entries = 0; page_entries <
+			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
+				base_indirect_ptr[page_entries] =
+					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3023,13 +3021,11 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		cqicb->flags |= FLAGS_LS;	/* Load sbq values */
 		tmp = (u64)rx_ring->sbq.base_dma;
 		base_indirect_ptr = rx_ring->sbq.base_indirect;
-		page_entries = 0;
-		do {
-			*base_indirect_ptr = cpu_to_le64(tmp);
-			tmp += DB_PAGE_SIZE;
-			base_indirect_ptr++;
-			page_entries++;
-		} while (page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN));
+
+		for (page_entries = 0; page_entries <
+			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
+				base_indirect_ptr[page_entries] =
+					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.34.1


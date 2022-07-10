Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161B11104
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 08:36:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id y9so2455584pff.12
        for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 01:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xgfLGyj+MHqel88Qroj0JT4kGTyFosjPxfxGSvsimrM=;
        b=fe1Y8UcF38yp8nkqFC42yUpEITrSdSwZC+mso+eprWYcqw3uXsiO2Xwbvu1kvxCXSw
         eRCcYPGiodo276ozuxx3kCxX3fLTSbRTjhZxFTMhfURGfe6f/Dq+ab5Dqptb81UeysY0
         tInyEEL3FtJOw/Bm9I8m1ya84f1MMJfb5M0JS9c83irrLwUQ7iLXCzED/3BmuX5Vj7FL
         VHFk2YkRsZ19ocHaiiqGBOm0HmAo9a6nM2I30xSHdjWNYrnMPpe+Q/vp2QenX8xKq6O/
         X0xTVqJ2LHW/hKM86/GV8KffFJFp8w7AtspCic393pj/U9lV90gF5YUl+OIk2lOmU8Ui
         rMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xgfLGyj+MHqel88Qroj0JT4kGTyFosjPxfxGSvsimrM=;
        b=m/zYDo57XPmT0Yxpm8JIDS7Iq/CX3oEohVth9AXLpOpkzExBt4WoNqZ8I9jkNvuvAj
         f6Dser5WN/cxWTJPadyG9JT1kJKNvtwyelUvQJSj+ZQUPsusAuK6ZqM+5LgCFU2+/jXv
         a706jfRSxq73IaZZDqStd8+GRVqmA+NBIIJRg/e/8iwl3jwQcjv8gwdS80IkoQpnX+19
         gSHr6cEwTGK5cuA+zgy35gwFEFugcEENaYlFn0P0Kaimhmim5UX0KPw3GPQM/Grkm1ul
         adcmC4qG0+CuI8N9GB25DOAveWH+RFyApqXQzjNNy+mSSSyiBCpJZMqx0pxmwJbceHdg
         vXiQ==
X-Gm-Message-State: AJIora/58cP9bsYIu0EAXJANZ2j5mnGX7X/GdhbViwi6sEeDrJa3ACVU
	mf8zk51LLNNduYeyCzgUbPc=
X-Google-Smtp-Source: AGRyM1vBZKUETO0vlrimK2WidWHyQw040TOD6YTdp3eOJGXVSJsvNfPQ5WpBLr8P+gyq9Gfn4iz7rQ==
X-Received: by 2002:a63:480b:0:b0:40d:d4d1:7daf with SMTP id v11-20020a63480b000000b0040dd4d17dafmr10933718pga.512.1657442218427;
        Sun, 10 Jul 2022 01:36:58 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:b884:a80c:dca9:4492])
        by smtp.gmail.com with ESMTPSA id u5-20020a63d345000000b0041245ccb6b1sm2128311pgi.62.2022.07.10.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:36:57 -0700 (PDT)
Date: Sun, 10 Jul 2022 01:36:57 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: qlge: Fix indentation issue under long for loop
Message-ID: <20220710083657.GA3311@cloud-MacBookPro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix indentation issue to adhere to Linux kernel coding style,
Issue found by checkpatch. And change the long for loop into 3 lines.

Signed-off-by: Binyi Han <dantengknight@gmail.com>
---
v2:
	- Change the long for loop into 3 lines.

 drivers/staging/qlge/qlge_main.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1a378330d775..6e771d0e412b 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3007,10 +3007,11 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		tmp = (u64)rx_ring->lbq.base_dma;
 		base_indirect_ptr = rx_ring->lbq.base_indirect;
 
-		for (page_entries = 0; page_entries <
-			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		for (page_entries = 0;
+			page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
+			page_entries++)
+			base_indirect_ptr[page_entries] =
+				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3022,10 +3023,11 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		tmp = (u64)rx_ring->sbq.base_dma;
 		base_indirect_ptr = rx_ring->sbq.base_indirect;
 
-		for (page_entries = 0; page_entries <
-			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		for (page_entries = 0;
+			page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
+			page_entries++)
+			base_indirect_ptr[page_entries] =
+				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.25.1


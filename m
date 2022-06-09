Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06DA2F23
	for <linux-staging@lists.linux.dev>; Thu,  9 Jun 2022 15:15:53 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id s23so22424575iog.13
        for <linux-staging@lists.linux.dev>; Thu, 09 Jun 2022 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=XjDcxc7sQfpXSZ1klfFIU0xeG3PIJolrhiT/911tClE=;
        b=fppqyvuMKJGHBPZhOK9EHVChnvSGKHOdURrkPjnlsrlvdZKmkYaOIaxbtFXgTCyHqJ
         s4nXebMun2v4vxvvUiYsTwNPFRrv/FceI9cL+qXIFGy9o2eK6PSIClX1cIP38yUCUQuM
         gE8/+tDPpMivdu8kZIgr4kpEu1ISRqDBT7MP6aEG0nKEvT6mYqRgKIn8nAbGv2zFszzy
         WPZ9u+0lR6Pl1uSMkZURCgEQ39zUJ5tsZ3nJaiwinfN4Rr6hKZ1Jo9CvyS6Rne3Zf4zW
         WRH+oqkVprKah3fNVLiDbGMMUFagBUWSmYdVcDqp0O3M8yaoYJ1Nr/xnHkxpwGPhTClg
         Dpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=XjDcxc7sQfpXSZ1klfFIU0xeG3PIJolrhiT/911tClE=;
        b=hSPO0qRWmHloKyYX+N3oOyJmY2sjATo4E8fOmIs7QlMvE2fnHw01JXN8ASqKnVTl4g
         7qVgh0ziqNWsnQQWrFgcGjlOlwMAxvPGwbemB94SuTdbqU2v9M/hyZbYmNzoj4YX7r4y
         R02+1dUMSzI8foj3Wq1xn+Ez5wgp1ZB9tX0FCh3H+YqF/oyv+D7Hp88t0hXnOEE/oqbN
         LywQIgPFYPGhtvqzTSQ0dAymDTU/PRF4rf98erHfsbvx+b205/rQjjPdxsGhJXupCRyS
         bnqM3KHKzl+O8OuKRiwn+w5+PRFx1OnuQ6VfPYQ3M25ynhlJ+TeWTirLvZOoHhzAAtOl
         EiaQ==
X-Gm-Message-State: AOAM5309YvP3L8+4qdfTJjIZeIlHYDpexC9xMDZmyNN+ptvm2cOXQ548
	jyB+ps5aozj0bLyvZssdedk=
X-Google-Smtp-Source: ABdhPJxb727WnXl7RLk2R1XnZfkIyBiIPHdm6AHrJyUkzWugSsolcX3iq7utyu5mjGz2i5myr/aG6g==
X-Received: by 2002:a02:a313:0:b0:331:7bfc:9830 with SMTP id q19-20020a02a313000000b003317bfc9830mr17152543jai.2.1654787752977;
        Thu, 09 Jun 2022 08:15:52 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9562w-grc-61-184-146-75-18.dsl.bell.ca. [184.146.75.18])
        by smtp.gmail.com with ESMTPSA id i131-20020a6bb889000000b00669ae49f762sm1008064iof.19.2022.06.09.08.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:15:52 -0700 (PDT)
Date: Thu, 9 Jun 2022 11:15:51 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: qlge_main.c: convert do-while loops to for
 loops
Message-ID: <YqIOp+cPXNxLAnui@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

simplify do-while loops to for loops

Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 8c35d4c4b851..308e8b621185 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3006,13 +3006,13 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
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
+			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++) {
+				*base_indirect_ptr = cpu_to_le64(tmp);
+				tmp += DB_PAGE_SIZE;
+				base_indirect_ptr++;
+		}
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3023,13 +3023,13 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
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
+			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++) {
+				*base_indirect_ptr = cpu_to_le64(tmp);
+				tmp += DB_PAGE_SIZE;
+				base_indirect_ptr++;
+		}
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.34.1


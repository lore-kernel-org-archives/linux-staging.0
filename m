Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048A7A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 08:00:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id a15so10962880pjs.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 01:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UoKkbTCGppE1RjnxJhiFSTs25wxtlVXgMJ54CPVb2mk=;
        b=C//LZB2o5gZfRHuzi3bO0tBHyBOV56+mmRQD83HreBx7UgZ6b+k9lJpEFTKvL48jfZ
         PZ8AGMsGxDIcB9uB1JpbgcvvbXWS43SkHxcnjzRx6WnrfLiDcXwfxsDaI1I0/yQF5/Ic
         7i/5v5OeaHzG4pmSiOzilSEPMXv3wxJWikuZWtwWpeKbJ9swAGxczj+HZNkcOAmbHE+/
         PKdvUQCHHHE5C+VszPrXYYqXQ4mqSCuwNkNHwbZVd5e4rqYr3bnSgPpWthOx458ygKfZ
         BQNWvcJUNp0+VMaqd8pmcWribUA8A3OuXaCOt4AWlijsUdXMjn6vOw+iXjmaHKnt8xTh
         6XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UoKkbTCGppE1RjnxJhiFSTs25wxtlVXgMJ54CPVb2mk=;
        b=trtP1kHY92Wjx3fCkalYgIUKfIoMjL3CfCwztpf5d4Aa0wEudAIYw+qOUfdISKdb2G
         nBm096pND8zzRCCnPuZ7kLjrJTS4nUofLbK8G1dV775eakapnKTYU+Xuury9OX/36aIy
         tpUdgLK8+U4PG3qWYBbgC/dhtBXjc+qpTp4QEr+ptLGhtGuSZ6cciiCnz4kJRMNxTlrQ
         qXlEPBK6QlKy6bITawAJPNYRO1UHeYZHcwzluhXphyb6mzWer93cJ0c+WvIBc3AMka6u
         llQPSGalq+5jUltjODPJnUaxUhz5qMBoMHOdoJCFygJTsr4Z/WmExuX4txqWFTtE/AvE
         m8Lw==
X-Gm-Message-State: AJIora9gYLDe+yKqCW5mJJbv2VsvUfSo/WJJGXuB0jCOnnU4nj14qFkY
	0pDhFHvmK9BY0gMiEXWwgls=
X-Google-Smtp-Source: AGRyM1vVTSqvvqV5eXj6we2txPZJMsjJKBNk7FSArmTJ7QPZDu8ST+LhD4F1yFmWUObwyhLSmkFHSg==
X-Received: by 2002:a17:90b:4f82:b0:1f0:95d:c029 with SMTP id qe2-20020a17090b4f8200b001f0095dc029mr2547730pjb.66.1657699223980;
        Wed, 13 Jul 2022 01:00:23 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:5ee1:7060:fe1d:88a2])
        by smtp.gmail.com with ESMTPSA id z27-20020aa79f9b000000b0052089e1b88esm8187747pfr.192.2022.07.13.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 01:00:23 -0700 (PDT)
Date: Wed, 13 Jul 2022 01:00:23 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] staging: qlge: Avoid multiplication while keep the
 same logic
Message-ID: <31fe21bf4a9e8f13cf27bd50073e9d5d197654ea.1657697683.git.dantengknight@gmail.com>
References: <cover.1657697683.git.dantengknight@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657697683.git.dantengknight@gmail.com>

Avoid the more expensive multiplication while keep the same logic.

Signed-off-by: Binyi Han <dantengknight@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 5209456edc39..4b166c66cfc5 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3009,9 +3009,10 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 
 		for (page_entries = 0;
 		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
-		     page_entries++)
-			base_indirect_ptr[page_entries] =
-				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		     page_entries++) {
+			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
+			tmp += DB_PAGE_SIZE;
+		}
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3025,9 +3026,10 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 
 		for (page_entries = 0;
 		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
-		     page_entries++)
-			base_indirect_ptr[page_entries] =
-				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		     page_entries++) {
+			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
+			tmp += DB_PAGE_SIZE;
+		}
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.25.1


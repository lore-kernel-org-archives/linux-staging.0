Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F177A
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 02:16:31 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id v7so74819pfb.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 19:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=IBkh7IsZmbFYLN06pIohD0sqXoNpFUpMtpF2eiWgC/c=;
        b=hJEfCZHCjmcvTVedYigK9MS4ZN5U7binqtqQQsqe6KRATruu9vEegw6jZ45Y78iGTM
         jzesCTpvkLZmURTrU5zaSrhUEHyaYtJsYgmDLUJ0cwT+r+yucYw9S1piZKW2L+JHnL7z
         uWI/ZA9n0/z3c2v+VdVTSMbKnwYEE0M6h8J/if/6h7TCTv1DSb+/sAW9lVDof4zKUC97
         jeMQ+T8ieG2c6/+652EthjFfw6NYb92AGJiomMOAV6eM5ZV2SjlIXW+WlurRXY8En7Nn
         fMKVyL1RJxkFYj9MgkQ4Oq6lYQgVr7reF+P5415rASo5Yo2GUbCU4h9wTFZnasmTo6tX
         7tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=IBkh7IsZmbFYLN06pIohD0sqXoNpFUpMtpF2eiWgC/c=;
        b=Zlf5qC1mbvTQvvvigTiMFo66FPhjQcZmolf5Zp/Tl+HwxT9IdsgsdWfeP4BvwO720y
         kXT8DXIGwejTVL/vNE2yBq9WB232g2e7EBX/Slb69Nqskr2K90wqtyuYmHL6Yyy1DHb9
         cqrJ4L4OgK7Dv4/bT/nXVdGy8w7GSIh1/6wACS0Gvw/nkd0axDGQJNtWvPti8anHlhQD
         sGizHdzyrfmWZ58Odkt9h6gYXhAOfZjwmw9jAH8EnufVsq38RvKqFJ0/qO+s3hUGvJug
         v1QEKLDlpUfu35ZcybluWoAK/mG23c5Vz6QQ/Lkhr0EmVsghPasrCgjvVKAZU30fdNxB
         Ryjw==
X-Gm-Message-State: AJIora8CjFKXtgu1nBkT90rWhbmkUTSbeaxmUMOYtB2WLiUwwfznnwy0
	eAoCG6ByN+z+m5pAPPLbEeE=
X-Google-Smtp-Source: AGRyM1t2Q/yjn10IfRmCt7ORJW55dNab68K9IiJI7QQKCrINWnSYQB5w79KBS22ZEIimzf0wCXUXcQ==
X-Received: by 2002:a05:6a00:188e:b0:52a:b545:559f with SMTP id x14-20020a056a00188e00b0052ab545559fmr8921660pfh.18.1657419391137;
        Sat, 09 Jul 2022 19:16:31 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:4775:5e6e:8613:5b36])
        by smtp.gmail.com with ESMTPSA id iw5-20020a170903044500b0016bd72887fcsm1946645plb.59.2022.07.09.19.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 19:16:30 -0700 (PDT)
Date: Sat, 9 Jul 2022 19:16:29 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: Fix indentation issue under long for loop
Message-ID: <20220710021629.GA11852@cloud-MacBookPro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix indentation issue to adhere to Linux kernel coding style.
Issue found by checkpatch.

Signed-off-by: Binyi Han <dantengknight@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1a378330d775..60c796a64135 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3009,8 +3009,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 
 		for (page_entries = 0; page_entries <
 			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+			base_indirect_ptr[page_entries] =
+				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3024,8 +3024,8 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 
 		for (page_entries = 0; page_entries <
 			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+			base_indirect_ptr[page_entries] =
+				cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.25.1


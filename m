Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507A47353
	for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOAJGhyM"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-583552eafd3so246102eaf.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Oct 2023 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697658426; x=1698263226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLYRVhjiiCAR5NlBeW4PZhPgUBi+QF64GvuGWJOkciM=;
        b=kOAJGhyMMT0fpiDbFgjagThzyIQMNd0Yt7wrNgNLXGjw2xJsn7zO79aTKFdt60X5gi
         e/33t7EALSKFk/+xC0L2gZxYgQKhOE+jagj4xLIf2ESmBLZgxbSpAbb9qY3E7MVdD9CU
         pXx7w5jOPrpqbQKS3hGdyh5ulKXp1kRZB69/JR50Z4R29u38WxO8PrquKoZ6ikebLtwG
         oG/v2SSuN/QGifhNXlM1UPCDzPxyjJVhvS9rZB2Oa0J7GfPtLF+nbR84rJ9B7Rq4vb31
         2x8O+8LogyipFkn5IgFTK8gM+rZYlmbatSRUSWNbvMXUVFTT6QicH78kZdlQMoI8dE3n
         P8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697658426; x=1698263226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLYRVhjiiCAR5NlBeW4PZhPgUBi+QF64GvuGWJOkciM=;
        b=trlZaJUJu4FKOwZW3nf5JG6nKFKzkVP3VFdKa8IrsrcQU+9yEf2lY3LCJhLUkcr7ag
         DcS6Bixq3BgCWWCjRDgXdUK2Xxtv5NII5SZkYdIabfjJcupZHrtoKtmG3tzpZWjSGcMu
         aDodP8p+vnPKH+MSueVDX8DTIkDdzq+JHCan8HFzW2h4+Dy5/uYlO0HGBW0jmB6aOuQy
         cdzgEYEPxUGBo8FavycsmbJX0MAwmwREGu/BRUp8fBOq8wXIXXdaUfMm4zaoMNfoESWM
         5k1aNcF5zjIIg73/GywJrInDoNuXNA8vXxQwpVwBiVjO3cuScZg/yl6pmqp1tJO2IO5R
         sM5Q==
X-Gm-Message-State: AOJu0Yzuhvnq75kuigNO/BXU9aRDBnoedFY0wpVs26JWfnIHsPAlY7N0
	vSX8tv9nl79MBb1qqUzk2Gw=
X-Google-Smtp-Source: AGHT+IFq8SAUCcmVlpQGElv+BMyPHFtyxBHljIg8rQM6bl1JzamBZvmLTXbsdrKkjnCC5AuHBeIJtA==
X-Received: by 2002:a05:6359:308b:b0:143:3a49:e30d with SMTP id rg11-20020a056359308b00b001433a49e30dmr5134552rwb.12.1697658426121;
        Wed, 18 Oct 2023 12:47:06 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id q4-20020aa78424000000b006b2b53de98esm3703988pfn.75.2023.10.18.12.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 12:47:05 -0700 (PDT)
Date: Wed, 18 Oct 2023 12:47:01 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 2/2] staging: qlge: Prefer using the BIT macro
Message-ID: <1bab82b0406a0206f8c85f7cc87e5ea554a9781b.1697657604.git.nandhakumar.singaram@gmail.com>
References: <cover.1697657604.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697657604.git.nandhakumar.singaram@gmail.com>

Replace the occurrences of (1<<x) by BIT(x) in the files under qlge driver
to get rid of checkpatch.pl "CHECK" output "Prefer using the BIT macro"

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 8 ++++----
 drivers/staging/qlge/qlge_mpi.c  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1ead7793062a..9f67e44123cc 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -2191,7 +2191,7 @@ static int qlge_napi_poll_msix(struct napi_struct *napi, int budget)
 		/* If this TX completion ring belongs to this vector and
 		 * it's not empty then service it.
 		 */
-		if ((ctx->irq_mask & (1 << trx_ring->cq_id)) &&
+		if ((ctx->irq_mask & BIT(trx_ring->cq_id)) &&
 		    (qlge_read_sh_reg(trx_ring->prod_idx_sh_reg) !=
 		     trx_ring->cnsmr_idx)) {
 			netif_printk(qdev, intr, KERN_DEBUG, qdev->ndev,
@@ -3222,13 +3222,13 @@ static void qlge_set_irq_mask(struct qlge_adapter *qdev, struct intr_context *ct
 		/* Add the RSS ring serviced by this vector
 		 * to the mask.
 		 */
-		ctx->irq_mask = (1 << qdev->rx_ring[vect].cq_id);
+		ctx->irq_mask = BIT(qdev->rx_ring[vect].cq_id);
 		/* Add the TX ring(s) serviced by this vector
 		 * to the mask.
 		 */
 		for (j = 0; j < tx_rings_per_vector; j++) {
 			ctx->irq_mask |=
-				(1 << qdev->rx_ring[qdev->rss_ring_count +
+				BIT(qdev->rx_ring[qdev->rss_ring_count +
 				 (vect * tx_rings_per_vector) + j].cq_id);
 		}
 	} else {
@@ -3236,7 +3236,7 @@ static void qlge_set_irq_mask(struct qlge_adapter *qdev, struct intr_context *ct
 		 * ID into the mask.
 		 */
 		for (j = 0; j < qdev->rx_ring_count; j++)
-			ctx->irq_mask |= (1 << qdev->rx_ring[j].cq_id);
+			ctx->irq_mask |= BIT(qdev->rx_ring[j].cq_id);
 	}
 }
 
diff --git a/drivers/staging/qlge/qlge_mpi.c b/drivers/staging/qlge/qlge_mpi.c
index 96a4de6d2b34..ce0b54603071 100644
--- a/drivers/staging/qlge/qlge_mpi.c
+++ b/drivers/staging/qlge/qlge_mpi.c
@@ -113,7 +113,7 @@ int qlge_own_firmware(struct qlge_adapter *qdev)
 	 * core dump and firmware reset after an error.
 	 */
 	temp =  qlge_read32(qdev, STS);
-	if (!(temp & (1 << (8 + qdev->alt_func))))
+	if (!(temp & BIT((8 + qdev->alt_func))))
 		return 1;
 
 	return 0;
-- 
2.25.1


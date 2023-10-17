Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54D1EBE
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFlNW2xY"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6934202b8bdso5242601b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697569590; x=1698174390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X74HUdsW7jfV9HBl6W8q2e+Tb/QlaXmSgd9sDUUldmw=;
        b=PFlNW2xYdrzVC/VWATJIJ0P1I2qRbwULXtABj1bVzv23Z7S+3M8EEyiQA84nHZobxk
         xXeAUPYueekte9hoqwhL6JSNoZ+79Gq38yglyyrVnOfo6Fvcl1wK5+5uK+yg3dJgTvtE
         FoQ8Rbj6Qp0ZmDTnXKeCCjso9lz9S/khYEYWdf9s/3oRlrPYNd9gmqBrtiQxtWmHFpRl
         y91vVTbLZVc+gIhCw+ybzuwlIFU5gsGr627z+e1zFRWJ3A3A/hn8+Sja2LuupIEMxKvv
         wJs/WecFPfVXQqY7qb1WNGRkznRlghmUvTjpP5kl+X0ElmkvtV+dveA5FHwrVlV5mkNL
         b/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569590; x=1698174390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X74HUdsW7jfV9HBl6W8q2e+Tb/QlaXmSgd9sDUUldmw=;
        b=kMIwfX4/5+YpMxk6DgvIv2oCm4EhZQTINRVKoQ/1ae1jmGc4DsppsRMKPLgmFCJ2QZ
         VghtQs0n3D7m4CZvnM9UDIr9qeL2SllJUKkdUWlx0BgP19NMy/EzSz3ls8IM8PXfs1bU
         +okzCoDb+V0nczkic7A3Bezp+F12UST+5pOb+MKLCNaYQm5wzUEPGZfUA7MpFLRIEtUf
         FhHWrpwY9eWnnEJhzmhL2N+zXKubpIURbn6gGQgqAEJ7jUFwd++MTRzDChjtv0qvHLty
         qV5H7ugEirbPqvGrxdYzsIgPoH8BrxoxPrbXRzzyear2M9cShhb+4SPKqi3Qaa2Q78Sm
         U2uA==
X-Gm-Message-State: AOJu0Yw0OIeNyQYbUz1NTFSR9IAPnvpyZ1TLn8tM3zoQu+3fLC0d0akY
	36huitC0QGThqKR/AoIJ+Vw=
X-Google-Smtp-Source: AGHT+IEgCGqhRzHdz4LfOpgn9gY4BENB6Qs/KK0GimbsV+aw48rQBEvNseqyaKykuRW1FJ4sJSJ2KA==
X-Received: by 2002:a05:6a20:7f8d:b0:16a:b651:dcd6 with SMTP id d13-20020a056a207f8d00b0016ab651dcd6mr3842233pzj.7.1697569590237;
        Tue, 17 Oct 2023 12:06:30 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id pb11-20020a17090b3c0b00b002794fe14cabsm6879886pjb.12.2023.10.17.12.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:06:29 -0700 (PDT)
Date: Tue, 17 Oct 2023 12:06:23 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 2/2] staging: qlge: Replace the occurrences of (1<<x) by
 BIT(x)
Message-ID: <5a962ea2ab9a40b1da11d95cdaf990002ffed7fa.1697568757.git.nandhakumar.singaram@gmail.com>
References: <cover.1697568757.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697568757.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Replace the occurrences of
(1<<x) by BIT(x)

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


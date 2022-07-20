Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC06015
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 16:24:42 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id fy29so32838981ejc.12
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IM4Z0bhKdcJIOSG7RMLAiL2IzvKZSWe9u5qiO4qj+lg=;
        b=EtYNQ5Uu6RDBR5CIu2gEawp92YGOIvSl+rnH6K/Eco8cGEZQJJbmewz83F7XfVMxbe
         /rcbY8OGKihYnkG+709L8OR5Kd0vr/zSZ+Kml02MwOwd0c2Tik1ETBez66OZ3192xE83
         gtfbd85EHBlx4SQEX5Z3IHgHwbjs0AD4aPPdobhiT2ABJ56P6cc/YQAE/3t9CuN/L/9y
         VGqiwiDKzwCGz4P4QoiPTzIFXWSsQiV/EMIwyDAoYbNQuYFinBi7RukC3zqq3wkg1ulQ
         s8YeMWnzT6exWbkDGL3S4AKW4ySqnIJTZOrHf+y/qJi72O/uu3NFbiWfX7wYV3edyIJI
         vwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IM4Z0bhKdcJIOSG7RMLAiL2IzvKZSWe9u5qiO4qj+lg=;
        b=j4LS92CPUlC8MetAGDS9ZYwOOdlh+EDx9kgO80iA8BF+sRBAnVzTns4f1SSHzXfDna
         KrBDjvqy1HskzwRGAR3fd606T5JkCkVf4upYmrfKUu45xYaG5cReZuJO5WTvYf4ygE2d
         WEHnFasm+j5RK3K2zOGHcIkD55vUio9qCUXwblM+nOAYj39Qmq7IvGQsg7L2FhwNknlz
         YIzKRAeJ4YUcx4qlmKJ8wEIGaXlKhQa8pwS1MAadnPcRj0M3C+85pZPxxhSap5kIl7KK
         9bw8lIzv/flhsTZKVtL6yu3QkcyZaKS8kKAWZ8e9Yd9pvhOX06jhoAEcge0IeqQkH5PD
         D3Lw==
X-Gm-Message-State: AJIora/HEsIcI0GQvOPbO9Wznf7Rq+lEvTPBVF70zPMZLUowHM1sgNVi
	EUBXsagz+LFTXvBjB8kCqyo=
X-Google-Smtp-Source: AGRyM1utSd1thNHM/v+LqzJi1n8BsWI+cVwvBZiN4v0W7avtGjlc1Hv71gYrNq3bDc+ddARG7H8FiQ==
X-Received: by 2002:a17:906:99c5:b0:6df:8215:4ccd with SMTP id s5-20020a17090699c500b006df82154ccdmr34529769ejn.684.1658334280485;
        Wed, 20 Jul 2022 09:24:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id bq1-20020a056402214100b0043a422801f8sm12747116edb.87.2022.07.20.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 09:24:40 -0700 (PDT)
Date: Wed, 20 Jul 2022 18:24:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: vt6655: Rename MACvClearStckDS
Message-ID: <3bdaf8401f49276c3176d073c7f77da57d7c1e70.1658333350.git.philipp.g.hortmann@gmail.com>
References: <cover.1658333350.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658333350.git.philipp.g.hortmann@gmail.com>

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 2 +-
 drivers/staging/vt6655/mac.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index a7f645f9ccf8..d7ee42df7062 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -518,7 +518,7 @@ void MACvInitialize(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 	/* clear sticky bits */
-	MACvClearStckDS(io_base);
+	vt6655_mac_clear_stck_ds(io_base);
 	/* disable force PME-enable */
 	iowrite8(PME_OVR, io_base + MAC_REG_PMC1);
 	/* only 3253 A */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 837ae9dd6929..c2c9cb07f32d 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,7 +537,7 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvClearStckDS(iobase)					\
+#define vt6655_mac_clear_stck_ds(iobase)				\
 do {									\
 	unsigned char reg_value;					\
 	reg_value = ioread8(iobase + MAC_REG_STICKHW);			\
-- 
2.37.1


Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF072
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:16:13 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id p12so11106958pgj.10
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 22:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zBM+FAFuyyZibWOVEU+NwC2c9w2fNaMRxLkV7FI0hEU=;
        b=IuAaYHqgmWuGE1aDi5pIPlZamrmCpCqykFFVVaojpyqCtwRYGnvNC1fNguqZTNV29j
         DK1BQLhTNPtKqwtnFpH7x4tesjocdWzdNUGeyETuYJRmmW2GkfrEotRS+VLtTVYy+eyu
         HXklhZEl8zMlWPV9F8OdUNHLa1ThyLfw7+ntx7c/OQs9x9CG+L+QrQfA8WTmiv4jxlvq
         /KpORx/ZSQWHV0boKkrfFFv577AqIKYqESgh5gbCz0CWyKtORtXtgXxc2LZjge2YShjK
         7KbR16Q2WP2YmBB0i98vWiu0mNwtB2pboRL5L99RcDyLtTOG0AIkuSZwX5Doa8FqqxB1
         ZrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zBM+FAFuyyZibWOVEU+NwC2c9w2fNaMRxLkV7FI0hEU=;
        b=EHYG5Qhlfwl2mel74IZQGGCCSW9PejOuwB2DWqhJULN1aThu1+e6sgr56v4empztsP
         Jdxgu+Ip/et0XDkn/PZXQqnBM3rXcj0W4rqNZuybP89zpYdugXGkLbtv1eGM++t38oTe
         UN4CsiYj+SS9yGQLx0LYk4eN2AKo3CEjjLtH1OwLDmzUxGQRWBFPcxmyvicBAV7GVed+
         VhFf3ehCOjoM96gNoX7LVa1KIKivKxpb5naRh5y6h8aFujvwV2qvD8CdHUX5gX/pCEu5
         EIUcP4BkNd3YF2GXh0XGPqskQmT+Kr6o3QkHgb69cyD3f6EbQmTeR7KRNn6r/KI1UWzl
         bEDQ==
X-Gm-Message-State: AOAM532/PGGxdGk+oGfATqi9VPqunIQxgVHJ1O7z2/Vl6koF3J+HXa7R
	iddAYxMoiRcgYsM5ivgs+uw=
X-Google-Smtp-Source: ABdhPJxUIQRi0S0oxbsGwqu5IzrWJT3HCr2cf7YA8VPrWcZYp0caKGpYurVl+6bikCc8hgkhD452Jw==
X-Received: by 2002:a65:40c7:: with SMTP id u7mr30494173pgp.29.1618290972915;
        Mon, 12 Apr 2021 22:16:12 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id p24sm7952422pfn.11.2021.04.12.22.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:16:12 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:46:06 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 3/4] staging: media: intel-ipu3: reduce length of line
Message-ID: <f18b704654797e29f3bbbe49689eaa2c0ad28d59.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>

Reduced length of the line under 80 characters to meet linux-kernel
coding style.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- Reduced length of the line under 80 characters

 drivers/staging/media/ipu3/include/intel-ipu3.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 6a72c81d2b67..52dcc6cdcffc 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -247,7 +247,8 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
-	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
+							__aligned(32);
 	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
 } __packed;
 
-- 
2.30.2


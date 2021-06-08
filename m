Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301E2FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sl2hI9DkGhrHAF/gZGC77L8hn5lQAm7T18qsJ8qLvm8=;
	b=LHcqH9sXBEA+iSlAgG+M4J4ag1UU81cGgySIpCbbgVA813ocPDBCu5Od98nz9riRwu5uxX
	wF+xE7IZOimWa9HwJL07hgudWMJTjbQ8jvin0ug4J3ob6KTmTmTvCjKXZPJbzEnw6dxgp2
	KastMqQFQOt4ahp6pNqwoEPvHBzZ/Bw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-8kqzr6zoPQSsTGBeSeDtSg-1; Tue, 08 Jun 2021 17:24:22 -0400
X-MC-Unique: 8kqzr6zoPQSsTGBeSeDtSg-1
Received: by mail-oo1-f69.google.com with SMTP id m22-20020a0568200356b0290248e4270f00so11363490ooe.14
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sl2hI9DkGhrHAF/gZGC77L8hn5lQAm7T18qsJ8qLvm8=;
        b=TX4v22X/3MU7VvPb4ytoN6m5MuRxq3mSSVjyda2gdnJdnNyx0M+ebTbGX0ne6QH1Jb
         vTjPjpZtKZS5GiJRY32AY/QGU6Z5yHaZV323/D5sa4sZ5mH+f6IA+QM5KNYwfBPb6q/w
         JPttX/PrF866RxkAzGHqPzW+yy1zbnkZl4a87JGFYHyxHi57uLzv36+Lz3O7f0npOlp8
         8CI94Ejs1d2s/by0yr90ie6W5IR4iBjXsOpEDjSqjHiJJLkhR6F9Gxsv83JkxjRoO71m
         3Qb4Gbr0705aFy/X54m3U271tASWO0Ujj3oj6DWYmop8N8Vj1ASM7ivZdxT3P5YZQ7d6
         Wgqw==
X-Gm-Message-State: AOAM532FvfrfCHrFJ73dv9wBHXEJWe6+QRzENzqXZojSxXlq+eqe2V5d
	299pEdTGi4p2qK1sD8CaIjXS+As6LaUWZGFVXN1kKn8tcoQ6/njdqgexTIx82clde9uwlQsPu69
	Jk3eP/XpcZZ329olycBVHsLuPwQ==
X-Received: by 2002:a9d:6042:: with SMTP id v2mr17663735otj.170.1623187461254;
        Tue, 08 Jun 2021 14:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmxpPWzOyTlGEiV6Av+AuPF28wy57ENACphojjEyHPZwmAPwtDFH5wKuVEl6aUMJEsLLhlTw==
X-Received: by 2002:a9d:6042:: with SMTP id v2mr17663714otj.170.1623187461077;
        Tue, 08 Jun 2021 14:24:21 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:20 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org,
	robh+dt@kernel.org,
	hao.wu@intel.com,
	corbet@lwn.net,
	fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	bbrezillon@kernel.org,
	arno@natisbad.org,
	schalla@marvell.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	gregkh@linuxfoundation.org,
	Sven.Auhagen@voleatech.de,
	grandmaster@al2klimov.de
Cc: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH 08/11] fpga: region: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:47 -0700
Message-Id: <20210608212350.3029742-10-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/fpga-region.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index c3134b89c3fe5..c5c55d2f20b92 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -33,14 +33,14 @@ struct fpga_region *fpga_region_class_find(
 EXPORT_SYMBOL_GPL(fpga_region_class_find);
 
 /**
- * fpga_region_get - get an exclusive reference to a fpga region
+ * fpga_region_get - get an exclusive reference to an fpga region
  * @region: FPGA Region struct
  *
  * Caller should call fpga_region_put() when done with region.
  *
  * Return fpga_region struct if successful.
  * Return -EBUSY if someone already has a reference to the region.
- * Return -ENODEV if @np is not a FPGA Region.
+ * Return -ENODEV if @np is not an FPGA Region.
  */
 static struct fpga_region *fpga_region_get(struct fpga_region *region)
 {
@@ -234,7 +234,7 @@ struct fpga_region
 EXPORT_SYMBOL_GPL(fpga_region_create);
 
 /**
- * fpga_region_free - free a FPGA region created by fpga_region_create()
+ * fpga_region_free - free an FPGA region created by fpga_region_create()
  * @region: FPGA region
  */
 void fpga_region_free(struct fpga_region *region)
@@ -257,7 +257,7 @@ static void devm_fpga_region_release(struct device *dev, void *res)
  * @mgr: manager that programs this region
  * @get_bridges: optional function to get bridges to a list
  *
- * This function is intended for use in a FPGA region driver's probe function.
+ * This function is intended for use in an FPGA region driver's probe function.
  * After the region driver creates the region struct with
  * devm_fpga_region_create(), it should register it with fpga_region_register().
  * The region driver's remove function should call fpga_region_unregister().
@@ -291,7 +291,7 @@ struct fpga_region
 EXPORT_SYMBOL_GPL(devm_fpga_region_create);
 
 /**
- * fpga_region_register - register a FPGA region
+ * fpga_region_register - register an FPGA region
  * @region: FPGA region
  *
  * Return: 0 or -errno
@@ -303,10 +303,10 @@ int fpga_region_register(struct fpga_region *region)
 EXPORT_SYMBOL_GPL(fpga_region_register);
 
 /**
- * fpga_region_unregister - unregister a FPGA region
+ * fpga_region_unregister - unregister an FPGA region
  * @region: FPGA region
  *
- * This function is intended for use in a FPGA region driver's remove function.
+ * This function is intended for use in an FPGA region driver's remove function.
  */
 void fpga_region_unregister(struct fpga_region *region)
 {
-- 
2.26.3


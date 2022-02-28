Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A8A53A4
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 11:08:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id d10so23961643eje.10
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 03:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
        b=hjvTHeqAC17Nm2rqJFqOWVUlo+eMrb6KCGjEjnmUhT0UbOoSD99k2xAziOpWZa+Icu
         SPp4Zg1lqK8FLNpUHi/iGpToynAZh7AAx7I6BqkiBOWQWPIrLjejJ7mt0E6lp79jr43P
         Z8Tz3UxSCHK1qzDcri6ZY14M8lx9G0bi6GCGQHl0DVbHpgXti6eqzCprjBZYIcyI1uce
         Dn/lOukn9J64/ASqyssuY+hk5ExgHfhAh8xyytTN1bW2SLq53AUCqmHXOqxQHzvGm8yg
         Hb8Tr+NdyPNcInoLFcy82stmYANyPP1+b2zh81uncpq/hmnHTquj2t004aepXQhNWxPC
         QShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
        b=mYHbLeV6KFVYSUb/uUEodue9I/euvWysHgdF5BEmc15I/hqq1dZN6goaVuOlp+X1Ni
         Qz+SzeIvD221UbERgLweQrAKlVtKKaHFsQqKjARsdI5YEX6zini2G0ok8l1LmGn50Twn
         Upsz6DERcx8DUC/bI5K2pGDZAO6BeHR0ebsijoGGQPxHNnJNRdahl7VLFh9YJduzfOQl
         6+JZqAVhVZSmds8SM6LFAypl6VWdSsbHv7mRMhx8+qTsTfxtGuM+Z7bDXqvP6gSy7XOX
         U9yERBPSed4Yb0D7I0FedltVhjfExBLsi5FWrmPputhFbx268oxuTTXFJdEGCwV0M4nO
         KRmA==
X-Gm-Message-State: AOAM533Swq2Wxd4Qqt2mxgE0Mw2BNhpIu5ArmwGPyOvZ2gYQPF0nt3DX
	5PQOsEUeWONf3jmZlfoPmaA=
X-Google-Smtp-Source: ABdhPJwIz1+OuMm91LqO5/9SwgL6U3RC8rZg6hPrO7zQUYJxh0T24GQzaSGRh+uNCyYPoPAvBQZaKw==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id v3-20020a170906380300b006cf56b960a9mr14108161ejc.716.1646046537823;
        Mon, 28 Feb 2022 03:08:57 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl. [77.250.38.153])
        by smtp.googlemail.com with ESMTPSA id z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 03:08:57 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakob Koschel <jakobkoschel@gmail.com>,
	linux-arch <linux-arch@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergman <arnd@arndb.de>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <keescook@chromium.org>,
	Mike Rapoport <rppt@kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	"Brian Johannesmeyer" <bjohannesmeyer@gmail.com>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos, H.J." <h.j.bos@vu.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sgx@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-rdma@vger.kernel.org,
	linux-media@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	v9fs-developer@lists.sourceforge.net,
	tipc-discussion@lists.sourceforge.net,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/6] treewide: fix incorrect use to determine if list is empty
Date: Mon, 28 Feb 2022 12:08:19 +0100
Message-Id: <20220228110822.491923-4-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The list iterator value will *always* be set by list_for_each_entry().
It is incorrect to assume that the iterator value will be NULL if the
list is empty.

Instead of checking the pointer it should be checked if
the list is empty.
In acpi_get_pmu_hw_inf() instead of setting the pointer to NULL
on the break, it is set to the correct value and leaving it
NULL if no element was found.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 arch/powerpc/sysdev/fsl_gtm.c            |  4 ++--
 drivers/media/pci/saa7134/saa7134-alsa.c |  4 ++--
 drivers/perf/xgene_pmu.c                 | 13 +++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 8963eaffb1b7..39186ad6b3c3 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -86,7 +86,7 @@ static LIST_HEAD(gtms);
  */
 struct gtm_timer *gtm_get_timer16(void)
 {
-	struct gtm *gtm = NULL;
+	struct gtm *gtm;
 	int i;

 	list_for_each_entry(gtm, &gtms, list_node) {
@@ -103,7 +103,7 @@ struct gtm_timer *gtm_get_timer16(void)
 		spin_unlock_irq(&gtm->lock);
 	}

-	if (gtm)
+	if (!list_empty(&gtms))
 		return ERR_PTR(-EBUSY);
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index fb24d2ed3621..d3cde05a6eba 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1214,7 +1214,7 @@ static int alsa_device_exit(struct saa7134_dev *dev)

 static int saa7134_alsa_init(void)
 {
-	struct saa7134_dev *dev = NULL;
+	struct saa7134_dev *dev;

 	saa7134_dmasound_init = alsa_device_init;
 	saa7134_dmasound_exit = alsa_device_exit;
@@ -1229,7 +1229,7 @@ static int saa7134_alsa_init(void)
 			alsa_device_init(dev);
 	}

-	if (dev == NULL)
+	if (list_empty(&saa7134_devlist))
 		pr_info("saa7134 ALSA: no saa7134 cards found\n");

 	return 0;
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 2b6d476bd213..e255f9e665d1 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -1460,7 +1460,8 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 	struct hw_pmu_info *inf;
 	void __iomem *dev_csr;
 	struct resource res;
-	struct resource_entry *rentry;
+	struct resource_entry *rentry = NULL;
+	struct resource_entry *tmp;
 	int enable_bit;
 	int rc;

@@ -1475,16 +1476,16 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 		return NULL;
 	}

-	list_for_each_entry(rentry, &resource_list, node) {
-		if (resource_type(rentry->res) == IORESOURCE_MEM) {
-			res = *rentry->res;
-			rentry = NULL;
+	list_for_each_entry(tmp, &resource_list, node) {
+		if (resource_type(tmp->res) == IORESOURCE_MEM) {
+			res = *tmp->res;
+			rentry = tmp;
 			break;
 		}
 	}
 	acpi_dev_free_resource_list(&resource_list);

-	if (rentry) {
+	if (!rentry) {
 		dev_err(dev, "PMU type %d: No memory resource found\n", type);
 		return NULL;
 	}
--
2.25.1


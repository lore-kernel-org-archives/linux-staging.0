Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340872C81
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:24:20 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id m27so13870289lfj.12
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OEY8Nv/ShgRU0be328a4aBs0udunklwNBMGijdPI63A=;
        b=cOgM5FYoqjFqOnpJE/4mVM0ZcNneFPxHhFY8ye/Nl3FL4D0U4Rt5EiQrhI8KlAp1zn
         4jLPgILJnHxHvKaB9GqRpjnuhmFbiRONmmu0ZNR5K3GZtBy+e9x1qvy4nwQ/6cLcqeo0
         k57SD88+ypVfGKq3wyQPPKeeXSH7B01b3h5G6GbhMJ5LOE0856ILNHLLtj4eMVT2rnCg
         F795q1L9ZN8UhSgkMAOR2LnU9ROgbOEzwQJCqWeeKYq5xyOGZVEecliRXGMCTxKRrAas
         cUp1Ve4YHpKiG2GXpZ5qX6UUQqg4Myh8r7lHnivGAlKbiUjums1EItKPqzbZQceW4DBb
         NUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OEY8Nv/ShgRU0be328a4aBs0udunklwNBMGijdPI63A=;
        b=KF315iXlf2q6VWXEKQJupotyalmvf+L5r4e+4Wt+9uTHxQ9cAHDgXSe+q4zd/Ts1/L
         pe3w00A5UFNjVg+9gWyAuirotTp2AC+/HqeGV8pGD97OLp5vTOzmGOc0dGJvGBrP9jan
         +mvXy8dxqIgTc7S6U8bFr70KhLZIJoiAFlTAKsxlb+na9Q+8+uvGuhxaYt6DZvoxnDeL
         dnX0SI54nC16zEIvECOcwzv3Rlov7kPCSKM4qy3pL9PkcHbfNpci8X842jEJl3Dn6Uxy
         97Ae9DP2VklgFFBWsR942YXHLoEwNov9HozVyrwylGJq8xA8Ugm4pah4cpSEK/iz07yw
         qlvw==
X-Gm-Message-State: AOAM533QWB1WnAIvSKYY2UZDiCMMsGjKQStcmFgKe/I9r+ypGHaZM1ke
	gZel2Un3gDKjs2nH989PfTw=
X-Google-Smtp-Source: ABdhPJzW0nxDlZoObnVzlzn9JAha6ommfx0LkvsUcTy9htb9etg78w3p+CGJ7a5ztElCsuaTlpOO/w==
X-Received: by 2002:a05:6512:2289:: with SMTP id f9mr19798702lfu.619.1636928658479;
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d6sm1223339lfi.52.2021.11.14.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:24:18 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anton Bambura <jenneron@protonmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] media: staging: tegra-vde: Reorder misc device registration
Date: Mon, 15 Nov 2021 01:23:53 +0300
Message-Id: <20211114222353.22435-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114222353.22435-1-digetx@gmail.com>
References: <20211114222353.22435-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register misc device in the end of driver's probing since device should
become visible to userspace once driver is fully prepared. Do the opposite
in case of driver removal. This is a minor improvement that doesn't solve
any problem, but makes code more consistent.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/vde.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
index ba7ef280423b..404d963690c5 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1189,12 +1189,6 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		goto err_gen_free;
 	}
 
-	err = misc_register(&vde->miscdev);
-	if (err) {
-		dev_err(dev, "Failed to register misc device: %d\n", err);
-		goto err_deinit_iommu;
-	}
-
 	pm_runtime_enable(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 300);
@@ -1216,15 +1210,20 @@ static int tegra_vde_probe(struct platform_device *pdev)
 		goto err_pm_runtime;
 	}
 
+	err = misc_register(&vde->miscdev);
+	if (err) {
+		dev_err(dev, "Failed to register misc device: %d\n", err);
+		goto err_free_secure_bo;
+	}
+
 	return 0;
 
+err_free_secure_bo:
+	tegra_vde_free_bo(vde->secure_bo);
 err_pm_runtime:
-	misc_deregister(&vde->miscdev);
-
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
-err_deinit_iommu:
 	tegra_vde_iommu_deinit(vde);
 
 err_gen_free:
@@ -1239,6 +1238,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	misc_deregister(&vde->miscdev);
+
 	tegra_vde_free_bo(vde->secure_bo);
 
 	/*
@@ -1257,8 +1258,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	clk_disable_unprepare(vde->clk);
 
-	misc_deregister(&vde->miscdev);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
-- 
2.33.1


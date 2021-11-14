Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699C52C86
	for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 22:48:30 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y26so38325139lfa.11
        for <linux-staging@lists.linux.dev>; Sun, 14 Nov 2021 14:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ImcZoW2Pqa7ZRY/8PEMeXuQQ0A4lrgRe4vr/rypxpxM=;
        b=hDm+hWyRQI66NSlBlRF3pXrbBPomci2YplEsAU3wgIVCOYTv2uClgrNw+wbic17+kj
         5xo5effVDq+wZ6ZhysDJ4vNNsPnpA/s//WRVrlMWai9sVeub2ulsYWS0r+82mR/wf388
         KvbOJ9ONvzJ4n6YB0ceRQPaV3jvfUD3Ocw4qJRPwkP1acynqV+5+Wv7E3NnmLmsLCevC
         TPZQYwPA9HbP+cQ7zCt/iYC3GCKMhkPKYPVVIKJKjyuyegSbTnLYvneEB9cRh2L9M/eH
         3uYkjZg9zKxRGabyFrFpfPd8TuH0B/usMxmweDYKvWy1I1a7Jx/US9KqH2uzGfLRSsdz
         a7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImcZoW2Pqa7ZRY/8PEMeXuQQ0A4lrgRe4vr/rypxpxM=;
        b=4Gg8kDfq2OgSLVvHaKcWqE9dQfXiJSxuNlyJ79vuJerydsS7BqYIGJledJZ92MW3Eu
         biN18iFEJ8snXo+28OTw2OAQtz5QvwnZlp7/rNVP1oO1kqK/lvgpcLQoBPoMvXrmsUdH
         IaXD+kM6PqAr340QNuXWuyk19LgzQN+MNCaYRVvOiBAiXPLYdgssi+LbJqIbXSZ2ZJHR
         21u7VQsEwJUcCJVgLn8ax/b2Z0q5E09teTu9CI35cSK1XEW9d5Vf/CYPjYhXdyZN51NJ
         /6mH8TGrLAG0MpROPmOxnRvs9qBewohqjx3oOm0Dm1bGFdbe/KKL2Vi9DgGSnhnwUOFx
         o0FA==
X-Gm-Message-State: AOAM532yRyWpl1obGoWUKMRIuaw0258WXc1LQyJrDw8m9gE/IUf4/n2D
	Y4IRkm9ZK/lPvr2DEc5tLAQ=
X-Google-Smtp-Source: ABdhPJza0kexM3zW71JVQc6l5KmuNpf+eeMnHcB7U4RkNa3k2wzk30jArYTMgkgYnWxAnz+gAuXQ2w==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr13887808lfi.86.1636930108582;
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id h1sm1228591lfu.277.2021.11.14.14.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 14:48:28 -0800 (PST)
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
Subject: [PATCH v2 3/3] media: staging: tegra-vde: Reorder misc device registration
Date: Mon, 15 Nov 2021 01:47:32 +0300
Message-Id: <20211114224732.11550-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114224732.11550-1-digetx@gmail.com>
References: <20211114224732.11550-1-digetx@gmail.com>
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
index f4f65eb78d44..a8f1a024c343 100644
--- a/drivers/staging/media/tegra-vde/vde.c
+++ b/drivers/staging/media/tegra-vde/vde.c
@@ -1193,12 +1193,6 @@ static int tegra_vde_probe(struct platform_device *pdev)
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
@@ -1220,15 +1214,20 @@ static int tegra_vde_probe(struct platform_device *pdev)
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
@@ -1243,6 +1242,8 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	struct tegra_vde *vde = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	misc_deregister(&vde->miscdev);
+
 	tegra_vde_free_bo(vde->secure_bo);
 
 	/*
@@ -1261,8 +1262,6 @@ static int tegra_vde_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	clk_disable_unprepare(vde->clk);
 
-	misc_deregister(&vde->miscdev);
-
 	tegra_vde_dmabuf_cache_unmap_all(vde);
 	tegra_vde_iommu_deinit(vde);
 
-- 
2.33.1


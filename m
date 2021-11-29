Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9292C9C;
	Mon, 29 Nov 2021 18:26:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so13051566wmd.1;
        Mon, 29 Nov 2021 10:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BpKcc9rm5rbzAZatIAOzggrBDPf3twFeL6olSbnXxPU=;
        b=EZ2uJ0rggm5rd6nlRpQ3ZxOHTGwskWknuwJ6X+/H7KG8oZmW/z/QRYVDK9o7wjR+hy
         idmmsd17KgTQuF2MQoR3LbzYlRh7cufHoCaby3K8ycNUnFl4bKxdAh5yp6f5s3uLTML2
         4dRkc0LvnTVeZ0RlH+4BzsFK+dxwrxBEZN8X5PFIwAzYTs9Bdg5N8X73gT+ozxFexXU/
         MUCK+tIQUasz5ngu+sOyUIm03pUYuy4+cAj3sFeasL9anUiNtCYlqsv20PU8RAsJmHJJ
         VixmPiqpOPz++oel9+YKVCLs4Hj0525uVrxJaQl3Uiyca3H74nC8Hn6tlaavFPUQgqe7
         x4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BpKcc9rm5rbzAZatIAOzggrBDPf3twFeL6olSbnXxPU=;
        b=i4joVl0FsLy83+ZK/HxmtUNniHboivZhSUSXQ3IqiV+qYCu11YFvPkVfWXGgM5xNSW
         8HYEyuyGXvOSc6zPMO/6w3ZLHuT67Ggpi85EpLujOdweszfwT0yVzZGA/vvOi65IBwyT
         ZXRTutQgz4tial13SEnf1fMy1mAQf74Pd04+yis1DropGr2j4/ojBV5KNr3Q7fud3S1h
         Hnfc3hArGSUDJ5PXS9MJTCLAqAmaUshyRwB58Iqbj9WzGgZ/6UfrQjikzLpo4EyYN+fG
         Wg5HQmFH0FUK2o4MD0q8V3VF0J6wVTrQ3ldTd35stLenUKG7I1DSdsTaXGO8OJ2hkydZ
         ft+A==
X-Gm-Message-State: AOAM531AiTzHqNfTqXYmJx1VNtQSpJrEK+eXPDDH+W5jPHDEGWTMhcbS
	Yqm9cQfaiP4yesZzNsChMvY=
X-Google-Smtp-Source: ABdhPJwaFk4yVUq5kkGJf2GasjPsTe3ndZ0bAmMTH8Ot4orQxTQlScuG9Re3xVxW2eh9++aRYdlK/Q==
X-Received: by 2002:a05:600c:3846:: with SMTP id s6mr20926wmr.55.1638210398970;
        Mon, 29 Nov 2021 10:26:38 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id o12sm85907wmq.12.2021.11.29.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 10:26:38 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	mchehab@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	p.zabel@pengutronix.de,
	andrzej.p@collabora.com,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/9] media: hantro: Fix probe func error path
Date: Mon, 29 Nov 2021 19:26:25 +0100
Message-Id: <20211129182633.480021-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129182633.480021-1-jernej.skrabec@gmail.com>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If clocks for some reason couldn't be enabled, probe function returns
immediately, without disabling PM. This obviously leaves PM ref counters
unbalanced.

Fix that by jumping to appropriate error path, so effects of PM functions
are reversed.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ab2467998d29..3d3107a39dae 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -981,7 +981,7 @@ static int hantro_probe(struct platform_device *pdev)
 	ret = clk_bulk_prepare(vpu->variant->num_clocks, vpu->clocks);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to prepare clocks\n");
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &vpu->v4l2_dev);
@@ -1037,6 +1037,7 @@ static int hantro_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&vpu->v4l2_dev);
 err_clk_unprepare:
 	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+err_pm_disable:
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
 	return ret;
-- 
2.34.1


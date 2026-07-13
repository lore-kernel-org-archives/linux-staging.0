Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC32400E0C
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944715; cv=none; b=rMtOOs54nchIqcVQeJY35q4mjHcgAmPRUOet8JCKppzCszhTvJG0NV4zjgx4rMKMFpGR8siUVfibQUOd1MvrhjIr5oCnoKTZgzB5DbrSquUCcgbnrYfdt5+ATjUCiyqPuzbz8Z+YlcUZnLADzSOWHDjwnXMhJaLl0j5WqiP+zxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944715; c=relaxed/simple;
	bh=ptkcLZC/rZ3ISEyM/x91NL/C1Etf2/yRncxk30AlMs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaZpjAJnVcePcs90aUYAK5YIuZrcKZVQpt+rSQWj35UlLT5nRBsmePcGkEQd2Hj8zI4pAF6TLG+DnhJeLEtgvseRJIoll6/T+pWt+UuO+wxk2721btd+8lF55HhYQbqy41Q1qZB/1HECNsw1NBamHdqfzTFBHv7Q8xX8BRCkLyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQyBEUKb; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQyBEUKb"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2457719a91.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944714; x=1784549514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=cQyBEUKbx1ZI+06zCPRdKOWi/bgT0blURQ6NzDvVVAgp9VdMuQwlm02RdXZYNVhavG
         lbZ75eAKXOeBjeZArZkUxPDGgE2wqf4wFGOU++NoPr+AtFdSj/PZN6p8MVa8crW++EXw
         1TwfjpqMt1oXFalfjh2ODa2TJZ8WONtIncOh31p6KzbTJJiubXlynj4RChcNjopNHsAP
         QSVQi74Sltl7UL7TEAB5dr0Z+sN2gVYC5i1n5HRGw54XyNX853ztDJN+RPS/lF1ehPBt
         7TvrBOMN95yPVy6MVqdjI9bypA9TCciYjziwlUST0jXYATief+KhpCzRYdcUJiT8Ub54
         w3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944714; x=1784549514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8Fc1y4+RwjniJfgwRtIk0X9ABaeOzCopsCGLc1zspc=;
        b=fh+SrQUTNuVeHHnLmoLH5gu0023rW6D/E6A0aTc7GtBrkvg8LWDtHBC5R6lXEbKk0Z
         Y7GDBbORAEjAd57F1xPPsz5E2Gtn6ou60q/cmk8RPSGLGWnJy/bVVNG9cQvj7GnO6B+w
         rXbh8bSa5BIG7Q5/AY/AjAPJR8GNmbD8kuzjRskK2Up1Ar66JXJVg6EZx/jIUq76uWX6
         BYYTncr8eVCXjWz3YlT7Hq2bEzKEY7tb2btFjaFMCY6J32qJOYQ5RYYdTRN965ENP3Uy
         +olJ5QtSJJ1c0xpJLQJLKK/iIKVzMtY2eQifWAvyjpZyi6Cpue0k6QiztfUOUluSST3s
         6Ulg==
X-Forwarded-Encrypted: i=1; AHgh+RpAOkKYE/Fbnk6piWA7clnXN8fOKsvovijY6b2C/Zhh+ARtJgzJNcfZ7wqQ9pnBS+Jq8TX14hpsFPVrIy1t@lists.linux.dev
X-Gm-Message-State: AOJu0YwLqbtXdnTXCF1RHo5aC1CyE551t2WJN8+HdYDmTd7PJyIcL831
	zlEZ2QPcX9tTAFwirLv2RdX/a6bjT4inRPp7v7KdAgGUqGUL5pKHBoSh
X-Gm-Gg: AfdE7clzqrzJ09qbnfY8MiTCvKz4OznsU+MC16tgfjKycvPJyTbPpx81YBRav8m0b33
	yWNFB5K9uSQaiSiS8Dm/IX7AoDsTEqoi8JPQgoVVH7JXxzZ7eNYb7FF391LAvQQzfpS/7F7FuNF
	CNUj1WG/BOzH/YZaqJphg4M4A0gyk5aajDgs6D7wdlSfsup3Z8t4QOxeC690b9CAXpgO+8lb1Xb
	fF72VuIyprOd/Qr1761DEAZ9OPedMxbScKi41DWmilcrIJlzlZHN9ctaLuCimRulNGnn292e2R4
	/lSDY4uSgqod7XRD9/eBq8r98q42Smbdl7ZnqN0fUk5dig8UNi8i4OJ6yzwCEV1kpdS/rlKymP4
	yJolYRpBuoQMI0WDL28dlMTikZO2PYOXxJR8VQ3kx1B3ACEUPJd/jibaba5CwAaRE9D0uc5UZVX
	0HqpUeWo5mnw==
X-Received: by 2002:a17:90b:4c51:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-38dc7607589mr7644160a91.0.1783944713757;
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:53 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 17/19] media: meson: canvas: Fix Use-After-Free by linking canvas provider device
Date: Mon, 13 Jul 2026 17:37:12 +0530
Message-ID: <20260713120840.17427-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdec driver retrieves a canvas instance using meson_canvas_get() and
stores the raw pointer in core->canvas. However, the helper drops the
provider device reference via put_device() right before returning. Because
no formal device relationship is established, an unbind of the canvas
provider driver triggers a Use-After-Free (UAF) bug when the video decoder
subsequently attempts to access that memory block.

Fix this lifecycle hazard by enhancing meson_canvas_get() to establish a
formal managed device link between the consumer device and the underlying
canvas platform device. Using DL_FLAG_AUTOREMOVE_CONSUMER ensures the
dependency link is automatically torn down when the consumer driver
unbinds.

Additionally, handle missing link conditions using dev_err_probe() to
clean up upstream error diagnostics, and ensure the canvas platform device
reference count is dropped safely along the uninitialized driver data
path.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260530111022.9C6D71F00893@smtp.kernel.org
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/soc/amlogic/meson-canvas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 79681afea8c61..5102a491bf778 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -54,6 +54,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	struct device_node *canvas_node;
 	struct platform_device *canvas_pdev;
 	struct meson_canvas *canvas;
+	struct device_link *link;
 
 	canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
 	if (!canvas_node)
@@ -70,9 +71,18 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	 * current state, this driver probe cannot return -EPROBE_DEFER
 	 */
 	canvas = dev_get_drvdata(&canvas_pdev->dev);
-	put_device(&canvas_pdev->dev);
-	if (!canvas)
+	if (!canvas) {
+		put_device(&canvas_pdev->dev);
 		return ERR_PTR(-EINVAL);
+	}
+
+	/* Establish device link to prevent Use-After-Free */
+	link = device_link_add(dev, &canvas_pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	put_device(&canvas_pdev->dev);
+	if (!link)
+		return ERR_PTR(dev_err_probe(dev, -EINVAL,
+				     "Failed to create device link canvas\n"));
 
 	return canvas;
 }
-- 
2.50.1


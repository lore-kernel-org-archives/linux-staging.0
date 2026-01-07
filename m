Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97441328631
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798579; cv=none; b=pQvoFtjLqtxSkwI1/uK5kUZToe+bus2ApuhbMNS/uNaZhwqzu2OiMmjdrEK4YNR371HGytB+Vlt5j6Ng4hPTkABj2fPJW3xRmpxmu2qdM0QX3GlyYlGq77CcuU09D5WFofdFOhe9oybwE5YiIQS9dXOYgTTkrc5Qhxi+9Nd6ork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798579; c=relaxed/simple;
	bh=mnmqm+sV4J6xoZuyVc6SiEB8yZ+1Lv05//8FJGOKXHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csCOr5s/TiW9uxmQ71JrJm66ONXnOXLNQ6GMIb4lNoHT7GSv5P78/lwolVjd3loORYgGoPwd2Zo2Y2NmchOEnkr0nks0QBzyG/kAFAa8V378VXXJf30m9lWfuwdA8wQlAOCb6rI2K7s4fZrObS2TRD/L6uUVUdx8Gv9pv3YSIt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWg/vGO6; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWg/vGO6"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so1576000b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 07:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798578; x=1768403378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeBDx+YUjGbbLJYP7ioCQ7iYFylmc1DSRE5Jg3YEh+4=;
        b=BWg/vGO6cv2LMtoxfi6ucZyujyaYcfJemXNSSYipVVB8cc5+1FaHUluVjI35jpX83w
         4VHCi0+PkrRArM9OmZfZCTmEWFcUwiPATfRPuyp9Q50o3ltR7nJFsNWZRnnKBMacgXVr
         OHN2YXP+8Y7AXgOFR1v4R/f+xJZB8+RoQzaWIGluSlUUVXh1erjrJsMNsixMJzQ30MLI
         kvl1MGr8yShe41XiRwWwIcVLlylkq0wY4i55VTOOJ3SMjh4g2M4qy8jGiPh5Ban8dovs
         6sJRKwNBMJRQ+T0VfgHGyjnFbIVw0QDaiMl1y/OyvDE9NHbu7anLDwlac+A3cuNjcZok
         UZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798578; x=1768403378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeBDx+YUjGbbLJYP7ioCQ7iYFylmc1DSRE5Jg3YEh+4=;
        b=KWE1EjMKYzmUpJHzbaEm1DNPiTiDCCn+jfRTyCsWt7ipiPUpoQYbXcTPZEcLD2FHUx
         5930EgS7HHpmIvG8Yyd7NqIKFmn2YbiPmu8Sm6lWqFJGMSBDFgTuqv9FlfBGKQEQo2d3
         cb2l7nuZ7i1E+pRt7gI0hjTGkBf14ZzySBq9DDQ3ZabB7xjSIhIpFgEZa6liInri9BHt
         LrdEhFhLasT/gEL8fYX114Vdxcz67MduaV19cm4LlF+tT3dQBQxTanKqkLlaRzxZLPaw
         YKgQ/0KJ5xDQK99PE7KMiEnP2ImbZmWbgEVSjlrP1oKxnHFJovu4EHcd9bMjCfWSGnlq
         4sPw==
X-Forwarded-Encrypted: i=1; AJvYcCUDP61d+jMjVGcQ+WChYBENzOyufhwsRCot+J7fmWs6cYHJ9DEiSXaY/vYYgZx9lr49QJachC7z38g2UFY0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1YYO3JtvJW4liCUH2qIs/9FE+ihdHx7bM0HtlnyzI1nrtt8M5
	sETVWp7aR1MzhjsK+5ZWileE9QGu0kKCII+gZwB654i6XFX88n/rg5l5
X-Gm-Gg: AY/fxX5ji1ARec3dF63pskE3k8n8BZZxzwRvBY1vk+VfvtvwK3uodT6jwVvNM9U5C/g
	T7kp8LVaSOMhEbYuvE2ESJlXW9/OdCa6ZiatgRE2MJaW+XgLdPADpF0+Ce5fI9bAkI3l27yweyS
	5aS3GS2dL4CV0eaRAGHhUCGyZkDD5Be54t9ek+b1eb7QJ3VRt/vnnH+l0z7JRb6N3W53OUmUErj
	LI7YeSqPi16qEdcGZGJ7kOzNLc+hh4qwzCpcKKTvBGplv/xVsM8bviNC26PaYg4/MuLj6xgawDX
	3N6nVdCB0651kRYT7hqVukhSizFMHTF21TJPf3/3zX53sy0sj5yvERR9/OuVAa70SQ88pQS7lXj
	mq4TNokVt82XciSqZ39kL0Uf+uoal/zpp55n/dY4/VzNgPXUMf6Y4j0qDqSxkDqbpcC0wET/ckJ
	/eQ+O96Le6350=
X-Google-Smtp-Source: AGHT+IGMs2B36viuuAnfjeiIBdzTg9KYUmjvbamIyDu2pKeCZP0v+ieVtRSjbeiTwNmI0J2gSr8EKg==
X-Received: by 2002:a05:6a00:4103:b0:7f7:850:dbed with SMTP id d2e1a72fcca58-81b7f7e2ae4mr2318127b3a.44.1767798577923;
        Wed, 07 Jan 2026 07:09:37 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:37 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 3/3] media: atomisp: propagate errors from ISP xnr and IRQ enable
Date: Wed,  7 Jan 2026 20:38:58 +0530
Message-ID: <20260107150858.79818-4-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107150858.79818-1-karthikey3608@gmail.com>
References: <20260107150858.79818-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate the return value of atomisp_css_capture_enable_xnr()

in atomisp_xnr().

Also print an error message if atomisp_css_irq_enable() fails.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 677c460fe..0f5b2e90d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -874,7 +874,8 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 	if (!isp->asd.streaming)
 		goto out_unlock;
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false);
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF, false))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	spin_lock_irqsave(&isp->lock, flags);
 	isp->asd.streaming = false;
@@ -925,8 +926,9 @@ void atomisp_assert_recovery_work(struct work_struct *work)
 
 	atomisp_csi2_configure(&isp->asd);
 
-	atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
-			       atomisp_css_valid_sof(isp));
+	if (atomisp_css_irq_enable(isp, IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF,
+				   atomisp_css_valid_sof(isp)))
+		dev_err_once(isp->dev, "atomisp_css_irq_enable failed\n");
 
 	if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
 		dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
@@ -1196,9 +1198,7 @@ int atomisp_xnr(struct atomisp_sub_device *asd, int flag,
 		return 0;
 	}
 
-	atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
-
-	return 0;
+	return atomisp_css_capture_enable_xnr(asd, !!*xnr_enable);
 }
 
 /*
-- 
2.43.0


Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F33ACEF0
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386215; cv=none; b=aCR58EDVKxckKI/fhL2+QA9p5GEBS7LBjsol49155iVGjTxftEIuYT3hiX+7XAoc0bj25tfvfl0yyhdd5bS9rBm6Vn3HVHdiys4C/WPmkcMqe49RDItLoJmQt3No8KhDyrGQAqxm+7azz6YjWaVeeDcpTosYLzz2ue3X93JebqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386215; c=relaxed/simple;
	bh=JNPPCx1lHWFCtdTmAC7TGhYjYGRHFXbs0080/F7tOtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FrFQw7ttuPTTi+pVNDSNLVuYa6ZCZO7irioOb/ba3/oFGNXMzWm6gX3YYhBgy2BwRXGXe19dmAu+OWLZ5ZITJci+o7ccaG3VG3QV+DaZH+E3xR/5zXYkaIVHCWbzVOHCtedE9AMo26AGlGLBiNdRnIobO6MMnJpVu7J98HWCIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0HoMsSg; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0HoMsSg"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bf132969bso3004092eec.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782386210; x=1782991010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1lY6wwCmnan7xgttBtmnV+eq+UmPFxIzOyt1ELNCEc=;
        b=n0HoMsSgZfjzChMr1aUTzYlIe84lsb5rPKIRP5h3Wk+mazVVYPt7ONV3C2EpjSV32P
         zy8f6TfFhzGHxX1djjb8/6iweEc+lOtZTj3aMjH/NBS9O4ZZm0YQm7bkslpKWlkYikrF
         UtwyjEqLpCVW+A7gEQMLzE/MBdz8+GWL487/l3qX1/UjZynqqeiEd+fXPf+af82TWyMj
         LVTIf+d+RTPtQX6IO18SHCA/UoULBc2gceuyiXxOv41hM9bRJ4kmyRBcsl8Z5bTqsL0Q
         hcZ3wRHb0JRVx5RK/xcKIkSbXMlZrn1D9d8v29MBl633o8Wg1CSo5RCdP3ovJ09bCmxq
         Cf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782386210; x=1782991010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1lY6wwCmnan7xgttBtmnV+eq+UmPFxIzOyt1ELNCEc=;
        b=FH3HCjfsC8RMmDYIXhjEkBJqETpPzE3NZna2l8by7rvX/AfbU5g7F6m5LgOoaFdsPJ
         ZmlYV342F+FJ+K2PvOPPPb7nLP4hoDYDYxSt37r5rtSL4jj2+N9FOov2rJOgZk5dp2dG
         bNKJDjR6fgrUXa4odRD3Y2W+aXJUkD/aJIh3DxscZAlgvvZ7zO8WK7MhwtOG5tQzSE6H
         lJHIXjz/iFitP/iYfBkqzLiomdyJ3mPUdH2Y9JIIRJKK8j2mXvXTeJW4sGV47GwaUx0l
         rscsUJseBGOcEHF4bJbsO7LkmN1JD4WddlxoHH6GEsiEZz6qrLIadytc3Wq9fdbeomvE
         0EoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp59jSex72/c/8gh79bzet3lt3zUy+zm/bMXzm1VrnAy4YqmxSXL+JIh3zfDOOK+1aS2CY0Xs/w5X3zzgnW@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+DVIFqzfStgcWNSU6L2ijZtQECUSWtSYJIMTQOrUsh/DNUgO4
	qnBzeM7y8ho/wxBvC73qJRg3ZgK7xFYIAjTOwTZmmLmF/svrEofLh31j
X-Gm-Gg: AfdE7ck/tHVGBl5YW0iNB6bGLxwhBCUV7agR1Acm6wgbTjifADfkSvJt0VkHKAf/KLR
	yfHHavD7OAN1L+JAX20zNwbVkrx6OwNKoB+xvK/rp7Ph069RtLVSuJ9tBaECv73etyY/5JYqwsx
	Qhqdmq1YAS2b/UIrVTgrgtK9giVgqLBQvvnpRusDgfCGU0U8ljjr8brJQpCSMrAExxLdHtDeuRE
	/V9ZXmCgOopjt/Kd8Xlp2TSVtIHKjwgk/y/RiAF4XksEk2GRd1TWxVp5GJcVzOMVcKY362W8wfW
	nH+5GaF0A8DBuA+ff5DQkPs9hjqROS05q5ab0pl60l6/M1TP7YU3e7T7Ch+mNcjiX1tzq23PkU+
	l2SYIMQRiHMUOwCYRZBJMXroTvUTh3CLzqGElkMI8eEumhRIHQuzXqBv151NsxgSGIR/TURHOg5
	blKZtSjcEpC7oBBnV50xDhQ65IUi2OeJ4o8A==
X-Received: by 2002:a05:7300:e683:b0:30c:2964:67b5 with SMTP id 5a478bee46e88-30c84bccf37mr2272357eec.11.1782386210298;
        Thu, 25 Jun 2026 04:16:50 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7ca5e601sm7915909eec.25.2026.06.25.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:16:49 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: error27@gmail.com
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: greybus: add meaningful comments to mutex declarations
Date: Thu, 25 Jun 2026 19:16:37 +0800
Message-ID: <20260625111637.311831-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aj0CZOUlYlJydfPd@stanley.mountain>
References: <aj0CZOUlYlJydfPd@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gbaudio_codec_info struct has two mutexes whose purpose was
not documented:

- lock: serializes DAI stream enable/disable operations and
  module_list/dai_list access in gbaudio_module_update() and
  gbcodec DAI ops
- register_mutex: serializes module register/unregister operations
  including DAPM controls, widgets and routes in
  gbaudio_register_module() and gbaudio_unregister_module()

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..3d92ac8a0 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,7 +70,15 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
+	/*
+	 * held during DAI stream ops and module_list/dai_list
+	 * access (gbaudio_module_update, gbcodec DAI ops)
+	 */
 	struct mutex lock;
+	/*
+	 * held during module register/unregister including
+	 * DAPM controls, widgets and routes
+	 */
 	struct mutex register_mutex;
 };
 
-- 
2.47.3


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162A730C37C
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 22:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103272; cv=none; b=uRk+TXsOsnK7wcbxuPUUG8zelI0eDIyuf2LpYAV5/3tPavml+YlDf9G+nG8DKJ5WiMSFOSbm2It0YSJ2YABhCpdkTOLshz5YJDBNYZyw2OU3fUveYB9trGwltpATSgCqkC8SHOa6DppvommVK0eYLPS4SlXO1OIPF+fYSuXYW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103272; c=relaxed/simple;
	bh=rJMZO0VgIuzF0WSOhbe5gXe0SOTu6iu5Wck6NzeudBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YqeW0bDQ8cljIRy29nEc/VPTMsRZH4/bWpKKVUHS/ALXm/fDoWi2H+BRlcCyCJWa39TbBRTFJ59kmSg54OuuYVTjJZf4I9s+fatk8Ruwdh4KIo+u9275/JYVOTW16pcctJpLLOB8WQ6rqLsIi6Nihrb0tQ1vEgiByawmKFnf3JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9UMobBe; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9UMobBe"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso42666345e9.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 15:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103269; x=1792708069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vTeoZs89HS3SYDzrwek7OhSrNhRzVN8YqVYgGwhyqS8=;
        b=p9UMobBeeHs2cJPi47h3thODj1nwDpThbslorKZNlW+FkOylEU0OHaOMZg6tHuygw8
         4w14pRFJTd1bbcXHn50w6VKo/taGeyskTJkbCyRv6501vNa8KFYTO916vVuXxe9vUmOe
         auO4z24fTomRRri9BTSP0S1JK4YK/cGsKqh+kMEddZyFEpHfqgt8lkOX+Ts416iEB+/f
         nq5LuHD5fJXKmfFHgJhYOMfsA5WN10JfMhWkZnyEowe1JJ9NMs56iYeGp70tZ3vQtI1I
         4vkGuTV5p0g90AFlEnu1DJ8WF/jmAxV0LKJ3wfsTCFwikO/3gz6nzPEZG+v8z0ZaXXHH
         Nnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103269; x=1792708069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTeoZs89HS3SYDzrwek7OhSrNhRzVN8YqVYgGwhyqS8=;
        b=mYS485TUFy8tDsULo87WcfwKMuJIqc3qb0e3k8+DKdt5LfWWbJHAb3YbjmDXOPXftt
         5/8dCJtolts8Qvcwp+FM+npmK60VpkbRbRtj59xmO1HM1joOr1gnPQ5518pDwGoRSig1
         7E6hyWfAQm0KBq47VYGJS3MttyHZsUjtudgeK1sIEZdAJhzDpGEoJpcHVQyer6GVjQUX
         HIz2F+F7ZUJBCwCNoC/o6Ix/zVAQavctCRae9uLMGXM6WTtOga8uianiWEC1z1n9HFsQ
         Q1vvKlCD6AYIeE6Uli3zTfEv5ycYrJNzHLXpf2RfQtk/07WF4kCnH4qtjxBjqynI0xZh
         7VoA==
X-Forwarded-Encrypted: i=1; AKwUvBw6ERY39PneamHpENXl9i4r8dVSDuIosDIhX/pPUb4AAsYQCZwJx2QnPfqgORKPxy6z0NALotY4LA7WU1BP@lists.linux.dev
X-Gm-Message-State: AFq9FYIAdI2c9oP3P98XXwH1s3nruFfVlNGSN9e5BBxbDLn/rMBDC3F+
	HbSN1ptqnRfarpzBeQT9QrPAH+6fZH2Yt6qfdXf/HSYKTs/DinHhh42fnyshcmNmSG5DtQ==
X-Gm-Gg: AYBFou1Ds6e8rztT8UWJn9VaciHo2gFLhB3yTk++PRMx0x3DiVxhlCXtBijd05so+Oy
	pLWrRk80nUhjcO0RjrXfEFZfa8vsIcNNPNxusTvnidjDDktzCraAJzKBVQ7zFHlRO9SCN2UZrf6
	en4NSh0UZdP86PLyEFPhO6X8wl5aqQ/tmMRBHMI5p3zrRglzVJT4dXhI95ShKfNwR3uxo+dCJmR
	837PLrDr9VU9VIdX93MSP+1FyBgrWBmqG4PeEkImLxOfBCT1DQ12jJiSETmCdtdC96Pe+ArwYym
	vXUJgzQuFp0zEJFjhnXotcTvNGv9snQloNPakEffaq8jPlt+vVMbknWZOBsoCf0VZEGHF2dWv6q
	k81+C3//kgQMVoV8ZUReGZR+flgYUzKkHbiuA5hjIe5uqFgF09ThnX6pnaaGj3gsUjML9vcNsa4
	HypxNh6ifbwOoYO8sqovBqeIk7iDRJ4dX6DCBzoYMHFhza3fMImeZJEvJPAc3fHvTGNzAoNAuWl
	UnPUYgM34PY5LimgsKeU8A/rwB3g8kTq9p9GyHodXC838Ysa+irdERHezfKsLoOeuPSDj6s7hJl
	xpm6S0MHtBEAQDfirasY5yBIb2OHqQRSfzDoEaDURK+zTLm5wOkdrhxbtBuAMZBASGSHpO4TWw=
	=
X-Received: by 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a18e4a3bfbmr435955355e9.8.1792103269119;
        Thu, 15 Oct 2026 15:27:49 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ac19c9sm5917375e9.0.2026.10.15.15.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:27:48 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: add blank lines after struct definitions in gbphy.h
Date: Thu, 15 Oct 2026 23:27:35 +0100
Message-ID: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines between the structure definitions and the
to_gbphy_dev() and to_gbphy_driver() macros to improve
readability. This fixes the following checkpatch warning:

CHECK: Please use a blank line after function/struct/union/enum
declarations

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..1de510499480 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,6 +15,7 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
+
 #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
@@ -43,6 +44,7 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
+
 #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
-- 
2.43.0


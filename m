Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1326B2B0
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 06:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126090; cv=none; b=fvo2Pa7cSGn4cAE4QkSRgkBKv+Y8uLVHFpSW1Zuirsh4v3/dFa92amOMs+Stf0dMe/+XKTEDht5fJVbDmm39of24TLKzbFN/y+ssFkaddviT9EJgg0JaXSy9KQOnDFxQrHTaATXa+ZdxKw7QLdE5t5Yvowpy47Nn1c34hd3HNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126090; c=relaxed/simple;
	bh=eMH9OJwW1Lk4d4WmnzK9SPA2xJk5jWHytNXgqWZ+4NE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gko8NdkIrD0cxPD5ue3rPqLLDLPVql3HiP0SHGhghpkW2ASKgCJdlyiCGp3DnXV2OZ1YCNgPTVst1zxigTr5cIgRx7qIteE9BqXHOCXurvobmwk+CAykWjNRQ43ltunlN4qm8wImBv+PEXwlsWTqOEOCnhvn/IORyXxw4TJIsXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYL4dWt3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYL4dWt3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aab7623f42so1779375b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 22:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766126087; x=1766730887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7657guHeHfLXEvJtjW0NmVnRc5WwLAFCPhWTi2eLXqw=;
        b=UYL4dWt3aSotkShkGAHUrpmrtoaARSBkrX2tQbLEGnQFoImdOM0pL+WcisW7uTG48A
         cPrqJMCLfFAM/mdka0Vd10bpEFIXYyZE7eeMDKt2mecQbki3LhS1VqFon4b8AHCrhGiF
         9UZJMzsIxu8bHzioPaDdthmfFOoSCYFwpSYXWHsW+bz6yiB3fg//H05Abc4msouu4bJq
         O1EFcho9XAO5jQanlENU5Wts6ZSq4PjB0fnNYdqFBcG47b9JnJUuS3nTFcz5lnSv7Sza
         Up/JnhgSJs7tfHPueyHkff/DBkMAstE77HOZB3Ln8YLivvzmoWu+D7ds8PilEzkwoO7a
         PfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766126087; x=1766730887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7657guHeHfLXEvJtjW0NmVnRc5WwLAFCPhWTi2eLXqw=;
        b=pzsiD4VmVckG95EyK48oilkD2olHzFJi4cAp/zDbJABUqFNfkQYliaVDWymWD3i64+
         c75uE2cKbr6ZttXhVnIBxYhJkj18MjerXDDtEhl7YTqHYkhr6Az1MAfkhFupsiMO0sJ7
         h2z978Z958gIF4PcKIueqRQ41Sd1I4tapDjC/5uz4OUmIE/52yZHxRnCmkVGNVfflf1a
         P7BYS7Ov4H7D82Zb1SuJzwZVASGuq/0Cq6uDT9vRGqFP8cOi9KPleQv2ndzL1HjLxW2m
         1uLsXUdXsiL3hknVkqdwOPUkbFZK8SLr+z62peuxjRHdPEC0v8NUfkHWEPVtO7Af5rQW
         RIqA==
X-Gm-Message-State: AOJu0YxxU6RZuSEC/8gXOe7Um7eHWupXQJfRk/wEB4f0frzL9pKyeKU9
	whGErBCmtiGPdKx315JmAmLtcjlxiv5qAez6loVJlq0I9iolckiS2kIfu5mlJg==
X-Gm-Gg: AY/fxX4jtpJcMSQYS7o/AOQACzlH3vUQOy1REO7zASdTdAqRwAyY4AzdCVEA5MYEb7c
	bV3xliaRUDJ0jJGFBULE18uN6Ff4NmsNHxzvsa+QqpE8a0NlTtkp5iCaVdduh7SsP9wRPYKBEVF
	pLpF/B1cZsWFRkKqOh88PndSMmAp0HHE/0EsBgLyiT2RBdVwjKacGF97S3x9gIy6oPYzwZxgINo
	h/w3rkgbcyxlyzMKpY+VFe7smk/DO9sBoKxb9nkVGkD6icBdwU/a2siRpwYY+2WyJeT0TBwhSDP
	hEmc29pqkvrGT/jmWYfqDWPgsNW2JSF0vl/KUxnzN5F7dd0VnYMP9jAuSYxqHp/4wJhL7b5sOQS
	6c6R8x4avjmde6I+W6mZZOynKdzDrv0uL9U1eG/MSNXuB8IRZxbQrEygbsY4WSGAIBhQk0jemIE
	/bKsYUwft/cpz8wNLQp+5n
X-Google-Smtp-Source: AGHT+IHO/8HITyB7jWMWeTqiaZNdmpZLYK7M4NscE7/Hl28qgeVuzsEnSqzo6SFdI8p+0/Yr3+WCFw==
X-Received: by 2002:a05:6a00:6c94:b0:7aa:d1d4:bb68 with SMTP id d2e1a72fcca58-7ff648ee293mr1696121b3a.20.1766126086604;
        Thu, 18 Dec 2025 22:34:46 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843a18sm1282071b3a.14.2025.12.18.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:34:46 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 3/4] staging: greybus: gb-camera: use BIT() macro and fix formatting
Date: Fri, 19 Dec 2025 14:34:14 +0800
Message-ID: <20251219063415.46818-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace `(1 << 0)` with the `BIT(0)` macro for input/output flags
to follow Linux kernel style.

Also adjust the indentation of gb_camera_ops->configure_streams
parameters to match kernel coding style.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/gb-camera.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/gb-camera.h b/drivers/staging/greybus/gb-camera.h
index 3e09147435a5..d5a33a13f2a4 100644
--- a/drivers/staging/greybus/gb-camera.h
+++ b/drivers/staging/greybus/gb-camera.h
@@ -10,9 +10,9 @@
 #include <linux/v4l2-mediabus.h>
 
 /* Input flags need to be set from the caller */
-#define GB_CAMERA_IN_FLAG_TEST		(1 << 0)
+#define GB_CAMERA_IN_FLAG_TEST		BIT(0)
 /* Output flags returned */
-#define GB_CAMERA_OUT_FLAG_ADJUSTED	(1 << 0)
+#define GB_CAMERA_OUT_FLAG_ADJUSTED	BIT(0)
 
 /**
  * struct gb_camera_stream - Represents greybus camera stream.
@@ -89,8 +89,9 @@ struct gb_camera_csi_params {
 struct gb_camera_ops {
 	ssize_t (*capabilities)(void *priv, char *buf, size_t len);
 	int (*configure_streams)(void *priv, unsigned int *nstreams,
-			unsigned int *flags, struct gb_camera_stream *streams,
-			struct gb_camera_csi_params *csi_params);
+				 unsigned int *flags,
+				 struct gb_camera_stream *streams,
+				 struct gb_camera_csi_params *csi_params);
 	int (*capture)(void *priv, u32 request_id,
 		       unsigned int streams, unsigned int num_frames,
 		       size_t settings_size, const void *settings);
-- 
2.43.0


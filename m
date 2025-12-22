Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABEB32572F
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417090; cv=none; b=BGGjs9HS1L1rYTH9fcV6FugInUJaYGBQds/f6g+NGxJOMk2qgMKjGKAexqkKD8IcE+arQhucHnyPBkbDVVt396F7iKTKvTWbo2sq+AmYs1L8NzD+3fp0sEEPM/cq2XfRkoGYV3In6lMtEDJDqRU71clkGfiY5o7gRzt8wA3pE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417090; c=relaxed/simple;
	bh=O3bvYF8Cu+2KyZ+xsWomBvbypzhojHTCesUViVP/mX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kiM+DbH4h1EMij7R4UMOn/6TRTz3xy1N8VrUEO2kG5+xmy/1Svd+mp/TyKjK314hjZHTnHt6j20adJrEUtct6Kz81pGYvmlM8QsXPrYY5/EsJjBsh4Xb7HpMtaXUFsRHZxKYcc0FDHA3BIo0isSQBrqutsdWN8p7E8lEgl7XTq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO4pE2bW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO4pE2bW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so3177507b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417087; x=1767021887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEw0HhEC2FU8j5Q1jim4n7tU0qxbPYmbSD7ZkRKm7vQ=;
        b=RO4pE2bWHemRi6r6XTQkyr2eBkSEVb8g9g0uL05rCjTqTf7+il7OXrTAIjODs5HAqC
         ltVYtkBGMfnG1peFajXi4YpfqK/qlf7XNAIXVEo7hJux1QNP+/YDOD7CvBduN+HBhnsZ
         NGEOzpav0377CNfRl/MS1dBREb26KlSqqcqyxaBPVYTBx0SMgm18wGfPqhxsro+1P9b2
         6aPdyo22rbrtvAVkiNbd1JkiC0UIe2BmqcCtvqJPHYyu34XgYScMBRdwOxvCN4xocZX0
         z+4H7ZwypyUp5p5DJU+MgVVEzPb3OzHqSPoKUJXxsapZ5NBsuQujuLvtTf2np1xDjbaU
         tnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417087; x=1767021887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEw0HhEC2FU8j5Q1jim4n7tU0qxbPYmbSD7ZkRKm7vQ=;
        b=W8FnxYKnjOKAsuAT4TtYAVcZh0UmPpxvT+nIcty2rcgvOilVui7kCKlxlMFGSlOjOT
         DacZ4M8yY8zBccyzTuLK9T+A/FSc36lrwZmfBK8ErdfrJgP7QTsVX7g8OHJi2FyQGH22
         bjFW/EHVCedGgYtyaWpaZCNrFD+c0pEJ7tRJ6jkYxiW9NtjyfWJWKrrS2hxEjRJwra4s
         LGjBsuUhhFWabkAKK2bSwagScQEu6c2xQYiay58FXj4QIAp6t54BdBIwdm7xmJUPeGR1
         te0SS900cKf/3leKEWJwS0E5QpV32uowVSF/h11fAayHRCcEIB7okDHxD9ttW4Ia37pJ
         LBCQ==
X-Gm-Message-State: AOJu0Yw+TVDxCsoRaHWv6G73vTW7kzXiRRR0UxasrkMrOclr9H/aGYpR
	swN/e7UjIkLOIDCq1eecIewNXDSQPVTWkq//YTup6+7mxVnuXbB8ZvfXiPpRPA==
X-Gm-Gg: AY/fxX4PAlQbOt9u1AHByJRHbTN8x1PHLCmXGO8mkczECV473XE8vHYOzgq0yL0dwDy
	tF8lYO9BObPMr0q+edRSlruk8nfBZJH/vbQyTUXseiBg5Kq5G+q8csZv/bO1qjFlLvb5XgnqP4v
	f7qqh7sXWjojoON+8jW0zFPrYw5OEbT9mmY2kg4xxNzbM/DBDR1ECF7OJ/L7A74FqQXYryRXCCa
	R8+tdwnRqbRJ6xEDHLAPj8jvLEC9XnKsNMlboB6Mr68X5DcfDeLdb/GKPYQP+5xYyd9IgL0zG2k
	/9vemaYuQu231E6MydRyULxdMKpiZCtW9ZWIu+Ayyw6j12h2/tbYm9qCk5z9OgGo2EoMzFrn5wO
	F/8koXOmgFyFVl9qc6DgcU4FBW/9ThqKYRpHdfFZ3PTK2GunyJXVoyqJmFencCtLtA6Hfh1D97u
	XD88tzBZodS6TpnakA9t8inJEd8apmrs1PBNo=
X-Google-Smtp-Source: AGHT+IFV7HzmxA6HVB4+TJiYXZSDwRicTd1X0heo2G2hdIXRGCAGn0HajJKNaoGvWZ0o3kXr8frU2g==
X-Received: by 2002:a05:6a21:6daa:b0:343:72ff:af80 with SMTP id adf61e73a8af0-376a9acca7emr11717619637.58.1766417086592;
        Mon, 22 Dec 2025 07:24:46 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e039sm9620925a12.7.2025.12.22.07.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:24:45 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v2 1/2] staging: greybus: gb-camera: use BIT() macro for flags
Date: Mon, 22 Dec 2025 23:24:30 +0800
Message-ID: <20251222152432.68555-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222152432.68555-1-zhanxusheng@xiaomi.com>
References: <20251222152432.68555-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace (1 << 0) with the BIT(0) macro for input/output flags
to follow Linux kernel coding style.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/gb-camera.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gb-camera.h b/drivers/staging/greybus/gb-camera.h
index 3e09147435a5..3e3e879120de 100644
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
-- 
2.43.0


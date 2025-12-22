Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75026320A2E
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 15:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417093; cv=none; b=Ui2njSZ9kbeaseKoWVm8qcXSUkgGsQabPzLXYHVIDR8/sPQpo5W+EWHQmp7kdopr7tcxN390SyB1SGkPlzRAAZDe184Ht7p6QxaKCd9BNcusxAAlgnSiEfUWmePKqgc4OmYDToPqj1CcQ9GJvDGkBgmyTNb6GZhoPGi30MNOF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417093; c=relaxed/simple;
	bh=WYa51JwJoiMHUfH+7MZtkt3qPn7jb254zWmmoiSBTag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N27Ikt6PbGkH1oMd7dqdYBPCkQZcGG+fqKlBBtDtgw6QeEHC/ftd4fUQsu1aCuEU191zFyFegEG0iEuLrgVRcuhw+3XPNvbgXguIfPIBHdUxdzvt0UgfjrTuEeiHbZW6VTsEemulpJ3C0ol3gvRlvv6N5Gpw9rEhkyHPnqX8xFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU+565jK; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU+565jK"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso5684121b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 07:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417090; x=1767021890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXE9yinVZbkuatJLzOZ4zvwdF2gCBD5ECJDUQDwuwOE=;
        b=VU+565jKe2MLONxXXSfmAjtk1eEpCUk0FuVy8YuwWZbqaz56zaPOOHwxgEcGNdg1mg
         GwjhZRgZ73SaT/Uy2untaWmU5a87jjHI3eSvc/8QpcYEcx0Ho8g1K4uVfjIYcwNaUDqY
         cF/IwIQnwwZpFIxIdMUuMZsJIUWKeWHYWw7bx+4AvrVR7EAOLp2aqmL6y64AZol6qu4E
         xw5gtnbKE7ZY6TpzgLAbN+Ddn2Y1Z5b9ZL2SFFyWM2OzPggjJQGVsLPJSyX+rlOu30Jw
         C+eNmZewyI5MPHVHCLr9jQBNVlT6a+oqJ0OOcGO6NYVbb39hy7Znthn06ca8to4x7mon
         rrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417090; x=1767021890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YXE9yinVZbkuatJLzOZ4zvwdF2gCBD5ECJDUQDwuwOE=;
        b=ANalFJZl+tIhHuPHNDOo16esYYzOFNjtP/OzWNIYsjcEz+mHHz8uvcvG1nWafYZQXT
         B0HnQpb4uYUA0TtuoCQKmnpm4zcdjNeR8+uWH2fs0/QWAHE/91PnMzK/wLMcnnXGHFlI
         ovJLu8E1Fl1gJ0wrEKSUtlkwF+ynlQ8TR32dppCJS3XswiUgnOCkadmRjXlXFowcUXYU
         owvGf8mmhAjEaGNN6o65WI+Wmh/ma9zN2+SuuCgUp9HOPTx+qhabqqInxs/1y6mqX/WM
         tRj23NP6ZXhbYFSMjUKAqSF3RXh5GSDJ5+4LHHyi+vswIgPMZKnKhLiYMaxpd9hs2Be8
         HxWw==
X-Gm-Message-State: AOJu0Ywy7xcWE8X6WsfMkh2b7lh+9GglcdfWD0cgInO5aq1vWkIRqsqh
	8p6X3V53kuii5UcND52NX+xhbJ8xj+xwlxiuZSe2GL36u8E5WEes4IlZ4qPetw==
X-Gm-Gg: AY/fxX4P5gl2y2tV4wvIt/y4HXZuXZ21Ugzj3ioUwmMZVvOwPc+6nASCUR/psqJjSrM
	qCGHGp+002AK8pTIfbphHP44RLD+C9oz2XEZDq4lm3rVRfn238gaFA1Giw6GLu/aWNkU8TF3iDF
	uXJXM4PrwkNKow8kIFida81pqp4bqijzF1ZErbfKYmhBouKL2m3RwN0c+1z9twW0iCZWUJSCzOL
	0EbAYDbcvGEy8uHacActOnxg920/QCGXP4mHmI401Q8qKMB2dtmoWhO8NMFyPb9ynQM0WoEOD1+
	UOM6MxDR20a7ZlDQQ2aq3xjlMyh2PRDjac/I6EiusRYvXyX6y3E69KUqQCmG+V5S6i6Cf946eBe
	XqlIpKh8ixlXZ232XscZRxEs7RB0HtFAmTbvp+CgF8WGQ2Ltg916UGwbLD/VFboXmj3FTjrsgCc
	qU6KiZOJEsEM9MwhUlc4++uSeurwiOuUUf6DU=
X-Google-Smtp-Source: AGHT+IGclw16wJXJWeDNlQ21ggORbFAAPFrcbc8LR45AKzBDSZfREZXTcLc0sN21liwkobdMsDFsZw==
X-Received: by 2002:a05:6a20:9151:b0:366:14ac:e1ed with SMTP id adf61e73a8af0-376aa0e3d8amr10909215637.63.1766417089920;
        Mon, 22 Dec 2025 07:24:49 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961e039sm9620925a12.7.2025.12.22.07.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:24:49 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v2 2/2] staging: greybus: gb-camera: fix configure_streams indentation
Date: Mon, 22 Dec 2025 23:24:31 +0800
Message-ID: <20251222152432.68555-3-zhanxusheng@xiaomi.com>
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

Adjust the indentation of gb_camera_ops->configure_streams
parameters to match kernel coding style.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/gb-camera.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gb-camera.h b/drivers/staging/greybus/gb-camera.h
index 3e3e879120de..d5a33a13f2a4 100644
--- a/drivers/staging/greybus/gb-camera.h
+++ b/drivers/staging/greybus/gb-camera.h
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


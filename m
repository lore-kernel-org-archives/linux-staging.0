Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275D3101C2
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244491; cv=none; b=hcwUNggR/5KZp8gn/Ntzk56jdLGvWFyzY60HRn04oAM5xyxE6WV4vaarjRDgmYAIDXbl+kXJRRL+ShUmkHiR+DWmun7UtHafsRbJWQ7BpuW6NE2kvn2QjA4jlEGGRsuicsulwJvB2V4GbELm02E9z8pnJw+kKW00E7shcjjSO3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244491; c=relaxed/simple;
	bh=bkm0dOJgL8gmuag24MqBvcBsLHUFgvEsv+0tyaqpwo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ETIhsgdUYTP0MwUulXpTNW3fQyISYHAYdaCNNnXRbkdNqGHwFOcL7UujZQ0CXkHk67Jofrq6qQirGcnrNb2izk2640R9OV2LaOQgy7ALcKtPnjhSoLyLVzu5h98RNdDkufFe2dBdQsJClF1SheYQjvxhgQKHCQpmaRHV4kQ6r9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVRfQveX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVRfQveX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f416c0473so1591785b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768244490; x=1768849290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUMaw/dph/dW4TTrdxBwQWjJ+AsPkB6Ge1GrbWURqKo=;
        b=DVRfQveX1YW717o5dVzPljAsE1l40ahreaDGtKRS9yL7ULM6HoHO6Wj8OT3tAERNga
         DEfg5BS4H/0jQSy2DPNVV1+Uf8M43ZnTgS4EvtSa8MSaRLyzZM1Kf5UJHkYPM3sSiDyB
         UlDbfCY1rgx+UV4lpPYRPjvW2kAzwcLn7qPilocwc2vYRc9flNDi0K/gpYnFEfbKelOK
         eBKcJq06vLTtxi+u+KeSuNs4jyyH71IbczCrhCM7wcf4yI81ZC7cZHgEANuvzd9WvF74
         XyFa6luBqshlmV1sQAZyyAwMz1nJ9ctVrkGi2rYq8MOH3fpkBEgyRLJBn9yc+M/LBklN
         pRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244490; x=1768849290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUMaw/dph/dW4TTrdxBwQWjJ+AsPkB6Ge1GrbWURqKo=;
        b=vmBmL/lQvSrILLlXnKrifzvEu7noG178wR83/04qxh4FKI6CKzWig2zyYO0lSAUQvb
         tkYxuO0e9OcHhg62VZs6RZK9ek6iOpyCHaY4frtHQ3BqjjTMkFuvZkBYusWPUwPDqe7C
         MEat0E/+cMmKD8ULCLb7tu5cTYzVjCzflnpWpQmdVj9tHzxP8JHGo0SLpmSFxGgwIs0a
         BWadBRiVLa1b0RQDIf4MNFa5vG4rE6m06qCRmTeR3W4r5yGxzY4vtJOel4QF4d1JvQKP
         pmWcHhl1ILVi65UtGHJFcVaNBHUTchyj+yOrfeM8F9m09MFAfXu+ZV8Yl6rud/kdcmJS
         K/sg==
X-Forwarded-Encrypted: i=1; AJvYcCVPXoNk5hD9Pt7xZDVmmHReeW2zW5aGKgz0+YNMayMeeIik3DD4nuJLpYcIXCnPTzhbvIEm4+zrkcMop5nu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6geYMhzxZnaffKjK3Cn8lTyFon1EPckaxgR3nTdyI8mbbghJD
	Jjc5bWShGbLl2Aq/QwQq1hI/2R57aHAW3Lw0PR22eZ3qr/cXuuWGKdgU
X-Gm-Gg: AY/fxX4EXR1D9kS5Ef6VqNEjVWFDqemxVpNbmalD8gwjlMTHCfscv/ys/pNHA2lf/CW
	L2qE6gpVfQu4EEYU3nuPjm4nFJQHHiE+efqFNN1dI7hwwdRdFL9Y+9RrqwIPwZ1YLD5h2d7Sder
	4CUT8NwbeM/+KqL6ic/MnlypKHrxBKE53Bp911k+Vnc1EzM/HwNlt/OilVx3dvvBnkzxK09NQCa
	IIkcjjd/B2Zh3Q8mlbZElnDe4Cr3maexKlbMGf6Wi2YtTn5wXkJ31cf1iihgzMLRYJ8hxbicQ8J
	NXSXS8nj5hDdT7MY17ToIoEqddK/twZemy8lHF46IAqwJwqfvrBJjLPCZ43aYk9fiH3dusG4XYS
	sYmPY+AdNPuR2JhLRdB1ml81hHS+ozZRT15IgcAJX3aUwU1bybhbH1HKU3vJTZpM5MRhS4oo8J8
	ijIFwp1bDs/oVY+/+vuDAUAqWI/FY0PI4jgL8jjDLNGQ==
X-Google-Smtp-Source: AGHT+IEymeO6/t7nAwwrBWvbeV1YQ13aBa9Q+VA8QAC0uiGshEP7LT2ithDNR03j+4ovta5dv0rq9Q==
X-Received: by 2002:a05:6a20:2452:b0:366:14b0:1a30 with SMTP id adf61e73a8af0-3898f9c74b0mr18366795637.62.1768244489567;
        Mon, 12 Jan 2026 11:01:29 -0800 (PST)
Received: from LAPTOP-PJU7MKF4.lan.iiitm.ac.in ([117.250.157.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c54972a5e67sm11164366a12.35.2026.01.12.11.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:01:29 -0800 (PST)
From: Anubhav Kokane <dev.anubhavk@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anubhav Kokane <dev.anubhavk@gmail.com>
Subject: [PATCH] staging: media: atomisp: refactor sizeof(struct type) to sizeof(*ptr)
Date: Mon, 12 Jan 2026 19:00:53 +0000
Message-ID: <20260112190054.9828-1-dev.anubhavk@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the variable name in sizeof() operator instead of the struct type.
This prevents errors if the type of the variable is changed in future.

This fixes checkpatch checks:
"CHECK: Prefer kzalloc(sizeof(*ptr)...) over
kzalloc(sizeof(struct type)...)"

Signed-off-by: Anubhav Kokane <dev.anubhavk@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..60f705fac3c7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -696,7 +696,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
 		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
 			if (!s3a_buf)
 				goto error;
 
@@ -715,7 +715,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
 		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
 			if (!dis_buf)
 				goto error;
 			if (atomisp_css_allocate_stat_buffers(
@@ -737,7 +737,7 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
 			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
+				md_buf = kzalloc(sizeof(*md_buf),
 						 GFP_KERNEL);
 				if (!md_buf)
 					goto error;
-- 
2.43.0


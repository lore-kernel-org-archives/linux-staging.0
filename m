Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF420B7EE;
	Thu, 17 Jul 2025 01:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752715847; cv=none; b=evfCTok3QksfLqVC81rHm7eASUQonrxl/OdbWgQLLE7LN2S6CzglSyxoON14ggBBvc/oMqoH+QfPJOnbu/XFZULv47p8OPwf/36Or2ylBVmm5rcZ2w11PGtb/oWwO5C3jUBL3kxiNMEStSgvyJG3xxPi9qbwvqv3hxVnVrNIqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752715847; c=relaxed/simple;
	bh=t51vLpvwGCji3WfHfop/1c3FGfyG9mabn/HIMUh4ovQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIDG3eB3F+7m6h5yIspOSWG01pS9wKoifQEbK1fvPaa4q9ZAj9cRqZ9SjM4mFT+VJDOksfpAaHQBuI72scX5ndhQO5Wm9XL1FjFYHYvvMHrRwlTp/cavt9ntKz2MUc1UdJh9NQxYf9MOXxLYhya0teR0a/Kz/l9K7jcA7DQND1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZLLemW0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZLLemW0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso61196f8f.1;
        Wed, 16 Jul 2025 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715844; x=1753320644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+kklIjjiVUrQ0AXButuBYND4S6p/85t9mFfj0+LcY4=;
        b=LZLLemW0hEDZfnkux0HWFW/BcFtqFXqSSWVm+EqP1VC3YQ8i9bGKGqc/U36ZpF/a3t
         xeIqAY+KRTLAVzDHMHsgqPEIx4y0qgErcXF5Sf3828NhaCaoFwiQ4Iens9eJ4gSFcawu
         WoRTCbVba4raCvYG8aC3GmlYq2e+F84l3YeGQlGtT7k5fWti31m4MrIZKkvotwiBfuSz
         U+U/aF+20+OgxR6q4q/2A8LIxLQoSBnU/X+W+Z/DfbwhIQLOmXo92B0a25BHZwLaMQXt
         ahLIMFsENoQzX2ieDaDXnmhTRGv2zCjULRiZkBqZS7R2OuySlfRQ0cZD/0EYafrvL5Xw
         R+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715844; x=1753320644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+kklIjjiVUrQ0AXButuBYND4S6p/85t9mFfj0+LcY4=;
        b=G9mhRwa0/ossZLHuO1hGXIXWERULART1FQLz7vaZu0aGI13MBCu3SxYaS2B57EiqhP
         ZVoTPgMQP1YzYb3jT1ERsftbvuA+U1rmccwGDfwVlm7fHRIw28DRKmFjokBryS3yzMUh
         9DbkHBh4iPCO1IDoyaDOUTS5TjGDbzdfoXrtM7XAT8sNpKcCnBiWc7UU0sp2W0g7329E
         p6UhWI8/C8TiC4ALOJCJGGrfJHgXisRR3VP/oNZaTNiwkVB7o7MfPlSt81f5ghQgiaCO
         vXn0HU/P7oCNhAiAD7pq7Os4OINy8epwIf1FYJy6VooWhUjXLI3sIOofacOo6kPAYQY7
         9SLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5r5X13W5bTEZAVFhQU1r3m3/pAGSg+PS3QDpBMCnajy26Tdnj8YNwHRt0vmA1CLVB4n8S2F/2gaccefTdrg==@lists.linux.dev, AJvYcCXKmLjbq3huKRVzrFKtFbCZsqQbvnG7o+teA8fnl0uE3DH5f1ttDXLZIAu0dGa72sMLoHCbPp7Kq/gOgG1k4tUF2pnN6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWa9NHsxERrCZhSJ0Z9JIFG5mnBlPI7eiBcwNm1QnupfRDh3tu
	uByKDGfYwieLV4I2iQFUgHGAPkDLJVPfQCjgb3W+FtrrVyW3NvCCQJ2W
X-Gm-Gg: ASbGncvVfTd9Y5Y3jfKOk5IhYc28LWxA6XIQKTZjBygAwQ0VOpn/47zlFv4sq5Ont8O
	Nqipiw6DtZp+fslo6pMg2ILj0791ffVW2w+SDDk6D6sZ1EaPKwX/yPfeO5IQVVRALaCLVXDT6j1
	hFglc9SfNJMvYAFpK2mHc5m9w4cQK4p+AsQfDCR4TB753f2f/IcGRjVmtKh3EL4mRXHmBHfwVRv
	SGr8D7KLLWnk7Xsxl/nqiCiAo4rVsRs+kzEpfaI6GZOBU/nWh99Aa08zZYIhG5lEPM1NBnCEDVy
	ELrXa11+hT+5QQVfPVuRO/7a9pfY1DAG2ZCdcn3D893sUzhzpvcM7bX+H0+/q8F+4ZfsnCbuck0
	H6CQRzS1pKzu7dHkRcvlriW3G+OMDUb1KfcBkLDX63hOay7Nu/sDfGKHtZFec
X-Google-Smtp-Source: AGHT+IGuAQHAVt+Ejfc6IMxLjZrv3iHwTroSL4krgJeFWI/p8To0LpPVCPV4Mn1dJ4YTjmmAm1Gn9A==
X-Received: by 2002:a05:600c:530f:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-456338a25f4mr8234185e9.7.1752715844013;
        Wed, 16 Jul 2025 18:30:44 -0700 (PDT)
Received: from localhost.localdomain ([154.182.204.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f6bc51sm7204555e9.17.2025.07.16.18.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 18:30:43 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Thu, 17 Jul 2025 04:30:03 +0300
Message-Id: <20250717013003.20936-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function atomisp_set_fmt() modifies shared device state and expects
callers to hold the isp->mutex for synchronization. While most internal
callers correctly lock the mutex before invoking atomisp_set_fmt(), the
V4L2 ioctl handler atomisp_s_fmt_cap() does not.

This results in an unsafe execution path for VIDIOC_S_FMT ioctls
(e.g. via v4l2-ctl), where shared structures such as pipe->pix and
pipe->frame_info may be modified concurrently without proper protection.

- Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().

Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Add Fixes tag
- use cleanup.h micros instead of explicitly calling mutex_lock/unlock

v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry375@gmail.com/
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..d3b8e480065e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -9,6 +9,7 @@
 
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/cleanup.h>
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
@@ -416,8 +417,15 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
+
+	int ret;
 
-	return atomisp_set_fmt(vdev, f);
+	scoped_guard(mutex, &isp->mutex)
+	{
+		ret = atomisp_set_fmt(vdev, f);
+	}
+	return ret;
 }
 
 /*
-- 
2.25.1


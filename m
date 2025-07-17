Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCA62D0C6D;
	Thu, 17 Jul 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756188; cv=none; b=oA2eEw1DjdGVQArxAAmkhyfOboCjKEkZh6ep8yFf3BgSOt9qvHICfkYfv+SjpDTeDRiuJpfRTkPuL0kpnXBIMoOnd+N6X2UIG7u+qpSa+UDYZfXDXxIg1a/sk9VP2tI3QRcMDJfH4ps05/G/rWEPgfGBPAFYNU11ADCaXUW4N7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756188; c=relaxed/simple;
	bh=COcQw/nm6DgVQsv6NohuIht1Jtb3N9YHU6/YJbBS1ck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TV7Vvg884TZM4EKf9uNezZej1NqZnt0gYvowhHbndoHXRvlYJDPXm7bG8rk9KQZ5PALfQEzlPT8Vf9Ydppkv4y7faADjnAYLXcltn8bbscMipOGcpTs7Bvgg4vKIqhZNnBVWQOse8pud0CsiJg+3/RrCFGEgpccAGJS9yFrx3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPisuoKZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPisuoKZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso103013f8f.1;
        Thu, 17 Jul 2025 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752756185; x=1753360985; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d40bmhYnCHJ8YDHvaQ0Txhm8cZhbp1/LzycBNKupukg=;
        b=fPisuoKZwgZFj0vlb1dRmk9HfQUnxUje96w8Zp/P9DMQt6jIiEP3hqFPDgfHBIHp99
         SDC4kR8oauIy3KsFJIZs+oCDH+xL+ubqjNv347xy6G4dk1yW/QNDSwuYIVKQgBRdAUJn
         I3GjvGCwBDQjgrMUEBD/SHFT7GPASDYDp3u8b0tcpQn6QOTzVSZSw7BEuF444pqhx6Jj
         vxV7JGAAT/QlHJXJqITEWSKy0P0nM1lhvVeFcJ7BFw81maCRV0i54Fx0+djcinrkd8Ea
         7Rylwx0ppXG3pwkySNPkHe5N08gKHGGe5Rdihq/P++8Z3xv/kYzhm8S0FBkInZJcKZ1h
         2Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756185; x=1753360985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d40bmhYnCHJ8YDHvaQ0Txhm8cZhbp1/LzycBNKupukg=;
        b=gqgb6OWBD57C1A+vjZn37jokc2lMwZl6cpeJ6+icqT6i8DlMiYoToYgVJ5JYlDaZZF
         sxFXoZPqt5wrzSwm+9oTn3hBJUGymiKasOK1jEVpOPCG7Ch/4b+6/L4OjbV8zUZPWB2V
         eRk2ed73PwtIN3Nb0/nkFQRFrBRQYcp+/Tkx7DTFWzQep8OAGQrfhZispCrdMKmv+Q4T
         qsBwYGSgPm9jfFok47UOT+XkdDlwCp+8573eMG9RsYLWarWFDP3SmPh05UvSh1+Aimrt
         Shrwr89WDFChhN5Z/op+pzXXbZRdvY9yB7llqatXqGHIULCk6wtgPEofhDR2ks78zjPu
         uvpw==
X-Forwarded-Encrypted: i=1; AJvYcCU06vmGpduY62XeMSPBlOlyus1dMvpWAAvRFMVtUDceaIxdPO4ZXZJhgfE256sammttsso17CyMC0SK5rum7w==@lists.linux.dev, AJvYcCVH/WQaJrZJN8POfRcgHv945RHBfXurbLJ4RJRkH93CkSeZ3TKEztoxv9WXgzeYf0C8hztvoA4Y8o1LoPUEJATZdzP+Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDoSSkJ3q+6hhK5VEn/PkH8s9/E/szF49CdfWvUP4UkDLGeAOY
	FMMXwCcRrbCi8LNgzk93vvhcLsPnASdVuFptJin1JPdjHGDMC6ozT0NJ
X-Gm-Gg: ASbGncsYOq1HOn8pzmhIX2xkBrp64XeW5z/qFxiJCzMJxoUkzYAG1osOFLahHGTiPhD
	VAnos20r/GNCncdsgSXkGgKDyHjqKe9yPZ7DpsKl690SwPg/MqchrJz84/kUf3++8e1qHf31T/e
	0r0Hb/pNiXLPYe79lMXzwYfPCzW6v9EASGzpSsk8cDeLPnzTFiqlQTEVMNSWg4qXPwuSJbQJRIM
	GPB65zVoTSzEd3+G5e3qNCGB+Jf60sPIP8XRwMusan9UUjb4Wo1UYVADbbD+XNjewzvw9u5rAvY
	+ygfXW5BohS82e6dHutlFtczoIT8Urb4RGlj4RqpPySvzpwu99ahrFSoUhKQpdqeMX8JTGDJbdh
	5j4pXOrFqOs9La5rS1jzgS1Dp1f/3qfrZBD9hlhlb6v8lqC08IhAUAuaxu0Vt
X-Google-Smtp-Source: AGHT+IFRlywe4tl9dYYqcWEYvjS6es1ezgBsDewHP6wfjpW6IO7HrqdyJCKLgzPhHOHXTcX8BEw3wA==
X-Received: by 2002:a05:6000:18ab:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3b60dd4a802mr2670732f8f.1.1752756184266;
        Thu, 17 Jul 2025 05:43:04 -0700 (PDT)
Received: from localhost.localdomain ([154.182.204.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc3a62sm20506454f8f.40.2025.07.17.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:43:03 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: add missing mutex lock in atomisp_s_fmt_cap
Date: Thu, 17 Jul 2025 15:42:34 +0300
Message-Id: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
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
v3:
- Use guard(mutex) as suggested by Dan Carpenter and Andy Shevchenko
- Remove extra blank line after variable declaration
- Fix include order as requested by Andy Shevchenko

v2: https://lore.kernel.org/all/20250717013003.20936-1-abdelrahmanfekry375@gmail.com/
- Add Fixes tag
- use cleanup.h micros instead of explicitly calling mutex_lock/unlock

v1: https://lore.kernel.org/all/20250716014225.15279-1-abdelrahmanfekry375@gmail.com/
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index bb8b2f2213b0..2690c05afff3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2010 Silicon Hive www.siliconhive.com.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
 
@@ -416,7 +417,9 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 			     struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	struct atomisp_device *isp = video_get_drvdata(vdev);
 
+	guard(mutex)(&isp->mutex);
 	return atomisp_set_fmt(vdev, f);
 }
 
-- 
2.25.1


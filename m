Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91B43C044
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380092; cv=none; b=Ns5fMNr0NfFI+Lu/suPH5dSJCCT5FmuP8ESDGHskilhPnS8kzX01kfSTTnJnyHHp/ReqPPybMllBs7AYuJPofatpKLr1V3uy0JgScxOWdfe169CE/z6kg4GEhZKWFzdpn0SaoAlAANBWxgMBsl9oizyda6xOg30F7gaF/Q7t1sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380092; c=relaxed/simple;
	bh=rA2cAH4c08I4eYFoQkXikw8a3RxYr+50vjqp8bqfYW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Up4R72/h06S1krd7uS5ScHYho9Ea22MKh4oL7Rk/s9x0cwPxcW+xUfZTZz8qdGADV5dgv7hihxN/9A/QwnsF4oAPfPKOB8g32DPK/to++VmR4RDkmuZBqs7jYnXRsH7s1jJeNM6A9k2Q3h//isQfqz99w2+RZe68gY53gjoafug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GPG19Wut; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GPG19Wut"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e7d984096so125667931fa.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777380077; x=1777984877; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Ecn+W4C+vrdzWaq80Gi8dRi3bDDZ2ohPuSpOytRko=;
        b=GPG19WutWaBy4JX/Uw5L0S1YrJm3a2FXwHOY5P5GNqbvGpa1Uh+kExD45DVrm8eZL3
         rqEPAlbcz+zKR6/14dsJgCFO58CUdUEg7NIGLbh55rbcyAoDo3n+H7puNvBiXk0wiWF/
         QGF3+ex5sn3KRNP8VNGRayfPHQYCNdifB45Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380077; x=1777984877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Ecn+W4C+vrdzWaq80Gi8dRi3bDDZ2ohPuSpOytRko=;
        b=HNanjknoomwGzWOUwQSy2a8d10mXRaBiM/XwdjZcTYp5atrmQmLT3jHAzCaUgLO4Ra
         uYXo/ZxfMxXziiwrmtr33xbZGDPW4U7+Z7UhY6n9ixLtrjz1eluLWZEQzopWa6NAZ7Pf
         Tb1MR2/b2CumB2VT4vXZ2Ag2yCbaoH/l4qCr901otTXpqF0AplODHvgRswXEqPEkwoiP
         3EdxDiUYXKd9CBZ4kbTAvaKBzcRXUrSEx5Rxj7EnxfmSsnc7rhnAqhJG0KplskienGFz
         gDTxY0dq2uZuA14O4j2hTz9X1GYFgEt3qDZBcuJW9zYfMh8UdcCvB6k8fZijbKJO8AnI
         MXcw==
X-Forwarded-Encrypted: i=1; AFNElJ8HqdjbTPUK7yal32owDBFXV8HCdakPoJ+Y416tQhUjCQfL322B274yzEYzxxgdwudRpbmbtCWFYtcQMRE9@lists.linux.dev
X-Gm-Message-State: AOJu0YywlVjaS8xLAxXR9CBIUNMDO/uSWKs8/f9sliXWIfzd6p12WWsQ
	xwj4UmLq/C1b5a4nkLWfi7lyj7A8XH9VtzrpGjnLwuTCcCyglsBVWY8Ko+k2FFK2h+FaK9gf+gD
	xSvHwfJx5
X-Gm-Gg: AeBDiev5iVUUQlN6IrkeqsVx9MpYbF7pzN9K1tDUJhKmgUjBEy+gJg6H3/urGdocSke
	Tf8G7m4cSfKnnPDZg8bzkucvUIIuYZHSI0S0YxWglr//KRHdAm2HFE8VAtwAOarU24BIzzCjHih
	1jWz953rC80l5CgEgqUhSa9Dn1GFgUFPAHe5LFaU9V5AXP7oDGTlaK0xUVMUILY1od1ojMRXYBK
	na031e5vnSlpI+V6Rh59dKHTpjgh+NudHZUH1QQKhrCVmE683YSFTAA+E0t2Xof/ljvbAiVZYxD
	2jfLRfZ+uS+pN0vD31TqkPl7MpFZ6OuaucbFowCsFRJq5s5H7UHyvThCdVW3iEM9bsI/vByHAQR
	6HiBDsCx4jMYgbPRWtXdBICFiaSMepfum6VjHQgzfTTnZUk+vXlHst7vQSWJUIP+5vGVuo+e0sD
	eySfxu+Rvo8qAKC7ruGo6vZKHmhZa3H6kPf4l9JsyTSEMlHEtkcOCWgnndmPTKLOk/X/nPhrkOD
	E8ldolTqn7cHX/fWg==
X-Received: by 2002:a05:6512:6c5:b0:5a4:ce9:11e with SMTP id 2adb3069b0e04-5a74662c3e8mr1235184e87.32.1777380077397;
        Tue, 28 Apr 2026 05:41:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a7463f5fb5sm594617e87.38.2026.04.28.05.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:41:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 28 Apr 2026 12:41:07 +0000
Subject: [PATCH 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-smatch-7-1-v1-1-46890dffb611@chromium.org>
References: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
In-Reply-To: <20260428-smatch-7-1-v1-0-46890dffb611@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code.

This check also fixes the following smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..a731ffdb91ee 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,12 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		pr_err("invalid minor. Check ranges.\n");
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.545.g6539524ca2-goog


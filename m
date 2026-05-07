Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7933D6ED
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187495; cv=none; b=LQ1GDQZHlDRRTlD1bm3i5PYNeaovT1rMYiFY68nLKLnDCNLMu1DvN45seXvcREtd/AjyY/wE6V6ZmkOv9wWjWILXq9Dwgq4ebQZxJskE50kC2uBFfHjAReM9VTY3ZPSgdqrsOffalthpMIOpP7FMjsYlY8bzWVLn6uweTVB40hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187495; c=relaxed/simple;
	bh=o1JBoNSnmeENnVyJCFBJK54WhchLIrjvMvIxsKS/SXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eSLPPrckQHIoiD0h50osbEsT9asf6L/GvpnysfH3LbGoJ1efnU3K5Zz8MVUSWSN/mIItWNG4x0n96k5rmTNpwBerEyKFTi1ZLZvJ+FB3NuKDzujAt3bZrkBQBWPqyay3brGhsBKNdf0KiRjwnhNuoi3c7GGYU2N0wP0KdhyGsBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RNxP/B6b; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RNxP/B6b"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-393a49d2e5eso11223101fa.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 13:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187492; x=1778792292; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cK+Nktca7F+6iN68JEbLhEZKpbc6Uv2OrCKSJ0NIVg8=;
        b=RNxP/B6bsKSX4uWNXqju3gLgw6CTrIyrsKFFjVXMf5wgmU1FFvz9HIOPMyIAOvcWAh
         Zi9Q0qRZH4WwgdfWAbjL5U5o4ToYtCf6iDgo0g4FNClqeDX6gHs2XU4oPDEfQpPg+Zsc
         wX/hovQYitOLSFp/xCOb3hBT+alka6LLiP7TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187492; x=1778792292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cK+Nktca7F+6iN68JEbLhEZKpbc6Uv2OrCKSJ0NIVg8=;
        b=Cv3mnMezBuJUELDa4OEPar5QFrxOvBK9/eJo4h+dMzbvNgBMk+u8c7nbDYE6CkvAqd
         DBnCSic/Py8d0AhvNVKq+zPtWIc9CIY1rbrEww14W3StbtDEStZTmnJz+k899OMkxoJN
         jSYVQXka/VcE6JpjWtL2cKibDKXMDTnqmOWQ4lm14Yigay9uiqGYAZHYr6KXiA4AOzqd
         kaNWZLl2mF/O7mloqvQXet1nQOCpfI3wF64NBxEiDeKiy9WXhgVmfyNoRl+lShb3gZpw
         E+yVOpKfc5dzKToUQRWN7kSzb2UgGXLvxqE8xMN/CoIYF+5d0o43RbNkTQ5lST00x4gg
         CG4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8GJsV/AIGuVuIpanHjfkU+qHyvQQ6jgndoUc/Pww9ckF1nFnWvcBN4afDvRpr3E6lwB07dsHxteb1rIdJF@lists.linux.dev
X-Gm-Message-State: AOJu0YwtN7oKax3kzj9Rs9/8DnYjP6B7US9Xa2d/zhW7VSIg8q3hZBJ8
	oa+ap4ylQvYcQYkQQTS+1VrW6IZjtYg9nMuxVZo2MKoXqwiJHzQSVy03Cp9MHn1+Ig==
X-Gm-Gg: AeBDievoCf61P2qJ30PgdkIMNtNHawLJsZVJyFDc5R4PUYcGoRnjmor+l0KD5l+p7pG
	ukeXxmVqKCky471i6WcZG3/Y/MEFfL6I2tWv9riUsO5aa4M5Ku/iEIHhljo5DWt/03o1HLPT5cc
	x+4Oylzu0ebg2piaEP283Bi3/7b0ALCotznLjR3Y4GNTzBrK2ue2EUfh69ums14+z7MyhIdNgFi
	i2QqaNFqupSTrDCG0i1F1FIHeTy7FXkj5tLTa3msh5Y5naJGvLGgibo5wXp/ZBUukvig/M3HStB
	G/TKEUV/9/8CHMTw/RiHxr3V/a2KRLAvNfZQkIbHNfGUlSyF4cfW1I7ebvpK4lGHtpWXZKk9i90
	qyTo6+OjpHSFiK8Xb5r4rVuFfvBr/A6/iBcCJ9hyeUJVCHFkpjyoKtmrTqte6tCFjeHnLvTZOJo
	LgjSbkzl+wzEQo685LRWMRVhHJ4QaOC0bZhNpYrUsNGA3l5K3Xy7k/QQpsApsxyS8o3e00OovVz
	qNlkU6yY1MEAp/D0Q==
X-Received: by 2002:a2e:a273:0:b0:38c:de21:3e14 with SMTP id 38308e7fff4ca-393c41c97demr25930941fa.19.1778187492474;
        Thu, 07 May 2026 13:58:12 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:10 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:06 +0000
Subject: [PATCH v4 1/6] media: v4l2-dev: Add range check for vdev->minor
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-1-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3

If the fixed minor ranges are not properly set we could end up in a
situation where the calculated minor is invalid. Add a check for this in
the code to make it more robust.

This check also fixes the following false positive smatch warning:

drivers/media/v4l2-core/v4l2-dev.c:1036 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1043 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288
drivers/media/v4l2-core/v4l2-dev.c:1101 __video_register_device() error: buffer overflow 'video_devices' 256 <= 288

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6ce623a1245a..5516b2bbb08f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1032,6 +1032,11 @@ int __video_register_device(struct video_device *vdev,
 	vdev->minor = i + minor_offset;
 	vdev->num = nr;
 
+	if (WARN_ON(vdev->minor >= VIDEO_NUM_DEVICES)) {
+		mutex_unlock(&videodev_lock);
+		return -EINVAL;
+	}
+
 	/* Should not happen since we thought this minor was free */
 	if (WARN_ON(video_devices[vdev->minor])) {
 		mutex_unlock(&videodev_lock);

-- 
2.54.0.563.g4f69b47b94-goog


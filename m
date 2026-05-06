Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1335144D020
	for <linux-staging@lists.linux.dev>; Wed,  6 May 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778071293; cv=none; b=r2Lizk2V6J33Zdn8/5t/uSp2wGfdxCs8NsusOdkQRoPSQElRieg0KhAxssPJJau1cMFLpt2Rh+9lT0D25YaOsaT5NUlO0F9CGCP7wjjnUC/OSAF/cfAcSOoznuiqH3tWSqNqGSFpQYgMXJ0JC9DaiVeYLsg9Q71BnwoNpQZXirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778071293; c=relaxed/simple;
	bh=OinERmBbACIBYleiV1Zs0L/VJbZMb7jzEBvebOjGfjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3IbVyCzBHLLbs5+FYXuz46f8y4wu6uPV/+DGqztOFZggBCfLM2vi2faPMPyT1ujHwCAZR1myxjzQ884UMm7hKH40six6BfkpzDyv9Lf0dIZPlRj0DCbdufQkQ42PkCsn6+dUXUVNINvFWlVkPvpq04JtZFma0mWASATFmxEys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLrXPEN/; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLrXPEN/"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835399c11e0so1672624b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778071290; x=1778676090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=OLrXPEN/9HiBCXoGpuQ9/MDYs/61oeNjnkJpgqpH0sjq+tAXy/Vll4KAwHZfUSPtu6
         I/8pISxkBSxiTEi1l7MInZnr8cgovUW3qGa7VFH8z48ruSKlfECxRd4VybF5dtJRMjT+
         fLPvZ4mVq1UfXfD35aPNQcMNWojLsg525TSlm/bMoe8qFGSC/WxUxSymnz82yROJGq+x
         efqfotXevP1wI+nk/sz8LncA3/LeRU89ZSOPRbSKKtWvCT/VwS34KUK2SktKmvLnAKnG
         /GdbXfzLDYVirpbczzIB2tzGWMZJ8DZF7tSHcj0MWVrmUSFVBClzQ0ZrfqVunJvIrC37
         WSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778071290; x=1778676090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IlqU8VwEU2SI0FZdxgow47FUylG/UcOkwWktFbacV4=;
        b=OablNw+gV8Vx4RmBfEP/VFN9rkwGI1iHa/XU9JiLwJxdvHaWuhvuA46GskMXlH14Rx
         rdf48D4/9DKvZdD1ncRObjcq+o1XCKc3y823YK24LNOD4ym8Hf8BfPFdYEGLkpvSUZfL
         tmasCBXZdJm/VANGmuj3ywKO5cYPF1Q4Mruavf/le2SdA3yczBuHqIXyZxxqLqckutAw
         rbEWQUgToQk84ZXaRakz5TjdrHHJk9NjmeVvfy1XbeJmVQax3YcL1l+TU2vwV2npERfO
         AEfvJBTXSG1x3pwmLDMHdE/VfujkJj9RV5L0c1rHdjnWcIKT97prQhHwf03vgy7mpgEa
         Xf0g==
X-Forwarded-Encrypted: i=1; AFNElJ+vT1WUZVwgZVarUq1W9zOu+2YFcy+NG2vxtb8wJYJM7OEhWZG8IHdGXgZmyrLFBX80wKqaiWWkFNqSF9wH@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeh0lzz4FIx7Y1a4+q3WkHkwOtPdGZWcje0+/F80IqpWO3NJed
	UADKzblMM7Gy6L73LZncVl+6h7FcNGDmTlD3ipm755medxNQ5sZywTo=
X-Gm-Gg: AeBDiesuLYNou9iV1qWNKHHuRgIkKPwR7+5bgGx17S8w3zzmAw/fUrAZ3jV1jtF5zaJ
	TumarBZWkaMWIKoKyDPlaxiJHDmaOT0Hl6Z+PpuWspXwnJoLDNshlpZFC3YlnMd0gqsVsLA78mp
	TxDwN+2Ynfk/+J0tiVMsQ8NPxWdpbf32328WRVdOMj2vpyYZ/vlAvoQUwR5L6x0JDpdoFtByTCB
	vXg4tXtBLEhGL7qLTYqrL/2JCuKNO6SzJyq90ujC2ShURneaozvF69hAzTttMW4/F4DBmi+Z1bl
	J/vn16udOkKEPmyRpam2ZR3hUvSG1AAbK2nrQ9lOeb3BZB3A8eEFRm1IfaD69RDcAf+iP5S5HRP
	7mMvA9boExd1jcQ2CHbo2XPK5dS/q7PHoTPPhqbPzaALNpTFa91nmR5wcqpw/QgJBS/uhnInZlt
	6I+dC3OO1Uwvoo6idhEBLW0wNDBrs95ofSgnHukPphSGJe1xLoI1C+1diw7xcd9OoHENgHtNYkD
	mCH1agTHQ==
X-Received: by 2002:a05:6a00:4193:b0:781:2291:1045 with SMTP id d2e1a72fcca58-83a5b2d34damr3232862b3a.8.1778071290350;
        Wed, 06 May 2026 05:41:30 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7ba9sm5494056b3a.35.2026.05.06.05.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 06 May 2026 05:41:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v3] media: cedrus: clean up media device on probe failure
Date: Wed,  6 May 2026 21:41:16 +0900
Message-ID: <20260506124124.27802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cedrus_probe() initializes the media device before registering the video
device, the media controller, and the media device. If any of those later
steps fails, probe returns without calling media_device_cleanup(), so the
media device internals initialized by media_device_init() are left behind.

Add a media-device cleanup label to the probe unwind path and route video
registration failures through it as well.

Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
Cc: stable@vger.kernel.org
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Rename the media cleanup label to err_media.
- Add Paul's Reviewed-by tag.

Changes in v2:
- Drop the now-unused err_m2m label.

 drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6600245dff..7cb1f110d6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto err_m2m;
+		goto err_media;
 	}
 
 	v4l2_info(&dev->v4l2_dev,
@@ -533,7 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
 err_video:
 	video_unregister_device(&dev->vfd);
-err_m2m:
+err_media:
+	media_device_cleanup(&dev->mdev);
 	v4l2_m2m_release(dev->m2m_dev);
 err_v4l2:
 	v4l2_device_unregister(&dev->v4l2_dev);
-- 
2.47.1

Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50200282F3B
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976367; cv=none; b=k7Q34h1pyOX9jARj6CEofSg9okU4iG4+v7sm+t1/12YFZnHrPe16rBFdf6LDEghSjC89JvBj+XJIYO+n///rXcd9dzMFeEGUf2hQhXlxZPi9TkHEkMVnnVsqkAYFM1wrKIY9lV+QK6KhpaxKGffLpEG3UKBg+Umf6mu+RGcFJSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976367; c=relaxed/simple;
	bh=/lCjwMCwIUN6ufAh37kRzYX8caEh602jwuVmDhShp9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGaoGpKuBjRPORCvjenDVyRbZt0aNAOB/omwYTRlFr1QsoMDQh2oA3uSQKJRMKDJEXCfo2fb1n/UusRhZwJcu/Vm8GPmBPYk7UoOLAUF6Z0hlS1QlCbwz9UnbjoV8T8X4B5JX/Okl/1uod98uRNxVvBOO/rBYq421X4CvxI1fkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsdilNmf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsdilNmf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bd80b3aa13so86206815ad.0
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976365; x=1780581165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=JsdilNmfI+WC8/fFVMk1eSCIn/a4480mNEjChUfsu6wBQbbALXHGHmzzCyKJQ3eCpE
         A7f8ENdjDSzXbeno85UNXLbI/kwZE3aEzNjyI9eagaCUSi+QRvEX9VukxMtxrqp4IXck
         C7C6F6xuECBn7j3xr8dtkICbjhWzIdZ1SAtNzDbiqGChttEQbxAB91Z32EX3bbj4bbli
         F1759Wjt8MKPk2YCQ1ouSzwYDV2+WXaP69eNwYUfeUeno4HsBRkyFDsMGLwOldGNoPKs
         aRjmZ047sioWcfAJq0RnPjJQomCZFZT8w3J66jTVHdYFRQq8b7W3D0lvueyP4Iy8YSKv
         qsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976365; x=1780581165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A71OUHyyRe1M+VCs+XKSSgTKfIfoE57tMLNWnn+zSKk=;
        b=i5WfMgC0OKZMU+d+WZq0jTZ2XWTTduRA3LASCnq2mlrZhr9MC93sb0v98dITt3OQFk
         sPT9tifqqAiooxVuY63wgc7IXDDzLFQoAxtooBBwFkoBazz9oTN1v4Pc6jDlAxJ8Npnz
         N80HqSP2sruc7GW5WhP67tPHSa1FItiHb8tMpcIagA4O34q+fZNtYMlXbiApgaFfyS6z
         x+6Z2C8pvuamTnBBez1Uzd5vGsKicDa71DGBmyeoOSBtOVdyqg10CyQF1vzRAsdjPk/1
         5VxOfvioTXx3YW3rla9Kxql6bi2M5umBBkuMAaaHo2oqNvljk5Hibcousl6F9UvBbPSv
         YmJA==
X-Forwarded-Encrypted: i=1; AFNElJ9QWyXbPQVmr/lPPZdlAtDDDTIHgpBvHI/3TSBPE8s4nyOrsYy8OPeKZAtY4IAGjW+e9/K5lxxX3h6NUafJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzYHjqGHv64zgiL8H7TLnnosQ0Cnrk8cV8PRHC62vZc8LVBlKVs
	plQxCQVtz+kVYXMOg+1wS7HHV6l4vfpdd7UaK9s9HhreHvr7Y6ElUxjP
X-Gm-Gg: Acq92OFxB1LQrDp6Z304fkBPbZCtox4sEvjinweLZk/9qyg5W8WkftrQWQGcj+PFBQK
	kOVFWFBtiUHM9F74J/cIFIyUbFayneUooqDaxyUdRS5R+Y3+muZMSLuYsmNMMFE+FeTwe/DvJdC
	qqQeMuNI8MofV2NKBF2QjarR05i3Uh0o8THgZW33sJFsyLyAWGUE1bYXTB0UiaHP61/pjzwrMlX
	hnWED71zh5V3aYIspi4MBoeMOEXq1rq8JZEYN2nkGR6WFohw9gVewr5Mb817KIKYLlAFM+iCfwq
	qwbHEAFMZkEQsxIWabOPXdtvh/gmE0TM9xmbffc4Cbypu34n7O2k2g39YxAgXkviURVF7/zxQ4Z
	Qz4xR6lpTugatPT8bWHLCDHWP3Li35j/e90z287ogYm1PPWTRTQHyYbhyFYdvRmvaZzGj0UBtJW
	6rXxvxQ46D0Jbt1RfghAqxhU9nP6WEKa1oBDydNSUVcVYl0U8nMSyh/tiRUS7pdXrlfwrOHsOeG
	qk0OsEHMrHuX0V0AAc35zZvRXKNjudqgMhhPTVo7BLunIf8EITb
X-Received: by 2002:a17:903:4405:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2beb0758814mr299325935ad.17.1779976365551;
        Thu, 28 May 2026 06:52:45 -0700 (PDT)
Received: from localhost ([1.39.75.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm127792595ad.2.2026.05.28.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:52:45 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: greybus: vibrator: return device_create() errors
Date: Thu, 28 May 2026 13:52:21 +0000
Message-ID: <20260528135229.2816-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_vibrator_probe() maps any device_create() failure to -EINVAL. This
loses the real errno returned by the driver core, such as -ENOMEM, and
makes probe failures harder to diagnose correctly.

Return PTR_ERR(dev) instead so callers receive the actual failure reason
while preserving the existing cleanup path.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/greybus/vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 0ec4d317c..763c234fb 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -161,7 +161,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	dev = device_create(&vibrator_class, &bundle->dev,
 			    MKDEV(0, 0), vib, "vibrator%d", vib->minor);
 	if (IS_ERR(dev)) {
-		retval = -EINVAL;
+		retval = PTR_ERR(dev);
 		goto err_ida_remove;
 	}
 	vib->dev = dev;
-- 
2.54.0.windows.1


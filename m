Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2732BDC16
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064306; cv=none; b=cwMUPrxHcikWqSeDLmYtVcH7fw06GhBmTzZ5vVftmAXU20emAjb8CVobRfE1aG8t3QQflGGnctckwlFHjWkzWaTLLD1SaWSOF96CrsLY4dgxjBDGGlTJZlBInbZXhXcMfM5VLZu5dB3/xGMk8Sgk6u9Sz1hDP09DjA2Lp8+L41U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064306; c=relaxed/simple;
	bh=ra8DPuKOfNSD/vi+y92NjbdOPEDPwFgnDaIse7a3rU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhRCac7xfPb3v9JrAFsNBQCKWyU70+9LWwsSea1eFHaySbkHrvSSiFbmzSWNiGEWC62VGRLNzQ/eUT4GcUGfufDVyq+NHs7sL0Zy6S19BBlggtcirbl4SjfWF+hyoBNQ/eg7AEU2+ujF7HYP+wNAnTJI7J/Hj86U6sv6iOlu080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4UCAwbs; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4UCAwbs"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0c09bb78cso1017795ad.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770064304; x=1770669104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=U4UCAwbshFl5jU0gd8ZqazEFbFuuTHC752LKifdFtC/9LkTOFsJJ6R25rvFzbaD4Al
         VXCDuHZZBBq7iT3PBYR6Rx5yfxgO/tGMOGk3UmlhSt5y6IUfu32c2XCSDOKnP/I7jgmt
         bpjRMaEm33G3fAlO8x2bccnIN4rL52d9R8SjFPnCKe8zn5GuzyAV9YuZ/zy1Rbx5eJoC
         ZQsmkGEzgPmvC6ESor5+De+BFgrZ/fRsNkeKbMBJ0QZgZ2hXIVZW8Le5zVWs6nj/9D3y
         w8TQXhHoAkdbZaagaJwShPq/SY0jnwSmJ8GfBPVnUS2m+8IvXIcAkdiOD2f2r/u8EcHa
         g+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064304; x=1770669104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HZzBfrwkMBEPlZbMZ1LEVwggfU84xN1x/wOQpuSV+8=;
        b=axSEyKtovA+2w5ZHk7gS69WoCg7nLtBg/ZNxOiYlggwonpiLIoHinlM4yMk7joW0w+
         5kZmWx0Vgp567hO4REtlpEXKnolaPs0zqGTGsc9dykyz96nFNBJLznPi1Ljug7Q6YEOi
         jAuQYdW8/lBNuIOC6qDlplEHrOAzjh8FSz9a9IdYoM0QOQN8Dh8psLpFeI/mzgHIc0X6
         n99lNUh6AQIQiBEElHGkgEFn9VYH4NxSwh4ED+pCiqyhXLqFyI8Ub1BG416zV5UXUQIW
         HCKsZNZwwDHQBKdSND8flQg3hdS0MMPk/kCDLfBgwqVRRqu6kIR3ilmq63dMgiNj9G4z
         NqNg==
X-Forwarded-Encrypted: i=1; AJvYcCWywXPG0yVk8tLbKJP1EEFPoRcgNAO2AehsifLd0KJQm69hlUMCYY9qI/80NPJvtniMD2CUgf0aqmptJqlD@lists.linux.dev
X-Gm-Message-State: AOJu0YyXxcmb55SYlv7SKZihjtreNQfa6KxgsGU9c70F//LhmgeQkkVR
	Pq46IyVYJSA1SksfHwpyjggNdyjPxwAewX58wBOtiNajCq7WERmp3MMN
X-Gm-Gg: AZuq6aLwVFmFfq3gW9H6q3uQtba6bzj7GZ3HiKUIZKnmvO8zt15hhr6tZd8l+iY8O1N
	G/zhnq5nhdtRgHKa9mTK5aUP62m+5hL2PyMg7ZrPt7jI4NFTJxdzm2Mg09iVZMTeyitBapryLAf
	+6MmEdwR9eCKJkJwFp6MkRiJ4pPqe0GH1X739Cp6lzEA2bhJr6lJUXeOpykJdXIQvfVUFsA09nh
	PBp+88tuYcSSMlB/Fvg0xFVxw/0cbeYyL8v2u3JXOlkxPgh8HmanvDekn4gbkwse2HzD7l84b39
	doFu05Yb8q0mKixjCcwAJae4YjHUPnVejp2ljyno4Xjp2fwgr+bgJXlk6NCmQFMJgST8hMB4oQS
	XZN/zaATYCBgVGz/mNh4h2V/XxeKqORTtLiZ5vCDbNsVGujQIOGDdAeqbaxPrFG5ysZzU1OBs5+
	ATbL88edAyFtEDC9x8Sp98Zs0VDs9B4/VhbvRmHg8=
X-Received: by 2002:a17:903:2ecd:b0:2a3:e7d3:810b with SMTP id d9443c01a7336-2a9245facf5mr5010145ad.12.1770064304347;
        Mon, 02 Feb 2026 12:31:44 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.86.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354776ab34esm351907a91.13.2026.02.02.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:31:43 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rachit Dhar <rchtdhr@gmail.com>
Subject: [PATCH 2/3] staging: greybus: resolved checkpatch checks for raw.c
Date: Mon,  2 Feb 2026 20:31:28 +0000
Message-ID: <20260202203128.160234-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added comment to mutex declaration, to resolve checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/raw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 71de6776739c..4f217f20f1c0 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -20,7 +20,7 @@ struct gb_raw {
 
 	struct list_head list;
 	int list_data;
-	struct mutex list_lock;
+	struct mutex list_lock; /* protects gb_raw->list and gb_raw->list_data */
 	dev_t dev;
 	struct cdev cdev;
 	struct device *device;
-- 
2.43.0


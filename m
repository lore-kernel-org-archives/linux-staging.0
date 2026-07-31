Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7AC440A3E
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514647; cv=none; b=jua814YjSAPZvEu71QLD+Q5qZXg75z3B/C9hLp/GukOwGngym8C7Lmq2dewXnanqpI7thj7I1JJufcYg2GYDivx3GsIOfjAEFa1lAGsaiPFbeVZ9tneM8FF567f69F48J4WaV7/6BZKehbeDKM+r/lPlNelX/mr1LPAU1VY+Txo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514647; c=relaxed/simple;
	bh=5dw8t7NiDICBtbn8fGHHub2PapuJ96cesqiy9PAh7pY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIqL4r4LGwkkjqg+zLstsHrAyPhendjPSK7d+q9RVeYasirOOEM2trgzp4Vf6cCmtQfd4M80odqI2RjVFSdUOzaBHQ4/DO+fXwh5W2KmwrPfdxoPwleV4x/aKnbIYixQm0GzvNhAnDc6ZJlu+OrKwXrPb9HhtVbRDkKgvnrX3LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vxk23Mrb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vxk23Mrb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so15399875ad.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514642; x=1786119442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bewKPbnrjrTcQjZUlJ1M30GgoqVY0S60b2kjgYZAO/A=;
        b=Vxk23MrbuSczB0f66fiAZMzgkKhPMDLi3TDF3NtpSl3X9rh9qfVITL9NgwfUcmUJTg
         /b6KpJ7i5apNIeVIsiHAvXDMyMXF8nkvt9UAIXqppSKnwFTRr/MeAbayYqNFGnJ+wXCV
         LUC2qUf8s3WsYJuAlgoAvG7F3Q/mONnhIB3S+UHMA2KWO/Yt2tk3/4jK+Qnv82aY1u5E
         1m2kP5se0/QErl/4Y6SUpjUD5rSE4zjCkQ/gHFfaGBOAQf64ib2XOxy6zO68n2i0vMny
         8ZyRIyOE0a4c3NaLGACMFhQXcKb4CIn31SuP2TRNKm6/f5VcmRMatBU6a/vhtjPZEays
         FAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514642; x=1786119442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bewKPbnrjrTcQjZUlJ1M30GgoqVY0S60b2kjgYZAO/A=;
        b=UrBeiFc6lOVGJ3jwzuArz/fXEEE8e3z+wDci3VgQSyBVkTOwjZE5F+a/39L5RLARnO
         0OMtPbxe5MyfOemhH2h2ninj7akTiH8/bP6Hl1kNJvywuN4gE53xkQPHj+XhJpiHPRqm
         E2hhen4jyg4wS7KCG6mcI3ATehxY+hBc9RgxyAem4OQmpq0H8CDIEcWyQDdDA5/fclEn
         nfmvpsSuHb+1zu/KdIqh7p9Adze0kGjjnVqNf5mUQXdQFbyQraW8QxrVNbk/DtAFlOKX
         YIJu3gqZz0MBMwia3TKgNYynCyYD3ZHB9JFOY4GFgAcJ8N19ihsHcgthEGMq3dgorsV7
         TmAQ==
X-Gm-Message-State: AOJu0YxsU0fQAJsEEtni7NDVgH5ED12I4fPbg2Vi10AGz7HiOditRbkC
	5MbGKAbBNnIN+EATmSTH1W2Q8LV7rUH0HSDt8ruX/vJb6VHjlJ8smh2afiuqYek=
X-Gm-Gg: AR+sD11t3c28qGjnoxnLabmZHWBK5JuvnKp77Gv3PFLQw6ed/bxSkq1uKZj18cdb5gK
	a3KchahR92lOTjb/QZTWWbCqX7ABz3XMjIE83rYCIoyjezfgfJilVjL/5Io8UmAlbLJTKPPMZWW
	O4ZJwLJLvW/jZPZNK29HBflDtrZ6HjnWE5aX8aN36J7Qaog/vC2h2CktbtabUkiWsffliTt0fc6
	/yI5EfO6qvCf3+UmECRs2tYGcFze50Y6erIAGyPbdcGj1e8p3c6/4GszixwWBtl63ini48LNq5J
	L088Hg07jXeXWt0tni18Q68BiylJoIqQNmRAPsMZOBrY+ezAFvsDxh427Kx8tCiDjm6BKjdty7n
	Gh82S1lingN8g1jPrJnC5aKCRBZnvxe5mdbAOI2KFhftv/TbtuvF7xIqKCNv0UiWuwLRHiRTyy1
	QK2yjxymfdPWjootaApVNEvPKW/SkT+AuZs/KwXgL8pegmb4eAKpUHzVlyj7xbkVMT8mmzs+Wic
	1QADb9caf+rvYEP2lWVxeaupKrlXVYHtcq/rTSTq2kKKqgqlZDJxVy+m3tJLf7IT2L40IflVO9o
	HKB5L5vdKiKJBoIfjqfjyig=
X-Received: by 2002:a17:902:ebc2:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2d0521a56ecmr6508995ad.10.1785514641927;
        Fri, 31 Jul 2026 09:17:21 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d27asm7258775ad.78.2026.07.31.09.17.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 09:17:21 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] staging: rtl8723bs: disable SDIO function on block size failure
Date: Sat,  1 Aug 2026 01:17:10 +0900
Message-ID: <20260731161710.44828-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdio_init() enables the SDIO function before configuring the block
size. If sdio_set_block_size() fails, the function jumps to the release
path and returns the error without disabling the SDIO function. The
caller then frees the dvobj directly, so the enabled SDIO function is
left active on that probe failure path.

Disable the SDIO function before releasing the host when block size
configuration fails.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a5ca..47e87aaf76e2 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -122,8 +122,10 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 		goto release;
 
 	err = sdio_set_block_size(func, 512);
-	if (err)
+	if (err) {
+		sdio_disable_func(func);
 		goto release;
+	}
 
 	psdio_data->block_transfer_len = 512;
 	psdio_data->tx_block_mode = 1;
-- 
2.47.1

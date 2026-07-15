Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B05481231
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135169; cv=none; b=R8HFbha1+S7RSA/hLaMNx4h1mFW7hDKIRtWvyJkRN3LMl+n5/pxAjA91+Ry8MUikBltBQP24QQxCjs5I08oC1I+YXToPyGDi6r4vBxkAxKWSiUpbNKgvcoRyrDxfqRVv/LPlWuLvf8O25jszohz6d7S9erlveOaC+gNAQ+/pIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135169; c=relaxed/simple;
	bh=FrIl14vHR3NeQFhWZzDrEKiJjvAyt7yKywOuN/rqzp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oLU8MgvNyiVNqXA3fGPQg56mIozOgatHyPE8XuQsMjBmw6CSFSKUJadUzp4F3JUmDrBRJou+if2znii0bi0aMHVCWkEo3O0eDsOpnrSWjmDgYXY1PYrNhhoqxOWHcjvyDQo1C81CouVbhmejh60/MlXkRRN/rdvhZG9L0H+rFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCZrp7cg; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCZrp7cg"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c9107baa7so58151921fa.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784135163; x=1784739963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8AZq8Na4Ehj8jFT+jkoNK+gZ++xdTPbsvU88QY0mqo=;
        b=MCZrp7cgdfrgLy7BWwqh0M5DWvhgY/xMf04iBN1B4Xud2rHfcuG1wsGxKt5BySI8d7
         JIfj0m59vOpDshdmXCgE7J6PeZ22Y8WqCNaMUJOPUluFuyytpCxyvoGX2urddjyRiQFJ
         AUnhvQUf3HHwmHd+EfsltmdF9yQdFwYH+utSHDqkVYIqc5rsVTsSDE0l9nseZIxU0VUR
         R3s/F/JITZ+3WmLUNopxWcKTeVHyOAHuN0WWe1YT0NQuG1GV0dIlmB2mR2YUDtoCPbtx
         26V+1LQq9izscYSu2dA4u9gIX2Hvbrp4K7glHwgZeHMO3sRSgGkGiU+0riNjw5+XHYvC
         8pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784135163; x=1784739963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J8AZq8Na4Ehj8jFT+jkoNK+gZ++xdTPbsvU88QY0mqo=;
        b=eNJlyM+y29JbIt7VGM5gxVsnuVJG7R8Rty1Z39TiqJ3VwvOMmLGPwOJ5WmotRgTQrl
         URoYncWuERaGNQ1FWqOtuMkRjP0M6oUvBAZ7jMVzd4YQP+nSAJyA9SG2RhDrO279n+bh
         DuOc7n1VVZ+27s8ha/H/L4OIbQQBnurXfc/vdRLRjbFlKs6JW5PQgMJ+rL0bwTovMiM/
         E6idm1z1BsKQDidB4EVYF+jZO9qf5S6A/sOmvcq+Sv/EBWhaetuZyYMtDFoij8GL+Ik3
         SdugPJI5AE607hNOqDLmbvz8pki8Ngv9BLarNt5HqdNQFSZkRAizvUC5hMmHppdQ6cl8
         SyIw==
X-Gm-Message-State: AOJu0Ywu7eEGdrgu+XKVS/fJrowsJ8p+ibhx97YN63bQ2WHixPwfTwPY
	KTP2oUQget9ZOWIcG0LRbmy5Xo9qqcHky2xPZfuxfFUPSUMgnzQaZG63wnFzL/7g8ygxlg==
X-Gm-Gg: AfdE7cn4x2y5VAa/Qk0mtq/V0Zdu27sTutipVFVcNyDbANJcMU8dLGXsIyidpcYSOXa
	vSxguP+31Sr7h0M63xstlD0TdDXBqnnWRDiK0hjs7Nwh2taT4sV33fBRckFiVucGqt5HvayulWP
	lRGE8mIwUTH93uXioV/UPL5z8aPuFwTocDjicnPTsQNq3gQxoOjaBxJgorIaKKgVw67z1Tg61PZ
	eGNIs7bl0+l0NmKo7mvdAuFWJ8kulM+V6yV6tGjfoSHJTQ0iNMxyCZZQxS1co/K5UsXzenvgCvS
	ZE5iv7pRropguAX2zeoejAEGAUwVYguEhIQZqPM1NpPzIR8phWd+15leHaDam/fLlytIbAdPfCF
	zR6LJYrd76XUrqgBeJw5//GP2UCmvdC552FQUkmvWbirgF6bVesPmfTO1xqGvLAHvKMUexBIRsA
	/t3u9y3F/OpywuDIW4fGPyVeLu8XFg4eHnvpY6lg==
X-Received: by 2002:a05:651c:88d:b0:39c:7d51:70de with SMTP id 38308e7fff4ca-39db6d4d3b3mr8133621fa.24.1784135163149;
        Wed, 15 Jul 2026 10:06:03 -0700 (PDT)
Received: from DESKTOP-PGTNBU2.localdomain ([178.131.96.22])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm37877791fa.4.2026.07.15.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:06:02 -0700 (PDT)
From: Amin Madani <aminmadani112@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Amin Madani <aminmadani112@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix spacing around ternary operator in sdio_intf.c
Date: Wed, 15 Jul 2026 20:36:06 +0330
Message-ID: <20260715170606.96002-1-aminmadani112@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around '?' and ':' in the return statement in sdio_intf.c
according to the Linux kernel coding style.

Signed-off-by: Amin Madani <aminmadani112@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a..5a257b38a 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -78,7 +78,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
-- 
2.53.0


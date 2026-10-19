Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441287;
	b=1rmPBGgwlapdYMsRjgORtd3+xYtJ1U9znijkdCPnUg2ppktAd9EFQoAtR9nUQGTfBON/
	 Pf9EQzrv4YNJ7PxfHKoe6mdsnPZ+q1ZO6LhKBGAPCtvvC6iuGU3bIFGaUT5pO6y0j1DBE
	 wcLZb2Tf+hwbtj5vPTVOQrDBcWxgf9IUNMhUB9CzKDfdxCrTUVkxOVUqtAUq3RlyZMR46
	 NvEhE2aNFGyp6kWI7I8MfjA9VrlL9a1TVpxFBEIOD6mDhaeoWrH99cXDcIOTPiqsu93NK
	 WmSzlSSYo03M5IUlMFWTK9NwrdFWbeqoxx9TEmpiYErk8HCNSF4meBWPt9re+yPJaRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
	b=VwDhbwwvhZZpcHCwkeRLNXmqoTZoaMTfwk+Ua708n3vOfh9Z4jrCX6+VRr2O7RADnfSa
	 NuoLihtL6dhWYavzST27M/Rw8QFM6sGRCT0xkhoN2EZ81AEpUbQSwRRHL2EBzJlaSbDg8
	 MSmHFDYcj6QcBNmeD7Ek9c5l0BAPjZ6J5wL192W6co5lq4+gJin+vQLIMMJGvKFgapwfT
	 Hu9orbXHZs0B2aAjwfFONQgfnJMz15iiIxu2LdfwZze6OHAmbV+an6h7fqPI6BpLU4Ej/
	 ZoJAHWKItTG4UX9NJGtS5OeEaCAjuh+dIX7mkVSxQI0KmGF3K4BBqWZW2H87H+b0NUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lv6vZ0VU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE7606A321
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 20:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1FE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lv6vZ0VU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso17815445e9.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441284; x=1793046084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
        b=Lv6vZ0VUNnB6umXYcQbgtEwYfSeWCSDPuh3wTha9ONuU3sOxG7ebves6+PuexYLeJe
         qfSByl/P4Dne/ao+RuPkq2+wTWzW2F983iEy9sxw5hqb9Wn6auWIsFMZaASpa6joy9ey
         WdwuN428CwqmaNekjJuh1FV1zEs4ZcQcBmNumZ/Phk/tMulTzBP/+NLysht6JlvAvqZu
         pHkZMjIe+vwyHR9OJzK2+VSsnaaDyZttaSw9nzG8iISI4UOWOYtPN9MQCYzmcMMRODAx
         z1eGZE6pfl/NbaSZU0C6U8WoxEFjVXGEstvMnsoxVnx9iKwz5FVh5mvisOdp42awrSI7
         8zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441284; x=1793046084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SGe5k/sxuefMjqMn88o6FMTCheBSXX/pG7tZNOtng0=;
        b=VM4OzhXMBWigvCDnUzYIs6pFSjAbGAmBiJvJN9i6Bc/Iw5mHokz4Ud2WBZUmOVYzxh
         +VLJCe4bMhDyt+kVbbvS6N/fXsIryubhAbppw+0C8K74SlVqLWOD7rbVh3aXI0yMUVOt
         XwqOKl5KtN+3RGjUNY5k00hMI4lmxod+yE9dJneP2ghaNfDdpdPGCVYex8HcBtvX42Wn
         wxH9Wkz76gPX16Mof9ICf3Se2c0Kx4GymbABzJwgaI8hw2kZ3dDZM0DPLe/Q33JpwN/x
         stNdNDO3Cpfx2IJAAAoSfT7KXNmzFt0eW8J4UVZG89z3KF6SGzmXDDmMOGny4JzYm7DA
         zrlw==
X-Forwarded-Encrypted: i=1; AKwUvBwq653n9ziKkn1Dx35tMFL6n+ih1b26zxRszGgL/ZyL2R6rlr0rUKN9l1n5jBbRwfEDZ6U0+YvstZSJI0iO@lists.linux.dev
X-Gm-Message-State: AFq9FYJrLXzx7kvAtFUofPBGq+NuZ50zZjiULLXBMoaeydvGilJKhh+A
	dhqzuEBqHusCmfDMDCsrS+Fo+wCklSH/PxXg926dC8u/4hpHRJEwMyaY
X-Gm-Gg: AYBFou3ZXrNEnLrUpuzcTkLVlQt6Qbsxm/TnEMun31PELsHRSUaXGvvuCnYrLAuvncE
	MdNyXfm71UHktI31/qNfex/z4Pc0VRE0sAr4rhVeas8tdcX4lwd94N6vPLPlVUQrTGqicPC+hyT
	Fk6nyrQmlqujumaBeFUPCiTjGXuTJUaj8hlwxHjxaDV5rS4k7IxVjAdmun25LfQipfpgx35XYhQ
	0oRxHQVS5PCASWwQeKI5htf3lV8w3Lo1r5a6sK4bnms59qmRdlYnYnDY+7XGif2n8XnTDggmJO2
	AAkk8geAULsrmrulQfJLSMZFUE7qQmdfEYhrJt79Y+50dNh0Ol+fqUlDTROo2zXM4+iMz9BCUmR
	OmB5kUCxz/bEDsSZskxdIjC15vG/ygfxGwwTpffKeoVfg5dzD3JxN2P1vO0+dURC3GyFmlak28e
	JZQW+wQKJDJd3HMo1tIr1UrqKojlqqEaX9CWvvDvM5G5doNsYsI0BOqLtxOSI/JQJ9PtEe8IDN8
	roki4KHhaGTjYl1P2kegc92Mos=
X-Received: by 2002:a05:600c:4f06:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a1e69d931cmr119638455e9.22.1792441284070;
        Mon, 19 Oct 2026 13:21:24 -0700 (PDT)
Received: from DESKTOP-0KSTGNI.localdomain ([156.213.131.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d8bsm943142f8f.24.2026.10.19.13.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:21:23 -0700 (PDT)
From: Temitope obabi <obabitemitope765@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	Temitope obabi <obabitemitope765@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Remove redundant NULL and zero assignments in probe
Date: Mon, 19 Oct 2026 23:20:15 +0300
Message-ID: <20261019202015.1724-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm750_dev structure is allocated with devm_kzalloc() just above,
so its memory is already zeroed. Remove the explicit NULL assignments
to fbinfo[0] and fbinfo[1] and the zero assignment to mtrr.vram, which
only set fields that are already zero.

Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>

---
Changes in v2:
- Remove an accidental duplicate of the note at the end of the patch.
  No code changes.

Note: Greg replied to my earlier sm750fb patch that keeping the
explicit zero assignments is good because it is clear what is
happening. In that patch the allocation was in a different function.
Here the assignments are in lynxfb_pci_probe(), just after the
devm_kzalloc() call and its NULL check, so I think removing them may
still be useful.


 drivers/staging/sm750fb/sm750.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..8702f6313f78 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -969,13 +969,10 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	if (!sm750_dev)
 		return err;
 
-	sm750_dev->fbinfo[0] = NULL;
-	sm750_dev->fbinfo[1] = NULL;
 	sm750_dev->devid = pdev->device;
 	sm750_dev->revid = pdev->revision;
 	sm750_dev->pdev = pdev;
 	sm750_dev->mtrr_off = g_nomtrr;
-	sm750_dev->mtrr.vram = 0;
 	sm750_dev->accel_off = g_noaccel;
 	spin_lock_init(&sm750_dev->slock);
 
-- 
2.53.0


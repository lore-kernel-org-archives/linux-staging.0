Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762884;
	b=Mo0AkFPnCgiL3MhhzhQbqgEVkz7IkU7AL0Eu1+41op+PWRYqoL9CXimOiCmxE/8XaL33
	 WrB1rjbZ/ZzH4JuVcJJ2fWtlJAVJIPtoBUKJI/uNuGzEaZ+SOSYt7PaI2mXwuIPB9l5Nv
	 mZFnmK89iHSFK5SVrEy73a1i4Yd/3yVEDQJQWFIGNXoRW58hQsZFn70cKXTrpaddySfda
	 D8QZs1/hXWVo9OIw77MDH67q4EP9VHYoHsG5fnkio9jhYV7hNcWm1xKzqBbg/DxjpAe4/
	 lTGRi3D7UVVoPDPieqit+m9sSalb7sqVO3x7qpfxkaUaOodvbfwM2WYv7HGeEolkZZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
	b=sdt0Ph3AXn5vqv47pGUeJWgLlIEU3eZWqIO8SNsERVsW3Vnh3PLjC/+Mr/sRcLGsmIGQ
	 by0JawqtjQPlvK8CyHNY9/escx74DBlkDot22rn+FdeLDb+hF4kHjbE/YU/RRT24HMSIY
	 gH6annt70Tr5kncxG4+O3p2U1FBZgJqjJjerlFhUwl/Q0t0EPnrLcWoqlVWHmwE+AHCh+
	 ZtbbEtm7nocXAj1d0or3N/q2lFuPhva4QQE6xhuH6qbX6+LFnxoPFkUpzgfrDKdGi2s+A
	 s8L23KSoCPou75RLBR1Dj4k+EUQfxKZI8EsLtZS7NxZWKoQUafBmBeeqWiJz5Xr8qbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kobN2e1b;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE09606A320
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 13:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE09606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kobN2e1b
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-188406bb948so709388c88.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 06:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792762883; x=1793367683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
        b=kobN2e1bUxY44ctXeeuQhlTx1kSdfpLgPOIcc3pj4x0uNMdgBorBm3eg9WGW2+7uJw
         mdBywkE3vOQ1tyivnG80iAO97svHNYc3az0G/a46cxVRFJnzFqv8NHnPlqkOEOZDJB7G
         wIDDUxkKZFo6LnKKl04Bqg/u3MClOlibnT/2XY5nY6STyfwWrU6afLKCylgqFkTSAztE
         qH0u9XI3PJtonDHo/SPrkvj+ehDlcmdCfIfy5XQm1ukWx79SQnSDw2Lx3gNovfjBopJa
         eK4cqESQr4ayu/wyrYVVyuc1HHWsyoFZlNUIFpgXAcEQU3LtRaEGUKce5ybRdEPhpaJw
         sG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762883; x=1793367683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phqTuEqnO8394NIPr/NdZ5rgqT1yFhgq/z9vwQO+5D8=;
        b=vVh13f+3J5IGccQQuZsw287a2rCw/ADD16Ar9g35A5szcKilrczang8C+J+1UJetu5
         kJbbBRCchN9BUbwNV8l1DP2ZgMfjeiIgjFy+3jveHT16jveh7muDYugi1FmfEW4BtaeB
         3kNIzF4DjeVVja3Krq+Y1ucAEPyKcBFxspDrH5GOgmq020L44IUTYOC0MA2GvuVD5C7p
         UVsv3y8CJxiHjDwTwq2P0Eq1FXdIkESRyCYU76/GhtY3tqxT0U8mdUjjYANSECEBLAQ7
         FDMBAR4OAc9dH0PzgkuCMDf0Gc822FhZ5bNj+UVfPIMrjkQy7vRqS5tCtPeHO8Wkf4sh
         TaPA==
X-Forwarded-Encrypted: i=1; AKwUvBxAX+E61ayNNyv7TssDr3Za+1WWNt1V9RQNkLoA10NbXHjv0uPOCDMH7f8E5jPa6hLbsTqxoMNlxnEOBA5m@lists.linux.dev
X-Gm-Message-State: AFq9FYLJGdyd8aiq+Z+hglGMA3xgSoVzDNHo75rf0PIgCLXRvQUtGsA0
	aRb+aSs5XbBss7pC2sv2bmBp23vRIAM9aGwT/JodzPcKtWiVUIQ7V0BT
X-Gm-Gg: AYBFou0bEvuyfmvpvynhZIjJ45/HswxBT55CDPuJiWS0HiHgMj8VBIIbBwPgUWXIsfi
	8Ti9SCgglwwByGc12KaBkDkgJzC7i7Op+5c6Znn0gF/drrPKTd0s3M/fhTEboSJsWF2C9iwwppe
	mnKG7H8s4rNknsZ2QDHPFPiDiSQQNKPuw0bS0T4YLgML/B5eFqhYUchW2dKXcS3twnOdAXq1lyw
	I5OPu34PDIWY17luSiho+D7BDTvvbGGWJl2SN/TY+x1+HF0Yx1SNpZcNXB51ayg8GJG+f/hi6tJ
	qGsiHFaq668Gj5cA+tJ/9H1v52FoQWRHdRWrBz8ZaXhpu7B4Nyfu8RGZTXklTTmgTFL90MMqKEt
	I0ONF6l2haES0cZuiGfoYN458gcOjBWE+yJSFvP7y4ngGA2jhu0dQt9GZmO8WL2HGHEoDXovYOv
	mZ7AvNBtdcm8zxjL9Sgi1k69A5kf4E77EZWuC9yb9fVDjsoUfUY17iFodU5xkgSK/iFeitmNYig
	SmQKET4rfvL+oOYb1QZ/Pc5ozKq7gSGkSWDbxOlY6CmL3m2ykgzM0DrhEvl59Kqbi842umL6gek
	PiVLk+cwmuljqeqqA59oO9X8aHZdGfJxzDDYDq5MqleVJ9MZ6wa+JrySlkLLfwqlYelUhKxhgg=
	=
X-Received: by 2002:a05:701a:c96d:b0:14d:c7ae:85df with SMTP id a92af1059eb24-195c4f4f87amr2459003c88.12.1792762883170;
        Fri, 23 Oct 2026 06:41:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f0:d0:6f0d:26f5:851c:4268:6984])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ecb65989sm222494c88.18.2026.10.23.06.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:41:22 -0700 (PDT)
From: Torra Sowmya <sowmyatorra@gmail.com>
To: outreachy@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Use GFP_KERNEL for audio manager allocation
Date: Fri, 23 Oct 2026 19:10:46 +0530
Message-ID: <20261023134046.9678-1-sowmyatorra@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The audio manager module is created in a context that permits
sleeping. Its caller, gb_audio_manager_add(), already uses
GFP_KERNEL through ida_alloc(), and module creation subsequently
calls kobject_init_and_add().

GFP_ATOMIC is unnecessary in this context and restricts memory
reclaim. Remove the explicit flag to use the default GFP_KERNEL
allocation.

Signed-off-by: Torra Sowmya <sowmyatorra@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..8a9f7e7d1766 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -187,7 +187,7 @@ int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
 	int err;
 	struct gb_audio_manager_module *m;
 
-	m = kzalloc_obj(*m, GFP_ATOMIC);
+	m = kzalloc_obj(*m);
 	if (!m)
 		return -ENOMEM;
 
-- 
2.47.3


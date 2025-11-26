Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4172DE1E4
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 20:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190137; cv=none; b=IFaEaFH21mI8j77j5Tn7ZRoTLrGFi5GC3NEzwvEVQbhnXFxT48dkole0/3PXeVksbB8ZK6UK3yX4x6AieR6nCAfy79mknq55dfKr1tepeoshUv/l0/cdjUf0VKElw6/T2b1tI6hNlO9+mLmHa/DyYHXtJG+6vXjAkZJd4NcS4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190137; c=relaxed/simple;
	bh=6kFzF+brOTQXuobW+NcUTp4g0gbDeKJA+QTLlecaqb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soo6zLt3KMxn4pD62+MQKx25GDW6Qu9kDTOZb/gZoNGXYMDgYsn/TAVpH588jnAuTHJ97BigBJ5oz19m2GgunKZV++5nzQUIOJgsojDmqKuyB1saJ4X9OEAu1nSZqchBIX0tQWfNTK2zTbrARAFz+89XFFPRVBAksWljK4sjSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVQO1YwC; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVQO1YwC"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b72cbc24637so41308366b.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 12:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190134; x=1764794934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKMRmj80diambSKuRtSu+6yPJY7gnAaOgMUb1uFE4bk=;
        b=EVQO1YwCW0PNMjfe1E+53MG+42hzr6g1CrVc5X6vBfbgyApT/B3QNCm/RjNZi+GPd2
         YmxFA2lH3nvbcvy1+McePzTXWxckNBpJnGGWjKnpOk7scwcSpp0hZ1hXobyWsz4M72dM
         1dfUe9Yc9JA/B/g36E2b/kHp+UT/fQrjrpziZjIilBFcNwhI/TcAoxKp7g35LU8lXCbY
         KnKb95T3iI6oCLFiGW33HPUI32nG8VYqlpkJkhjRH3Jt57p+GXqeOcC12AuhqoQegTeS
         4MggG9nwAtXzFHbRwcL6tUARzjMsLrVLBgfWxW/ixX+7nmQxq675h3qOSmeFIGqN+3nh
         wWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190134; x=1764794934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKMRmj80diambSKuRtSu+6yPJY7gnAaOgMUb1uFE4bk=;
        b=FJbwuJuYo6q6Z8TlnCg/C2xM4pygoRFRFul7YoFzVV4dSYeoG2jn0D2k92JdkdLdaD
         N1dBeeozhI7WZDcUmog+FRn3i/XSmfLVAbYnmNfYL0c32OfPKiY5eFWLbqPhBxid3RSe
         +SObSC323vzx+/kiX6yvyRlUNAAH4oecy1SGgnOBUDSsCeEQp/ux3hGCDpYNlujBlXcx
         DCPdw72amSXYo0B9KON5mFYkwg5SR2yqiy5HMMjl31POlhFT0BtJzau+FwA4RNbHNfl7
         CDavTzG4mA025fpPdrJKm88UBTPYtZCaBsVODN8TKLguksKnuFd36sTgJN6wa6LzjDXp
         +ttg==
X-Forwarded-Encrypted: i=1; AJvYcCXMDVhnt0a1U90siZS0Nnn5yBy0LyY/I3F0zNiohHfcuNLcERRh1nLknX33G1t0HUFoC+a2ZjDuOD9WLRa3@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq98ngsgbj++t7t5TCjjYcA/kqH9SWaTwrrBK5BALQZEv+7Q+9
	rwcDM9C1H5FyG03jMW9cOGnInZ7fMT/dJwAwneE03KnRA5+hvCc/Fm6t
X-Gm-Gg: ASbGncsfrDDqXj1G5KkLEm1HQrwBFn4doNC5KbxGXOOAXuCtKgm4u994R2/Zo0OFiae
	rr3hbPbDTOm/uf1mYCHAJViUjEzzQio8QIe/n1TttknZHVoLirt0iedvyJCHK5w2JA/0/KQ94XU
	whEK6CtniyUZBtZlBLUgTJZAV1WZZxXF5RRy6NMcMW85w9OZMYrlnu6uE7SQIOAkZrFeVD32f8C
	0OBpdQFTpfOJv/MUVpduB0fJydAwW8PY1MjGxVYSuUDxLT+3uxKgnx3PGr7klavgP46yzhLkwZm
	AMA/CFyHPUUVKyJvvhapCOkA1kgVzJ5i4eOB1h85foG9PCX1Tlzzp0WV5+9tTOxUbMPBe0W3J+Z
	a2hWZIVdaKmzEKN7mTIWhHOoMAlNXL8h5UuRDGMNPbjv/4/dgsD+TNX8A0JzMHVApEXU8MMlhBa
	cwdvx4FljY+DDwmnBdCtTUuYAIiPjL6gOyD/k74Q==
X-Google-Smtp-Source: AGHT+IEogTCjOk0g1N+dgWcVjEa7vY07Cra/AuvySqMfyRdIgoWWUx4YPOe5vbPsZW5A8UWW76EaLA==
X-Received: by 2002:a17:907:3f9c:b0:b73:7f1c:b8d8 with SMTP id a640c23a62f3a-b767129709dmr2176794666b.0.1764190134569;
        Wed, 26 Nov 2025 12:48:54 -0800 (PST)
Received: from arch-linux (178.42.50.207.ipv4.supernova.orange.pl. [178.42.50.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363b6075sm18762864a12.10.2025.11.26.12.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:48:53 -0800 (PST)
From: Tomasz Sadowski <tsdwski@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Sadowski <tsdwski@gmail.com>
Subject: [PATCH v2] staging: fluke_gpib: use kzalloc instead of kmalloc + memset
Date: Wed, 26 Nov 2025 21:45:49 +0100
Message-ID: <20251126204838.17767-1-tsdwski@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
 - Add proper commit description
 - No changes in patch

Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.

Also use sizeof(*board->private_data) instead of repeating the struct name.
This avoids duplication and keeps the code correct if the struct name
changes in the future.

Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 3ae848e3f738..2b6ba7882dba 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -853,11 +853,10 @@ static int fluke_allocate_private(struct gpib_board *board)
 {
 	struct fluke_priv *priv;
 
-	board->private_data = kmalloc(sizeof(struct fluke_priv), GFP_KERNEL);
+	board->private_data = kzalloc(sizeof(*board->private_data), GFP_KERNEL);
 	if (!board->private_data)
 		return -ENOMEM;
 	priv = board->private_data;
-	memset(priv, 0, sizeof(struct fluke_priv));
 	init_nec7210_private(&priv->nec7210_priv);
 	priv->dma_buffer_size = 0x7ff;
 	priv->dma_buffer = kmalloc(priv->dma_buffer_size, GFP_KERNEL);
-- 
2.52.0

